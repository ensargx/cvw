# Shadow Stack Benchmark Results

| ELF | Variant | Runs | Avg cycles | Avg calls | Avg returns | Avg host elapsed (s) | Avg sim wall (s) | ROP found | ROP detections |
| --- | --- | ---: | ---: | ---: | ---: | ---: | ---: | --- | ---: |
| `examples/C/rop/hello` | with-sstack | 1 | 8604 | 64 | 64 | 0.966197 | 0.181000 | yes | 1 |
| `examples/C/rop/hello` | without-sstack | 1 | 8604 | 64 | 64 | 0.942404 | 0.171000 | no | 0 |
