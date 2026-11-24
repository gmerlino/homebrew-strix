# Strix 21.0.0 for Homebrew

[Strix](https://github.com/meyerphi/strix) synthesizes reactive controllers from
Linear Temporal Logic (LTL) specifications. This tap packages the upstream
21.0.0 release, not the unrelated AI security tool with the same name.

```sh
brew install --build-from-source gmerlino/strix/strix
brew test gmerlino/strix/strix
```

The formula targets macOS. Apple Silicon is tested; the Intel toolchain resource
is provided but has not been tested locally. Xcode Command Line Tools are needed.
Rust is a build dependency; bindgen uses the Clang library selected by `xcrun`. GraalVM Community 17.0.9 (Native Image 23.0.2),
Gradle 7.6.4 and the Java dependencies are private, SHA-256-pinned build resources.
Java compilation runs offline. No GraalVM cask, global Java configuration or Java
runtime is required to run the installed executable.

This is a compatibility build of a legacy upstream release, not an upgrade to a
new maintained Strix release. The private Java toolchain is also historical and
is used only to build the native binary. Cargo retains the upstream lockfile.

## Examples

Synthesize a controller that copies its input to its output:

```sh
strix -f 'G (grant <-> req)' --ins=req --outs=grant
```

Use `--aiger` for an AIGER circuit, or synthesize a stateful one-step delay:

```sh
strix --aiger -f 'G (X grant <-> req)' --ins=req --outs=grant
```

Check an unrealizable specification:

```sh
strix --realizability -f 'G grant & G !grant' --outs=grant
```

## Validation and patches

The Homebrew test checks version, HOA controller generation and an unrealizable
specification. For additional behavioral checks:

```sh
python3 "$(brew --repository gmerlino/strix)/tests/test_controller.py" "$(brew --prefix strix)/bin/strix"
```

This checks HOA output, evaluates generated AIGER circuits against every six-step
Boolean input trace for combinatorial and delayed controllers, and rejects both
contradictory and future-input specifications. It is a focused regression test,
not an exhaustive verification of the synthesis engine.

The formula's inline source patch:

- builds only Owl's native library with the pinned Gradle;
- uses pinned local JARs and the matching GraalVM SDK;
- uses GraalVM's default fatal C-entry-point exception handler;
- gives a generated anonymous enum a stable name for the old bindgen with modern Clang;
- preserves argument quoting and uses Apple's compiler and archive tool for the
  native static library.

The resulting executable links Owl statically and needs only macOS system
libraries. Strix is licensed under AGPLv3; bundled components have their own
licenses, as listed in upstream `AUTHORS.md`.
