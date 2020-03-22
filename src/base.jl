using LinearAlgebra


function commutator(A, B)
    A * B - B * A
end

# TODO: fix 1/sqrt(2) and normalization 
function is_unitary(s)
    LinearAlgebra.checksquare(s)
    s * conj_transpose(s) ≈ Id
end

# throws error if not hermitian
function is_hermitian(s)
    LinearAlgebra.checksquare(s);
    s ≈ conj_transpose(s)
end

function hermitian_test(s)
    # just reaffirms 
    @assert conj.(s') == conj.(s)'
end

function conj_transpose(s)
    conj.(transpose(s))
end

function test_conj_trans(s)
    conj_transpose(s) == s'
end

# throws error if s is not normalized
function is_normed(s)
    mag = convert.(Float64, sum(s .^ 2))
    @assert mag ≈ 1.
end

# use ⋅ ?
function inner(a, b)
    conj_transpose(a) * b
end

# todo splat n ops
# add assert equal dims
function outer(a, b)
    a * conj_transpose(b)
end

function test_outer(a, b)
    # not true
    outer(a, b) == kron(a, b)
end

function test_inner_outer(a, b)
    # the trace of the outer product is equal to the inner product
    tr(outer(a, b)) == dot(a, b)
end

# common single qubit gate defns
Id = Complex[1. 0.; 0. 1.]
X = Complex[0 1; 1 0]
Z = Complex[1 0; 0 -1]
Y = Complex[0 -1im; 1im 0]
H = Complex[1 1; 1 -1] ./ sqrt(2)
Rn(θ, n̂) = cos(θ/2) .* I - 1im*sin(θ/2)

# common states
ket_0 = Complex[1; 0]
ket_1 = Complex[0; 1]
ket_plus = Complex[1; 1] ./ sqrt(2)
ket_minus = Complex[1; -1] ./ sqrt(2)

# arbitrary 2 qubit controlled gate 
Cgate(U) = kron(outer(ket_0, ket_0), Id) + kron(outer(ket_1, ket_1), U)

function test_Cgates()
    
    CX = Complex[1 0 0 0; 0 1 0 0; 0 0 0 1; 0 0 1 0]
    CY = Complex[1 0 0 0; 0 1 0 0; 0 0 0 -1im; 0 0 1im 0]
    CZ = Complex[1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 -1]

    # fix norm before doing 
    # CH = Complex[1 0 0 0; 0 1 0 0; 0 0 0 1; 0 0 1 0]
    
    Cgate.([X, Y, Z]) == [CX, CY, CZ]
    # Cgate(H) == CH
end

function bell_states()
    β_00 = Cgate(X) * kron(H * ket_0, ket_0)
    β_01 = Cgate(X) * kron(H * ket_0, ket_1)
    β_10 = Cgate(X) * kron(H * ket_1, ket_0)
    β_11 = Cgate(X) * kron(H * ket_1, ket_1)
    β_00, β_01, β_10, β_11
end

# bell states
00: 00 + 11
10: 00 - 11
01: 01 + 10
11: 01 - 10