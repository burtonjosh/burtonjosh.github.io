# This file was generated, do not modify it. # hide
function plot_year_sd(
  year,
  daily_mean,
  daily_std;
  color = :black,
  label = false,
  alpha = 1.0
)
  idx = year[!, :dayofyear]
  plot(
    idx,
    (year[!, :ice] .- daily_mean[idx]) ./ daily_std[idx];
    color,
    label,
    alpha=alpha,
    lw=2
  )
end

# groupby `year` to easily plot each year
ice_year = groupby(df, :year)

# let's plot the daily standard deviation for 2010
plot_year_sd(ice_year[33], daily_mean, daily_std)
savefig(joinpath(@OUTPUT, "2010_plot.svg")) # hide