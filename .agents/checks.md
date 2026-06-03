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

Status values:

PASS
FAIL
NOT TESTED
