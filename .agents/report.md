# Report Template

## Stage Status

| Stage | Goal | Status | Evidence |
| ---- | ---- | ------ | -------- |
| 1 | Confirm existing performance tests run | NOT TESTED | N/A |
| 2 | Parameterize performance flow | NOT TESTED | N/A |
| 3 | Clean performance-test output handling | NOT TESTED | N/A |
| 4 | Compare SSTACK enabled vs disabled | NOT TESTED | N/A |

## Test Execution

| Test | Log | Completion Evidence | Performance Evidence | Errors/Warnings | Result |
| ---- | --- | ------------------- | -------------------- | --------------- | ------ |
| CoreMark rv64gc | N/A | N/A | N/A | N/A | NOT TESTED |

## CoreMark Metrics

| Metric | SSTACK Disabled | SSTACK Enabled | Delta | Relative % | Better Direction |
| ------ | --------------- | -------------- | ----- | ---------- | ---------------- |
| CoreMark/MHz | N/A | N/A | N/A | N/A | higher |
| CPI | N/A | N/A | N/A | N/A | lower |
| Elapsed MTIME | N/A | N/A | N/A | N/A | lower |
| Elapsed MINSTRET | N/A | N/A | N/A | N/A | lower/same |
| Load Stalls | N/A | N/A | N/A | N/A | lower |
| Store Stalls | N/A | N/A | N/A | N/A | lower |
| D-Cache Accesses | N/A | N/A | N/A | N/A | context |
| D-Cache Misses | N/A | N/A | N/A | N/A | lower |
| I-Cache Accesses | N/A | N/A | N/A | N/A | context |
| I-Cache Misses | N/A | N/A | N/A | N/A | lower |
| Branches | N/A | N/A | N/A | N/A | context |
| Branches Miss Predictions | N/A | N/A | N/A | N/A | lower |
| BTB Misses | N/A | N/A | N/A | N/A | lower |
| Jump and JR | N/A | N/A | N/A | N/A | context |
| RAS Wrong | N/A | N/A | N/A | N/A | lower |
| Returns | N/A | N/A | N/A | N/A | context |
| BP Class Wrong | N/A | N/A | N/A | N/A | lower |

## SSTACK Performance Comparison

| Test | Metric | SSTACK Disabled | SSTACK Enabled | Delta | Overhead % | Better Direction |
| ---- | ------ | --------------- | -------------- | ----- | ---------- | ---------------- |
| CoreMark | CoreMark/MHz | N/A | N/A | N/A | N/A | higher |
| CoreMark | CPI | N/A | N/A | N/A | N/A | lower |

Rules:

* use measured values only
* mark unavailable values as N/A
* tables before analysis
* use grep/rg-only log inspection
* do not invent performance numbers
* do not compute overhead unless both enabled and disabled values exist
* do not use ROP tests
