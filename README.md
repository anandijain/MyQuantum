# MyQuantum

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://anandijain.github.io/MyQuantum/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://anandijain.github.io/MyQuantum/dev)
[![Build Status](https://api.travis-ci.com/anandijain/MyQuantum.svg?branch=master)](https://travis-ci.com/anandijain/MyQuantum)
[![Build Status](https://ci.appveyor.com/api/projects/status/github/anandijain/MyQuantum?svg=true)](https://ci.appveyor.com/project/anandijain/MyQuantum-jl)
[![Codecov](https://codecov.io/gh/anandijain/MyQuantum/branch/master/graph/badge.svg)](https://codecov.io/gh/anandijain/MyQuantum)
[![Coveralls](https://coveralls.io/repos/github/anandijain/MyQuantum/badge.svg?branch=master)](https://coveralls.io/github/anandijain/MyQuantum?branch=master)
[![Build Status](https://api.cirrus-ci.com/github/anandijain/MyQuantum.svg)](https://cirrus-ci.com/github/anandijain/MyQuantum)

If you are new to quantum computing/never taken linear algebra, make sure you understand the different definitions.

## Basic reference

* QC is reversible, so all operators must be invertible, specifically unitary.
* The two key concepts of QIS are superposition and entanglement.

## includes

* Basics of Quantum Linear Algebra (theorems, gates, no proofs)
* Ability to play around w 1-2 qubits for learning

## todo

* fix building docs to gh-pages **(you can build docs on your own though)**
* Toffoli or n-qubit controlled unitary gate.
* use Base/LinearAlg for norming
* deutsch/deutsch-jozsa, quantum tele, superdense coding, and maybe qft
* write pauli(n) a function using kronecker δ.
* rotation about arbitrary axis
* is pure/ mixed state function
* show/test bell states are maximally entangled
* basic circuit interface with measure, single qubit gate to prod state
* show unitary + CX is universal gate set 
* add type system and standardize argument notation (op, state, prod state, etc) 

## todo (hard)

* surface coding
* autodiff with Flux/zygote

## rand

* instead of including proofs as functions, maybe create notebooks

## completed

* unitary as euler rotation (no proof)
* gen bell states
* prevented off-by-eps errors using the ≈ operator
* arbitrary 2 qubit controlled gate

