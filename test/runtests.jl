using MyQuantum
using Test

@testset "MyQuantum.jl" begin
    # Write your own tests here.
   @test is_unitary.([X, Y, Z, H]) == fill(true, 4)
   @test is_hermitian.([X, Y, Z, H]) == fill(true, 4)
end
