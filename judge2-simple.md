# Benchmark Report for *FixedPointDecimals*

## Job Properties
* Time of benchmarks:
    - Target: 27 Jan 2019 - 12:22
    - Baseline: 27 Jan 2019 - 12:23
* Package commits:
    - Target: 114769
    - Baseline: 114769
* Julia commits:
    - Target: 099e82
    - Baseline: 099e82
* Julia command flags:
    - Target: None
    - Baseline: None
* Environment variables:
    - Target: None
    - Baseline: None

## Results
A ratio greater than `1.0` denotes a possible regression (marked with :x:), while a ratio less
than `1.0` denotes a possible improvement (marked with :white_check_mark:). Only significant results - results
that indicate possible regressions or improvements - are shown below (thus, an empty table means that all
benchmark results remained invariant between builds).

| ID                             | time ratio    | memory ratio |
|--------------------------------|---------------|--------------|
| `["+", "FD{Int128,2}"]`        | 1.19 (5%) :x: |   1.00 (1%)  |
| `["/", " Int128"]`             | 1.47 (5%) :x: |   1.00 (1%)  |
| `["/", "FD{ Int32,2}"]`        | 1.16 (5%) :x: |   1.00 (1%)  |
| `["div", "  Int32"]`           | 1.20 (5%) :x: |   1.00 (1%)  |
| `["div", "  Int64"]`           | 1.09 (5%) :x: |   1.00 (1%)  |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["*"]`
- `["+"]`
- `["/"]`
- `["div"]`
- `["identity"]`

## Julia versioninfo

### Target
```
Julia Version 1.0.3
Commit 099e826241 (2018-12-18 01:34 UTC)
Platform Info:
  OS: macOS (x86_64-apple-darwin14.5.0)
  uname: Darwin 18.2.0 Darwin Kernel Version 18.2.0: Mon Nov 12 20:24:46 PST 2018; root:xnu-4903.231.4~2/RELEASE_X86_64 x86_64 i386
  CPU: Intel(R) Core(TM) i9-8950HK CPU @ 2.90GHz: 
                 speed         user         nice          sys         idle          irq
       #1-12  2900 MHz    8880517 s          0 s    3883109 s   94381026 s          0 s
       
  Memory: 32.0 GB (516.4453125 MB free)
  Uptime: 3.54961e6 sec
  Load Avg:  3.01806640625  3.16748046875  3.3046875
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-6.0.0 (ORCJIT, skylake)
```

### Baseline
```
Julia Version 1.0.3
Commit 099e826241 (2018-12-18 01:34 UTC)
Platform Info:
  OS: macOS (x86_64-apple-darwin14.5.0)
  uname: Darwin 18.2.0 Darwin Kernel Version 18.2.0: Mon Nov 12 20:24:46 PST 2018; root:xnu-4903.231.4~2/RELEASE_X86_64 x86_64 i386
  CPU: Intel(R) Core(TM) i9-8950HK CPU @ 2.90GHz: 
                 speed         user         nice          sys         idle          irq
       #1-12  2900 MHz    8880897 s          0 s    3883188 s   94383409 s          0 s
       
  Memory: 32.0 GB (639.91796875 MB free)
  Uptime: 3.549634e6 sec
  Load Avg:  2.9853515625  3.1513671875  3.294921875
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-6.0.0 (ORCJIT, skylake)
```