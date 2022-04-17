# This file was generated, do not modify it. # hide
data = readdlm("_assets/blog/golf-putting-in-turing/code/golf_data_old.txt")
x, n, y = data[:,1], data[:,2], data[:,3];
yerror = sqrt.(y./n .* (1 .-y./n)./n)

scatter(x,y ./ n, yerror = yerror,
        ylabel = "Probability of success",
        xlabel = "Distance from hole (feet)",
        title = "Data on putts in pro golf",
        legend=:false,
        color=:lightblue,
        )
savefig(joinpath(@OUTPUT, "initial_data.svg")) # hide