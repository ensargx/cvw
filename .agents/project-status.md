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

Current trap integration:

* `src/privileged/trap.sv` accepts `SStackViolationM`
* `SStackViolationM` contributes to `ExceptionM`
* `TrapM` is generated from exceptions when not blocked by `CommittedF`
* `CauseM` uses custom `SHADOW_STACK_CAUSE = 5'd16` for shadow stack violations
* `mcause`/`scause` reporting must still be validated from logs or architectural observation

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

Historical validation before trap integration with `wsim --sim verilator rv64gc --elf examples/C/rop/...`:

* `rop_basic` raises `SStackViolationM` and prints `ROP DETECTED` in the testbench, then continues to `PoC`
* `rop_direct` raises `SStackViolationM` and still reaches `ROP_DIRECT_WIN`
* `rop_chain` raises `SStackViolationM` twice and still reaches `ROP_CHAIN_WIN`
* `rop_nested` raises `SStackViolationM` and still reaches `ROP_NESTED_WIN`

## Missing Functionality

No evidence currently found for:

* dedicated shadow stack CSR support
* software-visible configuration
* software-visible status reporting
* validated `mcause`/`scause` value for shadow stack traps
* validated execution prevention after `SStackViolationM`

## Available Validation Programs

examples/C/rop

Programs:

* rop_basic
* rop_direct
* rop_chain
* rop_nested

## Known Risks

* Trap integration exists in RTL, but functional validation must prove that ROP payloads no longer reach WIN strings.
* Violations are observable through the simulation testbench print path as `ROP DETECTED`.
* No software-visible reporting path found.
* ABI/testbench shutdown may produce bogus late `ROP DETECTED` output.
* Runtime protection must remain active; only end-of-test/shutdown artifacts may be masked or ignored.

## Next Goal

Validate trap-integrated behavior using:

* `rop_basic`
* `rop_direct`
* `rop_chain`
* `rop_nested`

For each test, confirm:

* violation detected
* trap generated
* forbidden WIN string not reached
* total cycles measured
* cycle overhead computed against baseline
* any end-of-test/shutdown artifact classified separately from runtime violations
