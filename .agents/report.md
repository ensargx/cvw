# Report Template

## Functional Validation

| Test | Expected | Observed | Result |
| ---- | -------- | -------- | ------ |

## Security Validation

| Scenario | Expected | Observed | Result |
| -------- | -------- | -------- | ------ |

Scenarios:

* mismatch
* overflow
* underflow
* rop_direct
* rop_chain
* rop_nested

## Performance

| Test | Baseline Cycles | Shadow Cycles | Overhead % |
| ---- | --------------- | ------------- | ---------- |

Overhead:

((shadow_cycles - baseline_cycles) / baseline_cycles) * 100

Rules:

* use measured values only
* mark unavailable values as N/A
* tables before analysis
