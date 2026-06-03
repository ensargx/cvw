Read project-status.md first.

Environment is already initialized.
Never run source setup.sh.

Prefer concise output.
Prefer evidence-based conclusions.
Prefer minimal diffs.

Focus only on CVW performance testing.

Do not use ROP tests for performance testing.

## For long simulations:

- do not stream logs
- redirect logs to files
- inspect final logs only

Update project-status.md only when findings are verified.

## For RTL changes:

Never modify RTL on the first implementation attempt.

First produce:
- signal flow analysis
- affected files
- proposed patch

Wait for approval before editing code.

## Write Permission Rule

Default mode is read-only.

The agent may inspect files and propose patches.

The agent must not modify files unless the user explicitly writes:

APPLY THE PATCH

Do not treat approval of commands as approval to edit files.

## Current performance-testing stages

Work in stages. Do not try to finish everything in one response.

1. Confirm that existing CVW performance tests run.
2. Parameterize the performance test flow.
3. Ensure performance-test output is clean and does not break the harness.
4. Run performance tests with SSTACK enabled and disabled.

Do not proceed to the next stage unless the current stage is complete or blocked.

## Stage 2 build/output rule

SSTACK is controlled by the compile-time parameter:

SSTACK_ENABLED

When parameterizing the performance flow, preserve separate build outputs for SSTACK enabled and disabled configurations.

The flow should avoid rebuilding when the same configuration and parameter set was already compiled.

For Verilator, use `wsim --params` with:

- SSTACK enabled: `--params "SSTACK_ENABLED=1"`
- SSTACK disabled: `--params "SSTACK_ENABLED=0"`

Expected log layout:

- logs/perf/sstack_enabled/
- logs/perf/sstack_disabled/

Build outputs may remain under the simulator work directory if they are keyed by config + params + define hash.

Do not force a custom build directory unless the existing `wsim` cache/workdir mechanism is insufficient.
