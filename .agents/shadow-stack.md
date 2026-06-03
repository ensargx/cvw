# Shadow Stack Design Notes

Goal:

Protect return addresses against corruption and ROP attacks.

Current implementation location:

src/ifu/ifu.sv

Current mechanism:

* detect call instructions
* push expected return address
* detect returns
* compare expected and actual return target
* generate SStackViolationM on mismatch

Future architectural work may include:

* trap generation
* exception cause support
* CSR integration
* software visibility
* performance evaluation

Do not redesign the implementation before validation is complete.
