# This file was generated, do not modify it. # hide
function daily_mean_and_sd(df::GroupedDataFrame)
  n = length(df)
  daily_mean = [mean(df[i][!, :ice]) for i in 1:n]
  daily_std = [std(df[i][!, :ice]) for i in 1:n]
  
  daily_mean, daily_std
end

# find start and end indexes in the DataFrame
mean_start = findfirst(df[!,:year] .== 1991)
mean_end = findlast(df[!,:year] .== 2020)

# groupby `dayofyear` for the data restricted to the start and end indices
day_df = groupby(df[mean_start:mean_end, :], :dayofyear)
daily_mean, daily_std = daily_mean_and_sd(day_df)