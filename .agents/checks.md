# Validation Checklist

Before RTL changes:

* identify affected modules
* explain issue
* verify current behavior

After RTL changes:

* compile succeeds
* simulation succeeds
* no new warnings
* existing functionality preserved

Shadow Stack Checks:

* call push works
* return pop works
* mismatch detected
* overflow detected
* underflow detected
* nested calls work
* ROP examples behave as expected
* trap generated after shadow stack violation
* `CauseM` uses shadow stack cause when observable
* `mcause`/`scause` value recorded when observable

ROP Trap Validation:

* `rop_basic` detects violation
* `rop_basic` generates trap
* `rop_basic` does not reach `PoC`
* `rop_direct` detects violation
* `rop_direct` generates trap
* `rop_direct` does not reach `ROP_DIRECT_WIN`
* `rop_chain` detects violation
* `rop_chain` generates trap
* `rop_chain` does not reach `ROP_CHAIN_WIN`
* `rop_nested` detects violation
* `rop_nested` generates trap
* `rop_nested` does not reach `ROP_NESTED_WIN`

Performance Checks:

* baseline cycles recorded
* shadow/trap cycles recorded
* delta cycles computed
* overhead percent computed
* unavailable measurements marked N/A

False-Positive Checks:

* shutdown-only `ROP DETECTED` classified separately
* runtime `ROP DETECTED` not ignored
* runtime protection remains active
* only end-of-test/shutdown artifacts may be masked or ignored

Log Inspection Rules:

* use grep/rg-only log inspection
* check violation evidence
* check trap evidence
* check forbidden WIN strings
* check cycle evidence
* check shutdown artifact evidence

Status values:

PASS
FAIL
NOT TESTED
