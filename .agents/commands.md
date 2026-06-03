# Commands

Run rop_basic:

wsim --sim verilator rv64gc --elf examples/C/rop/rop_basic

Run rop_direct:

wsim --sim verilator rv64gc --elf examples/C/rop/rop_direct

Run rop_chain:

wsim --sim verilator rv64gc --elf examples/C/rop/rop_chain

Run rop_nested:

wsim --sim verilator rv64gc --elf examples/C/rop/rop_nested

Create logs:

mkdir -p logs

Run with logging:

wsim --sim verilator rv64gc --elf examples/C/rop/rop_basic | tee logs/rop_basic.log

Search logs:

grep -Ei "rop|shadow|violation|trap|exception|pass|fail" logs/*.log

Rules:

* use wsim
* use repo-root paths
* save logs when validating behavior
* inspect src/ifu/ifu.sv before proposing RTL changes
