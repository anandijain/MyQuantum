using Documenter, MyQuantum

makedocs(;
    modules=[MyQuantum],
    format=Documenter.HTML(),
    pages=[
        "Home" => "index.md",
    ],
    repo="https://github.com/anandijain/MyQuantum.jl/blob/{commit}{path}#L{line}",
    sitename="MyQuantum.jl",
    authors="Anand Jain",
    assets=String[],
)

deploydocs(;
    repo="github.com/anandijain/MyQuantum.jl",
)
