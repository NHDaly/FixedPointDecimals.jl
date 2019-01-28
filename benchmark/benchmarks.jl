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

benchtypes = [
    FixedPointDecimals.FixedDecimal{Int32,  2},
    FixedPointDecimals.FixedDecimal{Int64,  2},
    FixedPointDecimals.FixedDecimal{Int128, 2},
]

identity1(a,_) = a
allops = (*, /, +, ÷, identity1)

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
    for T in benchtypes
        print("$T ")

        initial_value = zero(T)
        a = one(T)

        # For some reason this is necessary to eliminate mysterious "1 allocation"
        SUITE[opname(op)][type(T)] = @benchmarkable $op($a,$a)
    end
end
