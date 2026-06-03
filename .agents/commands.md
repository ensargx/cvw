# Commands

Create logs:

mkdir -p logs/perf/sstack_enabled
mkdir -p logs/perf/sstack_disabled

CoreMark with SSTACK enabled:

make -C benchmarks/coremark clean
make -C benchmarks/coremark all XLEN=64 ARCH=rv64gc
wsim --sim verilator rv64gc coremark --params "SSTACK_ENABLED=1" > logs/perf/sstack_enabled/coremark_rv64gc.log 2>&1

CoreMark with SSTACK disabled:

make -C benchmarks/coremark clean
make -C benchmarks/coremark all XLEN=64 ARCH=rv64gc
wsim --sim verilator rv64gc coremark --params "SSTACK_ENABLED=0" > logs/perf/sstack_disabled/coremark_rv64gc.log 2>&1

CoreMark result inspection:

rg -n "WALLY CoreMark Results|Elapsed MTIME|Elapsed MINSTRET|COREMARK/MHz|CPI|Load Stalls|Store Stalls|D-Cache|I-Cache|Branches|BTB|RAS|BP Class|Correct operation validated|Benchmark: coremark is done" logs/perf/{sstack_enabled,sstack_disabled}/coremark_rv64gc.log 2>&1

Benchmark regression:

regression-wally --benchmark > logs/perf/benchmark_regression.log 2>&1

Benchmark regression inspection:

rg -n "embench|coremark|diff|SUCCESS|FAIL|error|warning|Regression failed|All tests ran without failures" logs/perf/benchmark_regression.log

Find existing SSTACK parameterization:

rg -n "SSTACK|SHADOW|Shadow|SStack|SStackViolationM|SHADOW_STACK|ShadowStack" src config testbench examples sim bin benchmarks

Note:

CoreMark can be run directly through `wsim` after `make all`.

For Embench, if the Makefile does not pass `--params`, Stage 2 should add a minimal `PARAMS` variable to the Embench performance flow before comparing SSTACK enabled/disabled.

Rules:

* use existing CVW performance tests only
* do not use ROP tests
* use CoreMark and Embench first
* use repo-root paths
* save logs when validating behavior
* inspect logs with grep/rg only
* do not stream long simulation logs
* inspect final logs after simulations complete
* do not disable or mask runtime shadow stack protection except through an approved SSTACK enable/disable parameter
* if no clean SSTACK enable/disable parameter exists, propose a minimal parameterization patch and stop
