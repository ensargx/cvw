# Commands

Run rop_basic:

wsim --sim verilator rv64gc --elf examples/C/rop/rop_basic

Run rop_direct:

wsim --sim verilator rv64gc --elf examples/C/rop/rop_direct

Run rop_chain:

wsim --sim verilator rv64gc --elf examples/C/rop/rop_chain

Run rop_nested:

wsim --sim verilator rv64gc --elf examples/C/rop/rop_nested

ROP tests:

* rop_basic
* rop_direct
* rop_chain
* rop_nested

Create logs:

mkdir -p logs

Run with logging examples:

wsim --sim verilator rv64gc --elf examples/C/rop/rop_basic | tee logs/rop_basic.log
wsim --sim verilator rv64gc --elf examples/C/rop/rop_direct | tee logs/rop_direct.log
wsim --sim verilator rv64gc --elf examples/C/rop/rop_chain | tee logs/rop_chain.log
wsim --sim verilator rv64gc --elf examples/C/rop/rop_nested | tee logs/rop_nested.log

Search logs for violation and trap evidence:

rg -n "ROP DETECTED|SStackViolationM|TrapM|ExceptionM|CauseM|mcause|MCAUSE|cause" logs/rop_*.log

Search logs for forbidden WIN strings:

rg -n "PoC|ROP_DIRECT_WIN|ROP_CHAIN_WIN|ROP_NESTED_WIN" logs/rop_*.log

Per-test forbidden WIN checks:

rg -n "PoC" logs/rop_basic.log
rg -n "ROP_DIRECT_WIN" logs/rop_direct.log
rg -n "ROP_CHAIN_WIN" logs/rop_chain.log
rg -n "ROP_NESTED_WIN" logs/rop_nested.log

Count detected violations:

rg -c "ROP DETECTED" logs/rop_basic.log logs/rop_direct.log logs/rop_chain.log logs/rop_nested.log

Search logs for cycle and completion evidence:

rg -n "cycles|Mcycle|Minstret|SUCCESS|FAIL|Single Elf file tests are not signatured verified" logs/rop_*.log

Inspect trap integration source:

rg -n "SStackViolationM|SHADOW_STACK_CAUSE|ExceptionM|TrapM|CauseM" src/privileged/trap.sv src/privileged/csr.sv src/privileged/csrm.sv src/privileged/csrs.sv

Inspect testbench print/shutdown evidence:

rg -n "ROP DETECTED|SStackViolationM|finish|Single Elf file tests|cycles|Mcycle|Minstret" testbench/testbench.sv testbench/common/*.sv

Rules:

* use wsim
* use repo-root paths
* save logs when validating behavior
* inspect logs with grep/rg only
* do not stream long simulation logs
* inspect final logs after simulations complete
* classify `ROP DETECTED` after clear end-of-test/shutdown evidence as shutdown artifact
* do not disable or mask runtime shadow stack protection
* inspect src/ifu/ifu.sv before proposing RTL changes
