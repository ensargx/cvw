# Shadow Stack Benchmark Results

| ELF | Variant | Runs | Avg cycles | Avg calls | Avg returns | Avg I$ hit rate | Avg I$ hits/misses | Avg D$ hit rate | Avg D$ hits/misses | Avg host elapsed (s) | Avg sim wall (s) | ROP found | ROP detections |
| --- | --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | --- | ---: |
| `examples/C/rop/hello` | with-sstack | 1 | 8604 | 64 | 64 | 99.53% | 4048/19 | 95.59% | 217/10 | 0.966853 | 0.194000 | yes | 1 |
| `examples/C/rop/hello` | without-sstack | 1 | 8604 | 64 | 64 | 99.53% | 4048/19 | 95.59% | 217/10 | 0.973994 | 0.187000 | no | 0 |
