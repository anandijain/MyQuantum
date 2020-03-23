using MyQuantum
using LinearAlgebra
include("base.jl")


function test_gates()
    display(MyQuantum.is_hermitian.([X, Y, Z, H]))
    display(MyQuantum.is_unitary.([X, Y, Z, H]))
end


function test_conj_trans(s)
    conj_transpose(s) == s'
end

function hermitian_test(s)
    # just reaffirms 
    @assert conj.(s') == conj.(s)'
end

function test_outer(a, b)
    # not true
    outer(a, b) != kron(a, b)
end

function test_inner_outer(a, b)
    # the trace of the outer product is equal to the inner product
    tr(outer(a, b)) == dot(a, b)
end

"""
    test_Cgates()

verifies generated C-ops from Cgate() are correct using X, Y, Z, H.
returns true if equal
"""
function test_Cgates()
    CX = Complex[1 0 0 0; 0 1 0 0; 0 0 0 1; 0 0 1 0]
    CY = Complex[1 0 0 0; 0 1 0 0; 0 0 0 -1im; 0 0 1im 0]
    CZ = Complex[1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 -1]
    CH = Complex[1 0 0 0; 0 1 0 0; 0 0 1/sqrt(2) 1/sqrt(2); 0 0 1/sqrt(2) -1/sqrt(2)]
    Cgate.([X, Y, Z, H]) == [CX, CY, CZ, CH]
end