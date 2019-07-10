module CustomInt_FD_Test #end

using FixedPointDecimals
import FixedPointDecimals: FD

using BitIntegers

using Test

struct MyInt <: Integer
    x::Int
end

Base.promote_rule(::Type{MyInt}, ::Type{<:Number}) = MyInt
Base.promote_rule(::Type{<:Number}, ::Type{MyInt}) = MyInt
Base.promote_rule(::Type{MyInt}, ::Type{MyInt}) = MyInt

MyInt(x::MyInt) = x
Base.convert(::Type{T}, x::MyInt) where {T<:Number} = T(x.x)
Base.convert(::Type{MyInt}, x::MyInt) = x

for unary_f in (:trailing_zeros, :trailing_ones, :unsigned, :Unsigned)
    @eval Base.$unary_f(a::MyInt) = $unary_f(a.x)
end
for unary_type_f in (:widen, :typemax, )
    @eval Base.$unary_type_f(::Type{MyInt}) = $unary_type_f(Int)
end
for binary_bool_f in (:(==), :(<), :(>), :(<=), :(>=))
    @eval Base.$binary_bool_f(a::MyInt, b::MyInt) = $binary_bool_f(a.x, b.x)
end
for unary_t_f in (:(+), :(-))
    @eval Base.$unary_t_f(a::MyInt) = MyInt($unary_t_f(a.x))
end
for binary_t_f in (:(*), :(+), :(-), :(^), :(/), :(÷), :rem, :div, :xor, :fldmod, :fld, :mod, :>>)
    @eval Base.$binary_t_f(a::MyInt, b::MyInt) = MyInt($binary_t_f(a.x, b.x))
    #@eval Base.$binary_t_f(a::MyInt, b::Int) = MyInt($binary_t_f(a.x, b))
    #@eval Base.$binary_t_f(a::Int, b::MyInt) = MyInt($binary_t_f(a, b.x))
end

x = MyInt(10)
MyInt(10) * MyInt(10)
MyInt(10)^MyInt(5)

const MyFD = FD{MyInt,5}

@testset "Fails if not yet registered" begin
    # Construction fails until you register the type
    @test_throws ArgumentError MyFD(2)

    FixedPointDecimals.register_and_freeze_int_type(MyInt)

    # Afterwards, it is safe to use the type.
    @test @eval(MyFD(2)) !== nothing
end

@testset "Custom integer type in FD" begin
    @test MyFD(2.0) !== nothing
    @test MyFD(2.0) + MyFD(1) == MyFD(3)
end

Main.@code_typed (()->FixedPointDecimals.FD{MyInt, 5}(10))()
Main.@code_typed (()->FixedPointDecimals.FD{BigInt, 5}(10))()

end  # module
