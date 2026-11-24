#!/usr/bin/env python3
"""Check actual AIGER behavior, including a stateful one-step delay."""
import itertools
import subprocess
import sys

binary = sys.argv[1] if len(sys.argv) > 1 else "strix"


def run(*args):
    return subprocess.run([binary, *args], check=True, text=True,
                          capture_output=True, timeout=60).stdout


def circuit(formula):
    lines = run("--aiger", "-f", formula, "--ins=req", "--outs=grant").splitlines()
    assert lines.pop(0) == "REALIZABLE", lines
    kind, _, inputs, latches, outputs, gates = lines.pop(0).split()
    assert kind == "aag" and int(inputs) == int(outputs) == 1
    inp = int(lines.pop(0))
    regs = [list(map(int, lines.pop(0).split())) for _ in range(int(latches))]
    out = int(lines.pop(0))
    ands = [list(map(int, lines.pop(0).split())) for _ in range(int(gates))]
    return inp, regs, out, ands


def simulate(net, trace):
    inp, regs, out, ands = net
    state = {r[0]: (r[2] if len(r) == 3 else 0) for r in regs}
    assert all(value in (0, 1) for value in state.values()), "Unknown initial state"
    result = []
    for bit in trace:
        values = {0: 0, inp: bit, **state}
        def value(literal):
            return values[literal & ~1] ^ (literal & 1)
        for lhs, left, right in ands:
            values[lhs] = value(left) & value(right)
        result.append(value(out))
        state = {r[0]: value(r[1]) for r in regs}
    return result


assert "HOA: v1" in run("-f", "G (grant <-> req)", "--ins=req", "--outs=grant")
for formula, delayed in [("G (grant <-> req)", False), ("G (X grant <-> req)", True)]:
    net = circuit(formula)
    for trace in itertools.product((0, 1), repeat=6):
        output = simulate(net, trace)
        assert output[1:] == list(trace[:-1]) if delayed else output == list(trace)
    print(f"PASS {formula}: all 64 six-step input traces")
for formula in ("G grant & G !grant", "G (grant <-> X req)"):
    assert run("--realizability", "-f", formula, "--ins=req", "--outs=grant").strip() == "UNREALIZABLE"
    print(f"PASS unrealizable: {formula}")
