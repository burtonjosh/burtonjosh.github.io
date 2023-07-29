# This file was generated, do not modify it. # hide
# add in dayofyear for indexing purposes
dates = df[!,[:year, :month, :day]]
day_of_year = [dayofyear_noleap(dates[i,:]...) for i in 1:first(size(df))]
df[!,:dayofyear] = day_of_year
df = df[!, [:ice, :dayofyear, :year]]