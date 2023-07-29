# This file was generated, do not modify it. # hide
mean_start = findfirst(df[!,:year] .== 1991)
mean_end = findlast(df[!,:year] .== 2023)

day_df = groupby(df[mean_start:mean_end, :], :dayofyear)
daily_mean, daily_std = daily_mean_and_sd(day_df)
minimum_sd(ice_year[end], daily_mean, daily_std)