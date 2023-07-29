# This file was generated, do not modify it. # hide
function minimum_sd(year, daily_mean, daily_std)
  idx = year[!, :dayofyear]
  round(minimum((year[!, :ice] .- daily_mean[idx]) ./ daily_std[idx]), digits = 3)
end

ice_year = groupby(df, :year)
        
mean_start = findfirst(df[!,:year] .== 1991)
mean_end = findlast(df[!,:year] .== 2020)

day_df = groupby(df[mean_start:mean_end, :], :dayofyear)
daily_mean, daily_std = daily_mean_and_sd(day_df)
minimum_sd(ice_year[end], daily_mean, daily_std)