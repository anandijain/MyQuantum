using LinearAlgebra

# gate defns
Id = Complex[1. 0.; 0. 1.]
X = Complex[0 1; 1 0]
Z = Complex[1 0; 0 -1]
Y = Complex[0 -1im; 1im 0]
H = Complex[1 1; 1 -1] ./ sqrt(2)
Rn(θ, n̂) = cos(θ/2) .* I - 1im*sin(θ/2)

# common states
zero = Complex[1; 0]
one = Complex[0; 1]
plus = Complex[1; 1] ./ sqrt(2)
minus = Complex[1; -1] ./ sqrt(2)

function commutator(A, B)
    A * B - B * A
end

function is_unitary(s)
    LinearAlgebra.checksquare(s)
    round.(s * conj_transpose(s)) == Id
end

# throws error if not hermitian
function is_hermitian(s)
    LinearAlgebra.checksquare(s);
    s == conj_transpose(s)
end

function hermitian_test(s)
    # just reaffirms 
    @assert conj.(s') == conj.(s)'
end

function conj_transpose(s)
    conj.(transpose(s))
end

# throws error if s is not normalized
function is_normed(s)
    mag = convert.(Float64, sum(s .^ 2))
    @assert mag == 1 
end

# todo splat n ops
# add assert equal dims
function outer(a, b)
    a * conj_transpose(b)
end

