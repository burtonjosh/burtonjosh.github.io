# This file was generated, do not modify it. # hide
kwargs = (color = :black, alpha = 0.2, label = false, lw = 2)

ice_year = groupby(df, :year)

plot(ice_year[1][!, :dayofyear], ice_year[1][!, :ice]; kwargs...)
for i in 2:length(ice_year)-1
    plot!(ice_year[i][!, :dayofyear], ice_year[i][!, :ice]; kwargs...)
end
plot!(ice_year[end][!, :dayofyear], ice_year[end][!, :ice], color = :red, label = "2023", lw = 2)
plot!(ice_year[39][!, :dayofyear], ice_year[39][!, :ice], color = :green, label = "2016", lw = 2)

plot!(xlabel = "Day of year", ylabel = "Antarctic ice extent (km²)")
savefig(joinpath(@OUTPUT, "quick_plot.svg")) # hide