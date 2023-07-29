# This file was generated, do not modify it. # hide
# this is the same as the previous function but adds to a plot with `plot!`, rather than creating a new one
function plot_year_sd!(
  year,
  daily_mean,
  daily_std;
  color = :black,
  label,
  alpha = 1.0
)
  idx = year[!, :dayofyear]
  plot!(
    idx,
    (year[!, :ice] .- daily_mean[idx]) ./ daily_std[idx];
    color,
    label,
    alpha=alpha,
    lw=2
  )
end

function plot_yearly_sd(df; mean_start_year = 1991, mean_end_year = 2020)
  mean_start = findfirst(df[!,:year] .== mean_start_year)
  mean_end = findlast(df[!,:year] .== mean_end_year)
  
  # group by :dayofyear to calculate daily mean and sd
  day_df = groupby(df[mean_start:mean_end, :], :dayofyear)
  daily_mean, daily_std = daily_mean_and_sd(day_df)
  
  # group by :year to plot each year    
  ice_year = groupby(df, :year)
          
  plot_year_sd(ice_year[1], daily_mean, daily_std; color=col_range[1], label=false, alpha=0.75)
  for i in 2:length(ice_year)-1
    plot_year_sd!(ice_year[i], daily_mean, daily_std; color = col_range[i], label=false, alpha=0.75)
  end
  plot_year_sd!(ice_year[39], daily_mean, daily_std; color=:green, label=2016)
  plot_year_sd!(ice_year[end], daily_mean, daily_std; color=:red, label=2023)
  plot!(
    title = "Daily standard deviation for Antarctic sea ice extent: 1978-2023 \n Based on $mean_start_year - $mean_end_year daily mean",
    ylabel = "Number of standard deviations",
    xlabel = "Day of year",
    ylim = (-6.75, 3.5),
    titlefont = font(11)
  )
  hline!([0, 366], color=:black, label=false)
end