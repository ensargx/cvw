# Shadow Stack Benchmark Results

| ELF | Variant | Runs | Avg host elapsed (s) | Avg sim wall (s) | Avg sim time (ns) | ROP detections |
| --- | --- | ---: | ---: | ---: | ---: | ---: |
| `examples/C/hello/hello` | with-sstack | 1 | 1.088191 | 0.246000 | 116.000 | 0 |
| `examples/C/rop/hello` | with-sstack | 1 | 1.063199 | 0.180000 | 86.000 | 1 |
| `examples/C/hello/hello` | without-sstack | 1 | 0.966727 | 0.225000 | 116.000 | 0 |
| `examples/C/rop/hello` | without-sstack | 1 | 0.894616 | 0.168000 | 86.000 | 0 |
