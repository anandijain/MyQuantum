# common single qubit gate defns
export Id, X, Y, Z, H, S, T, Rn, Rx, Ry, Rz

"""
    Id

Single qubit Id (identity) := ComplexF64[1. 0.; 0. 1.]
"""
Id = ComplexF64[1. 0.; 0. 1.]

"""
    X

Single qubit X (not) := ComplexF64[0 1; 1 0]
"""
X = ComplexF64[0 1; 1 0]

"""
    Z

Single qubit Z (phase-flip) := ComplexF64[1 0; 0 -1]
"""
Z = ComplexF64[1 0; 0 -1]

"""
    Y

Single qubit Y (π rotation about Y-axis) := ComplexF64[1 0; 0 -1]
"""
Y = ComplexF64[0 -1im; 1im 0]

"""
    H

Single qubit H `(Hadamard - single qubit QFT)` := ComplexF64[1 1; 1 -1] ./ sqrt(2)
"""
H = ComplexF64[1 1; 1 -1] ./ sqrt(2)

"""
    S

Single qubit S `(== Z^2)` := ComplexF64[1 0; 0 im] 
"""
S = ComplexF64[1 0; 0 im]

"""
    T

Single qubit T `(π/8 gate, == Z^4)` := ComplexF64[1 0; 0 exp(im * π/4)] 
"""
T = ComplexF64[1 0; 0 exp(im * π/4)]

"""
    Rn(θ, n̂)

Rn returns an operator that rotates a qubit about the n̂ axis.
Given an angle [0, 2π) in radians, and a normed vector n̂, 
"""
Rn(θ, n̂) = cos(θ/2) .* Id - 1im*sin(θ/2) .* (n̂[1] * X + n̂[2] * Y + n̂[3] * Z)

# TODO: generate instead of manual 
Rx(θ) = cos(θ/2) .* Id - 1im*sin(θ/2) .* X 
Ry(θ) = cos(θ/2) .* Id - 1im*sin(θ/2) .* Y 
Rz(θ) = cos(θ/2) .* Id - 1im*sin(θ/2) .* Z 
