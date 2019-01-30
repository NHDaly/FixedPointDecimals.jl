include("runbench.jl")

using PkgBenchmark

Base.@ccallable function julia_main()::Cint
    f="$(@__DIR__)/output.txt"
    PkgBenchmark._benchinfo("Running benchmarks...")
    PkgBenchmark._runbenchmark_local("$(@__DIR__)/benchmarks.jl", f, "tune.json", false)
    #end
    #br = FixedPointDecimals_RunBench.judgebench("HEAD", "HEAD")
    return 0
end
