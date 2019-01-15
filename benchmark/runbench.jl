module FixedPointDecimals_RunBench

using PkgBenchmark, BenchmarkTools

bench_results = benchmarkpkg("FixedPointDecimals")

export_markdown(joinpath(@__DIR__, "results.md"), bench_results)

end
