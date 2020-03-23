using Documenter, MyQuantum

makedocs(;
    modules=[MyQuantum],
    format=Documenter.HTML(),
    pages=[
        "Home" => "index.md",
    ],
    repo="https://github.com/anandijain/MyQuantum/blob/{commit}{path}#L{line}",
    sitename="MyQuantum Documentation",
    authors="Anand Jain",
    assets=String[],
)

deploydocs(;
    repo="github.com/anandijain/MyQuantum.git"
)
