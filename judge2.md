# Benchmark Report for *FixedPointDecimals*

## Job Properties
* Time of benchmarks:
    - Target: 27 Jan 2019 - 10:44
    - Baseline: 27 Jan 2019 - 10:45
* Package commits:
    - Target: a58dbf
    - Baseline: a58dbf
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

| ID                             | time ratio                    | memory ratio |
|--------------------------------|-------------------------------|--------------|
| `["*", "FD{ Int64,2}"]`        |  0.78 (5%) :white_check_mark: |   1.00 (1%)  |
| `["+", "FD{ Int32,2}"]`        | -5.57 (5%) :white_check_mark: |   1.00 (1%)  |
| `["+", "FD{ Int64,2}"]`        | -0.06 (5%) :white_check_mark: |   1.00 (1%)  |
| `["+", "FD{Int128,2}"]`        |  0.03 (5%) :white_check_mark: |   1.00 (1%)  |
| `["div", "FD{ Int32,2}"]`      |                 2.09 (5%) :x: |   1.00 (1%)  |
| `["div", "FD{ Int64,2}"]`      |  0.92 (5%) :white_check_mark: |   1.00 (1%)  |
| `["div", "FD{Int128,2}"]`      |  0.92 (5%) :white_check_mark: |   1.00 (1%)  |
| `["identity", "FD{ Int64,2}"]` |  0.83 (5%) :white_check_mark: |   1.00 (1%)  |

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
       #1-12  2900 MHz    8856979 s          0 s    3873485 s   94133947 s          0 s

  Memory: 32.0 GB (158.0234375 MB free)
  Uptime: 3.543707e6 sec
  Load Avg:  2.583984375  2.892578125  3.2109375
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
       #1-12  2900 MHz    8858051 s          0 s    3873694 s   94141307 s          0 s

  Memory: 32.0 GB (66.25 MB free)
  Uptime: 3.543779e6 sec
  Load Avg:  3.962890625  3.20458984375  3.298828125
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-6.0.0 (ORCJIT, skylake)
```
