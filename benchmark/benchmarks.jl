# Decimal Representation Comparisons
#
# This benchmark compares the performance of several numeric representations, over various
# numeric operations (+,-,*,/,÷...) on large arrays of numbers, in order to guide
# decision-making about how to represent fixed-decimal numbers.
#
# It compares fixed-decimal types against the builtin Int and Float types of various sizes.
# The output is written to a .csv file in the same directory as this file.

using FixedPointDecimals
using Random
using BenchmarkTools

# Define a parent BenchmarkGroup to contain our suite
const SUITE = BenchmarkGroup()

decimal_precision = 2

# Express that data through the various types. Round it for integers.
fd_FixedPointDecimal_types = [
    FixedPointDecimals.FixedDecimal{Int32, decimal_precision},
    FixedPointDecimals.FixedDecimal{Int64, decimal_precision},
    FixedPointDecimals.FixedDecimal{Int128, decimal_precision},
]
inttypes = [Int32,Int64,Int128]
floattypes = [Float32,Float64]
#bigtypes = [BigInt, BigFloat]

alltypes = (inttypes..., floattypes..., fd_FixedPointDecimal_types...,)

identity1(a,_) = a
allops = (*, /, +, ÷, identity1)

# Category for the results output CSV
category(::Type{<:Union{inttypes...}}) = "Int"
category(::Type{<:Union{floattypes...}}) = "Float"
#category(::Type{<:Union{bigtypes...}}) = "Big"
category(::Type{<:FixedPointDecimals.FixedDecimal}) = "FixedDecimal"
type(T::Type) = "$T"
type(T::Type{<:Union{Int32, Int64}}) = "  $T"
type(T::Type{Int128}) = " $T"
type(::Type{FixedPointDecimals.FixedDecimal{T,f}}) where {T,f} = "FD{$T,$f}"
type(::Type{FixedPointDecimals.FixedDecimal{T,f}}) where {T<:Union{Int32,Int64},f} = "FD{ $T,$f}"
opname(f) = string(Symbol(f))
opname(f::typeof(identity1)) = "identity"

# Define the benchmark structure
for op in allops
    SUITE[opname(op)] = BenchmarkGroup()
end

for op in allops
    println()
    println("$op")
    for T in alltypes
        print("$T ")

        initial_value = zero(T)
        a = one(T)

        # For some reason this is necessary to eliminate mysterious "1 allocation"
        SUITE[opname(op)][type(T)] = @benchmarkable $op($a,$a)
    end
end
