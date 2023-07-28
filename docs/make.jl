using SFilters
using Documenter

DocMeta.setdocmeta!(SFilters, :DocTestSetup, :(using SFilters); recursive=true)

makedocs(;
    modules=[SFilters],
    authors="Naoki Maeda <naoki.maeda.jp@gmail.com> and contributors",
    repo="https://github.com/nmaedajp/SFilters.jl/blob/{commit}{path}#{line}",
    sitename="SFilters.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://nmaedajp.github.io/SFilters.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/nmaedajp/SFilters.jl",
    devbranch="main",
)
