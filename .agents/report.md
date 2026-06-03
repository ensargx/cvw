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
| Embench rv32gc | N/A | N/A | N/A | N/A | NOT TESTED |
| benchmark regression | N/A | N/A | N/A | N/A | NOT TESTED |

## CoreMark Metrics

| Config | SSTACK Mode | CoreMark/MHz | CPI | MTIME | MINSTRET | Load Stalls | Store Stalls | D$ Misses | I$ Misses | Branch Mispredicts |
| ------ | ----------- | ------------ | --- | ----- | -------- | ----------- | ------------ | --------- | --------- | ------------------- |
| rv64gc | N/A | N/A | N/A | N/A | N/A | N/A | N/A | N/A | N/A | N/A |

## Embench Metrics

| Config | SSTACK Mode | Speed Result | Size Result | Geomean | Notes |
| ------ | ----------- | ------------ | ----------- | ------- | ----- |
| rv32gc | N/A | N/A | N/A | N/A | N/A |

## SSTACK Performance Comparison

| Test | Metric | SSTACK Disabled | SSTACK Enabled | Delta | Overhead % | Better Direction |
| ---- | ------ | --------------- | -------------- | ----- | ---------- | ---------------- |
| CoreMark | CoreMark/MHz | N/A | N/A | N/A | N/A | higher |
| CoreMark | CPI | N/A | N/A | N/A | N/A | lower |
| Embench | Speed | N/A | N/A | N/A | N/A | higher/lower depends on reported metric |
| Embench | Size | N/A | N/A | N/A | N/A | lower |

Rules:

* use measured values only
* mark unavailable values as N/A
* tables before analysis
* use grep/rg-only log inspection
* do not invent performance numbers
* do not compute overhead unless both enabled and disabled values exist
* do not use ROP tests
