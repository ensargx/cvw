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
* `mcause`/`scause` reporting is not part of the current performance-testing goal

## Current Performance Goal

Validate and parameterize normal CVW performance tests.

Do not use ROP tests for performance testing.

The performance work should happen in stages:

1. Confirm existing CVW performance tests run.
2. Parameterize the performance test flow.
3. Ensure performance-test output is clean and does not break the harness.
4. Compare SSTACK enabled vs disabled runs.

## Performance Tests

Use only:

* CoreMark

Do not use:

* Embench
* benchmark regression
* ROP tests
* rv32* configurations

Use only:

* rv64gc
* SSTACK_ENABLED=1
* SSTACK_ENABLED=0

## Performance Measurements Needed

For CoreMark rv64gc:

* completion evidence
* Correct operation validated evidence
* Benchmark done evidence
* CoreMark/MHz
* CPI
* Elapsed MTIME
* Elapsed MINSTRET
* Load Stalls
* Store Stalls
* D-Cache Accesses
* D-Cache Misses
* I-Cache Accesses
* I-Cache Misses
* Branches
* Branches Miss Predictions
* BTB Misses
* Jump and JR
* RAS Wrong
* Returns
* BP Class Wrong
* SSTACK enabled result
* SSTACK disabled result
* delta
* relative percent

Overhead:

sstack_enabled_result - sstack_disabled_result = delta

((sstack_enabled_result - sstack_disabled_result) / sstack_disabled_result) * 100

For CoreMark/MHz, higher is better.
For CPI/cycles, lower is better.

## Known Risks

* A clean SSTACK enable/disable parameter may not yet exist.
* If no clean parameter exists, performance comparison is blocked until a minimal parameterization patch is approved.
* CoreMark and Embench may not expose the same metrics.
* Use measured values only.
* Missing values must be marked N/A.

## Next Goal

Stage 1:

Confirm that existing CVW performance tests run and produce inspectable logs.

For each test, confirm:

* log file produced
* completion evidence found
* performance metric evidence found or reported missing
* errors/warnings checked
