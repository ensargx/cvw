# CORE-V-WALLY Shadow Stack

Bu proje, [CORE-V-WALLY](https://github.com/openhwgroup/cvw) işlemcisine donanımsal bir **shadow stack** ekler. Fonksiyon dönüş adresleri ayrı bir donanım yığınında tutulur ve dönüş sırasında kontrol edilir. Adreslerin uyuşmaması durumunda olası ROP saldırısı tespit edilir.

> Bu çalışma deneysel niteliktedir ve standart bir RISC-V extension değildir.

## Ortamın Hazırlanması

Proje dizinine girip CORE-V Wally ortamını etkinleştirin:

```bash
cd cvw
source setup.sh
```

Kurulumun çalıştığını doğrulamak için:

```bash
make -C examples/C/hello

wsim --sim verilator rv64gc \
  --elf examples/C/hello/hello
```

## Shadow Stack’i Açma ve Kapatma

Shadow stack, `SSTACK_ENABLED` parametresiyle kontrol edilir.

Açık:

```bash
wsim --sim verilator rv64gc \
  --elf /path/to/program \
  --params "SSTACK_ENABLED=1"
```

Kapalı:

```bash
wsim --sim verilator rv64gc \
  --elf /path/to/program \
  --params "SSTACK_ENABLED=0"
```

## ABI ve ROP Doğrulama Testleri

Bu testler performans ölçmek için değil, shadow stack mekanizmasının doğru çalıştığını doğrulamak için kullanılır.

Test programlarını derleyin:

```bash
make -C examples/C/rop clean
make -C examples/C/rop all
```

### Normal ABI Testi

Normal fonksiyon çağrıları, iç içe çağrılar, recursion ve function pointer çağrılarında yanlış ROP tespiti oluşmadığını kontrol eder.

```bash
wsim --sim verilator rv64gc \
  --elf examples/C/rop/sstack_abi_normal \
  --params "SSTACK_ENABLED=1"
```

Beklenen çıktı:

```text
SSTACK_ABI_NORMAL_PASS
```

`ROP DETECTED` çıktısı oluşmamalıdır.

### ROP Testleri

Kullanılan saldırı senaryoları:

| ELF                       | Açıklama                                           |
| ------------------------- | -------------------------------------------------- |
| `rop_basic`               | Buffer overflow ile dönüş adresini değiştirir      |
| `rop_chain`               | Zincirleme ROP yönlendirmesini test eder           |
| `sstack_abi_ret5_corrupt` | Beş seviyeli çağrı zincirinde dönüş adresini bozar |

Örneğin temel ROP testini shadow stack kapalı çalıştırmak için:

```bash
wsim --sim verilator rv64gc \
  --elf examples/C/rop/rop_basic \
  --params "SSTACK_ENABLED=0"
```

Beklenen saldırı çıktısı:

```text
PoC
```

Aynı testi shadow stack açık çalıştırmak için:

```bash
wsim --sim verilator rv64gc \
  --elf examples/C/rop/rop_basic \
  --params "SSTACK_ENABLED=1"
```

Beklenen çıktı:

```text
ROP DETECTED
```

Diğer senaryolar aynı şekilde çalıştırılabilir:

```bash
wsim --sim verilator rv64gc \
  --elf examples/C/rop/rop_chain \
  --params "SSTACK_ENABLED=1"

wsim --sim verilator rv64gc \
  --elf examples/C/rop/sstack_abi_ret5_corrupt \
  --params "SSTACK_ENABLED=1"
```

Beklenen sonuçlar:

| Test                      | SSTACK kapalı             | SSTACK açık    |
| ------------------------- | ------------------------- | -------------- |
| `rop_basic`               | `PoC`                     | `ROP DETECTED` |
| `rop_chain`               | `ROP_CHAIN_WIN`           | `ROP DETECTED` |
| `sstack_abi_ret5_corrupt` | `SSTACK_RET5_CORRUPT_WIN` | `ROP DETECTED` |

## Performans Testi

Performans testi ROP programlarıyla değil, **CoreMark** benchmark’ı ile yapılır. Aynı CoreMark binary dosyası shadow stack açık ve kapalı durumda çalıştırılarak sonuçlar karşılaştırılır.

CoreMark’ı derleyin:

```bash
make -C benchmarks/coremark clean
make -C benchmarks/coremark all XLEN=64 ARCH=rv64gc
```

Log dizinlerini oluşturun:

```bash
mkdir -p logs/perf/sstack_disabled
mkdir -p logs/perf/sstack_enabled
```

Shadow stack kapalı:

```bash
wsim --sim verilator rv64gc coremark \
  --params "PrintHPMCounters=1 SSTACK_ENABLED=0" \
  > logs/perf/sstack_disabled/coremark_rv64gc.log 2>&1
```

Shadow stack açık:

```bash
wsim --sim verilator rv64gc coremark \
  --params "PrintHPMCounters=1 SSTACK_ENABLED=1" \
  > logs/perf/sstack_enabled/coremark_rv64gc.log 2>&1
```

Sonuçları görüntülemek için:

```bash
grep -nE \
  "COREMARK/MHz|CPI|Elapsed MTIME|Elapsed MINSTRET|Load Stalls|Store Stalls|D-Cache|I-Cache|Branches|BTB|RAS|Returns" \
  logs/perf/*/coremark_rv64gc.log
```

İncelenen başlıca metrikler:

* CoreMark/MHz
* CPI
* MTIME ve MINSTRET
* Load ve store stall sayıları
* Instruction ve data cache sayaçları
* Branch prediction sayaçları
* Call ve return sayıları

Bu çalışmada elde edilen temel sonuçlar:

| Metrik           | SSTACK kapalı | SSTACK açık |
| ---------------- | ------------: | ----------: |
| CoreMark/MHz     |          2.87 |        2.87 |
| CPI              |          1.12 |        1.12 |
| Elapsed MTIME    |     3,477,779 |   3,477,779 |
| Elapsed MINSTRET |     3,080,751 |   3,080,751 |

Simülasyon sonuçlarında çalışma zamanı performans farkı görülmemiştir. Alan kullanımı, güç tüketimi ve sentez maliyeti bu performans testinin kapsamı dışındadır.

## Ana Dosyalar

Shadow stack implementasyonu:

```text
src/ifu/ifu.sv
```

Trap entegrasyonu:

```text
src/privileged/trap.sv
```

ABI ve ROP testleri:

```text
examples/C/rop/
```

## Lisans ve Haklar

Bu proje, OpenHW Group tarafından geliştirilen CORE-V-WALLY projesi temel alınarak hazırlanmıştır:

* Orijinal proje: [openhwgroup/cvw](https://github.com/openhwgroup/cvw)

Orijinal kaynak dosyalarındaki yazar, telif hakkı ve lisans bildirimleri korunmaktadır.

```text
SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
```

Kaynak kodların kullanım koşulları için [`LICENSE`](LICENSE) dosyasına bakın.

Akademik proje çalışmasına ilişkin hak bildirimi:

```text
© Yıldız Teknik Üniversitesi Bilgisayar Mühendisliği Bölümü
```
