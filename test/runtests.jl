using MyQuantum
using Test

@testset "MyQuantum.jl" begin
    # Write your own tests here.
    @test is_unitary.([X, Y, Z]) == fill(true, 3)
    @test is_unitary(H) == true
    @test is_hermitian.([X, Y, Z, H]) == fill(true, 4)
    @test im * X * Z == Y
    @test H * ket_0 == ket_plus
    @test H^2 ≈ Id
    @test H == (X + Z) ./ sqrt(2) 
    @test T^4 ≈ S^2 ≈ Z
    @test test_Cgates() == true
end
