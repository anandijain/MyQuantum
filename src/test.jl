using MyQuantum

function test_gates()
    display(MyQuantum.is_hermitian.([X, Y, Z, H]))
    display(MyQuantum.is_unitary.([X, Y, Z, H]))
end