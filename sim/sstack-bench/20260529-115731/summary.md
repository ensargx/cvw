# Shadow Stack Benchmark Results

| ELF | Variant | Runs | Avg cycles | Avg calls | Avg returns | Avg host elapsed (s) | Avg sim wall (s) | ROP detections |
| --- | --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| `examples/C/hello/hello` | with-sstack | 1 | 11590 | 101 | 100 | 0.964638 | 0.227000 | 0 |
| `examples/C/hello/hello` | without-sstack | 1 | 11590 | 101 | 100 | 0.987691 | 0.240000 | 0 |
