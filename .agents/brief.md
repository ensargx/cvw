Read project-status.md first.

Environment is already initialized.
Never run source setup.sh.

Prefer concise output.
Prefer evidence-based conclusions.
Prefer minimal diffs.

## For long simulations:

- do not stream logs
- wait silently
- inspect final logs only

Update project-status.md when findings are verified.

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
