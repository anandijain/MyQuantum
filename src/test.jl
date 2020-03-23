using MyQuantum
using LinearAlgebra

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