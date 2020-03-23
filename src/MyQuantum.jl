module MyQuantum
using LinearAlgebra

include("base.jl")
# greet() = print("Hello World!")

export is_unitary, is_hermitian, is_normed, conj_transpose, outer
export Id, X, Y, Z, H, Rn, Cgate, test_Cgates, bell_states
export ket_0, ket_1, ket_plus, ket_minus, commutator

end # module
