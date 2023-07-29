# This file was generated, do not modify it. # hide
sigma_event(n) = 1 / (2 * cdf(Normal(), -abs(n)))

mean_start = findfirst(df[!,:year] .== 1991)
mean_end = findlast(df[!,:year] .== 2020)

day_df = groupby(df[mean_start:mean_end, :], :dayofyear)
daily_mean, daily_std = daily_mean_and_sd(day_df)
min_sd = minimum_sd(ice_year[end], daily_mean, daily_std)

sigma_event(min_sd) / 365