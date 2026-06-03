# Shadow Stack Project Status

## Current State

A Shadow Stack implementation exists in:

src/ifu/ifu.sv

The implementation:

* detects calls
* detects returns
* maintains shadow return addresses
* validates return targets
* detects overflow
* detects underflow
* detects mismatches

Generated signal:

* SStackViolationM

## Verified Functionality

Implemented:

* call detection
* return detection
* shadow stack push
* shadow stack pop
* return address validation
* overflow detection
* underflow detection
* mismatch detection

Validated with `wsim --sim verilator rv64gc --elf examples/C/rop/...`:

* `rop_basic` raises `SStackViolationM` and prints `ROP DETECTED` in the testbench, then continues to `PoC`
* `rop_direct` raises `SStackViolationM` and still reaches `ROP_DIRECT_WIN`
* `rop_chain` raises `SStackViolationM` twice and still reaches `ROP_CHAIN_WIN`
* `rop_nested` raises `SStackViolationM` and still reaches `ROP_NESTED_WIN`

## Missing Functionality

No evidence currently found for:

* trap generation
* exception generation
* CauseM integration
* mcause integration
* scause integration
* dedicated shadow stack CSR support
* software-visible configuration
* software-visible status reporting
* execution prevention after `SStackViolationM`

## Available Validation Programs

examples/C/rop

Programs:

* rop_basic
* rop_direct
* rop_chain
* rop_nested

## Known Risks

* SStackViolationM currently does not stop execution in the available ROP simulations.
* Violations are currently observable through the simulation testbench print path.
* No software-visible reporting path found.
* Architectural exception handling is not wired for shadow stack violations.

## Next Goal

Validate behavior using ROP examples and determine whether violations are architectural or simulation-only.
