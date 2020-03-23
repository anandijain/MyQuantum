# common single qubit gate defns
export Id, X, Y, Z, H

"""
    Id

Single qubit Id (identity) := Complex[1. 0.; 0. 1.]
"""
Id = Complex[1. 0.; 0. 1.]

"""
    X

Single qubit X (not) := Complex[0 1; 1 0]
"""
X = Complex[0 1; 1 0]

"""
    Z

Single qubit Z (phase-flip) := Complex[1 0; 0 -1]
"""
Z = Complex[1 0; 0 -1]
"""
    Y

Single qubit Y (π rotation about Y-axis) := Complex[1 0; 0 -1]
"""
Y = Complex[0 -1im; 1im 0]

"""
    H

Single qubit H (Hadamard - single qubit QFT) := Complex[1 1; 1 -1] ./ sqrt(2)
"""
H = Complex[1 1; 1 -1] ./ sqrt(2)

"""
    Rn(θ, n̂)

Given an angle [0, 2π), and a vector n̂, 
Rn returns an operator that rotates about the n̂ axis.

"""
Rn(θ, n̂) = cos(θ/2) .* Id - 1im*sin(θ/2) * (n̂[1] * X, n̂[2] * Y, n̂[3] * Z)
