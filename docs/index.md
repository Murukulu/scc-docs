# The SCC Compiler

A compiler for Golang targeting Aarch64, written in OCaml. See below for an example of OCaml.

```ocaml
let () = print_endline "Hello, World!
```

## SCC - An Architectural Overview

SCC is broken down into **three blocks**: a front end, middle end, and back end.

### The Front End

The front end converts source code into an [_intermediate representation_](https://en.wikipedia.org/wiki/Intermediate_representation).

### The Middle End

The middle end _operates on IR_, performing platform-agnostic optimisations such as dead code elimination, function inlining, etc.

### The Back End

The back end consumes the optimised IR and generates machine code.
