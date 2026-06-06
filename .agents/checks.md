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

Performance Checks:

* performance logs directory created
* CoreMark run completed or failure recorded
* only rv64gc used
* only CoreMark used
* SSTACK enabled run completed or failure recorded
* SSTACK disabled run completed or failure recorded
* second-pass enabled run completed or failure recorded
* second-pass disabled run completed or failure recorded
* logs inspected with grep/rg only
* completion evidence checked
* CoreMark/MHz checked when available
* CPI checked when available
* MTIME checked when available
* MINSTRET checked when available
* cache counter evidence checked when available
* branch counter evidence checked when available
* missing measurements marked N/A
* ROP tests not used

Parameterization Checks:

* existing SSTACK enable/disable parameter searched
* if parameter exists, exact commands proposed
* if parameter does not exist, minimal parameterization patch proposed
* no edits made before APPLY THE PATCH
* config selectable
* test selectable
* output directory selectable
* SSTACK mode selectable
* wsim params/defines considered
* logs preserved per configuration

Output Handling Checks:

* performance-test output saved to logs
* long simulation logs not streamed
* final logs inspected only after simulations complete
* errors and warnings checked
* output does not break performance data collection

SSTACK Enabled/Disabled Checks:

* SSTACK enabled logs collected
* SSTACK disabled logs collected
* baseline values recorded
* SSTACK values recorded
* delta computed only when both values exist
* overhead percent computed only when both values exist
* unavailable measurements marked N/A

Status values:

PASS
FAIL
BLOCKED
NOT TESTED
N/A
