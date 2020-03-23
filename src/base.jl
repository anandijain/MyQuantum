using LinearAlgebra
include("gates.jl")

# common states
ket_0 = Complex[1; 0]
ket_1 = Complex[0; 1]
ket_plus = Complex[1; 1] ./ sqrt(2)
ket_minus = Complex[1; -1] ./ sqrt(2)

# TODO
# struct Op
#     U::Matrix{Complex}
#     isUnitary::Bool
# end


"""
    conj_transpose(s)

conj_transpose is a clearer name for adjoint for students.
it is identical to `s'`
"""
function conj_transpose(s::Union{AbstractVecOrMat})
    conj.(transpose(s))
end

"""
    commutator(A, B)

commutator(A, B) := A * B - B * A
Takes in two operators, if the result is zero, the operators commute.
"""
function commutator(A, B)
    A * B - B * A
end

"""
    ops_commute(A, B)

ops_commute(A, B) := commutator(A,B) ≈ fill(0., (dim, dim)) 
for ops to commute they must be square and equal dim, so dim
    is arbitrarily size(A, 1)
"""
function ops_commute(A, B)
    if size(A) != size(B)
        return false
    end
    dim = size(A, 1)
    commutator(A,B) ≈ fill(0., (dim, dim)) 
end
    
    """
    is_unitary(s)

A unitary matrix U is defined by U†U = UU† = I.
returns true if `s` is unitary.
Note `s` must be square.
"""
# TODO: fix 1/sqrt(2) and normalization 
function is_unitary(s)
    LinearAlgebra.checksquare(s)
    s * conj_transpose(s) ≈ Id
end 

"""
    is_hermitian(s)

A hermitian matrix U is defined by U = †U.
returns true if s is hermitian.
"""
# throws error if not hermitian
function is_hermitian(s)
    LinearAlgebra.checksquare(s);
    s ≈ conj_transpose(s)
end

"""
    is_normed(s)

if sum(s .^ 2)) ≈ 1., returns true
"""
# throws error if s is not normalized
function is_normed(s)
    mag = convert.(Float64, sum(s .^ 2))
    @assert mag ≈ 1.
end

"""
    is_linear(s)


"""
function is_linear()
    
end


"""
    inner(a, b)

given two equal dimension column vectors, a and b,
returns the inner product <a|b> where <a| == conj_transpose(a)
this is a duplicate function of dot(a, b) or (a ⋅ b).
"""
# use ⋅ ?
function inner(a, b)
    conj_transpose(a) * b
end

"""
    outer(a, b)

given two equal dimension column vectors, |a> and |b>,
returns the inner product |a><b| where <b| == conj_transpose(b)
note, this function does NOT return the same as kron(a, b).
outer returns a matrix, whereas kron returns a vector
"""
# todo splat n ops
# add assert equal dims
function outer(a, b)
    a * conj_transpose(b)
end

"""
    Cgate(U)

Cgate(U) creates a controlled U gate, given a unitary U.
"""
Cgate(U) = kron(outer(ket_0, ket_0), Id) + kron(outer(ket_1, ket_1), U)

"""
    bell_states()

returns the four bell states as vectors in order of binary increasing
qubit input states (00, 01, 10, 11)
"""
function bell_states()
    # # bell states
    # 00: 00 + 11
    # 10: 00 - 11
    # 01: 01 + 10
    # 11: 01 - 10
    β_00 = Cgate(X) * kron(H * ket_0, ket_0)
    β_01 = Cgate(X) * kron(H * ket_0, ket_1)
    β_10 = Cgate(X) * kron(H * ket_1, ket_0)
    β_11 = Cgate(X) * kron(H * ket_1, ket_1)
    β_00, β_01, β_10, β_11
end


"""
    cauchy_schwarz(u, v)

given arbitrary column vectors `|u⟩, |v⟩`, we want to show that,

⟨u|u⟩⟨v|v⟩ ≥ |⟨u|v⟩|²
"""

function cauchy_schwarz(u, v)

end
# function eulerform(U)
    # thm 
    # U single qubit unitary ⟹ ∃ α, β, γ, δ ∈ ℝ, st 
    # U = exp(iα) * [exp(-i\)]
    
# end