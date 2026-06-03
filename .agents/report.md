# Report Template

## Functional Validation

| Test | Violation Detected | Trap Generated | Forbidden WIN String | WIN Reached | Observed | Result |
| ---- | ------------------ | -------------- | -------------------- | ----------- | -------- | ------ |
| rop_basic | NOT TESTED | NOT TESTED | PoC | NOT TESTED | N/A | NOT TESTED |
| rop_direct | NOT TESTED | NOT TESTED | ROP_DIRECT_WIN | NOT TESTED | N/A | NOT TESTED |
| rop_chain | NOT TESTED | NOT TESTED | ROP_CHAIN_WIN | NOT TESTED | N/A | NOT TESTED |
| rop_nested | NOT TESTED | NOT TESTED | ROP_NESTED_WIN | NOT TESTED | N/A | NOT TESTED |

## Security Validation

| Scenario | Expected | Observed | Result |
| -------- | -------- | -------- | ------ |

Scenarios:

* mismatch
* overflow
* underflow
* rop_basic
* rop_direct
* rop_chain
* rop_nested

## Performance

| Test | Baseline Cycles | Shadow/Trap Cycles | Delta Cycles | Overhead % |
| ---- | --------------- | ------------------ | ------------ | ---------- |
| rop_basic | N/A | N/A | N/A | N/A |
| rop_direct | N/A | N/A | N/A | N/A |
| rop_chain | N/A | N/A | N/A | N/A |
| rop_nested | N/A | N/A | N/A | N/A |

Overhead:

shadow_cycles - baseline_cycles = delta_cycles

((shadow_cycles - baseline_cycles) / baseline_cycles) * 100

## False Positives

| Test | Runtime ROP_DETECT Count | Shutdown Artifact Count | Classification | Notes |
| ---- | ------------------------ | ----------------------- | -------------- | ----- |
| rop_basic | N/A | N/A | NOT TESTED | N/A |
| rop_direct | N/A | N/A | NOT TESTED | N/A |
| rop_chain | N/A | N/A | NOT TESTED | N/A |
| rop_nested | N/A | N/A | NOT TESTED | N/A |

Classification rules:

* runtime `ROP DETECTED` before normal completion is a real violation
* `ROP DETECTED` after clear end-of-test/shutdown evidence is a shutdown artifact
* runtime protection must stay active
* only end-of-test/shutdown artifacts may be masked or ignored

Rules:

* use measured values only
* mark unavailable values as N/A
* tables before analysis
* use grep/rg-only log inspection for validation evidence
* report forbidden WIN string presence or absence for every ROP test
