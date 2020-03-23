module MyQuantum
using LinearAlgebra

include("base.jl")
include("test.jl")
# greet() = print("Hello World!")

export is_unitary, is_hermitian, is_normed, conj_transpose, outer
export Id, X, Y, Z, H, S, T, Rn, Rx, Ry, Rz, Cgate, bell_states
export ket_0, ket_1, ket_plus, ket_minus, commutator

export test_Cgates

end # module
