@def title = "Antarctic ice extent"

\note{This blog post does not seek to minimise the climate crisis. This is primarily a post about transparency and effective communication in science. Whilst making this post someone posted an [online dashboard](https://climate-dashboard.streamlit.app/)[^maciej] where you can plot the sea ice extent interactively, whilst changing the baseline data range.}

# Investigating 6-sigma event claims about Antarctic sea ice extent

I recently saw this tweet about Antarctic sea ice extent, showing that *something really bad* is happening in 2023. I tend to get bombarded with depressing content on twitter (which seems to be a pretty average experience based on conversations with friends) so I didn't spend too long looking at this. I agree that it looks bad, but also there's no real discussion here about *solutions*, so there's not much to gain from the post.

~~~<center><blockquote class="twitter-tweet"><p lang="en" dir="ltr">Apologies in advance for not explaining this in any way, but here are the daily standard deviations for Antarctic sea ice extent for every day, 1989-2023, based on the 1991-2020 mean. Each blue line represents the SD&#39;s for a full year. Lighter is more recent.<br><br>2023 is in red. <a href="https://t.co/C4lLug9mlL">pic.twitter.com/C4lLug9mlL</a></p>&mdash; Prof. Eliot Jacobson (@EliotJacobson) <a href="https://twitter.com/EliotJacobson/status/1683535568268050432?ref_src=twsrc%5Etfw">July 24, 2023</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script></center>~~~

Then a few days later I saw another alarming post telling us that this is a "once-in-7.5-million-year event" (which is very bad), and a response questioning the methodology.

~~~<center><blockquote class="twitter-tweet"><p lang="en" dir="ltr">stats question: is it kosher to calculate dataset X as a standard deviation of dataset Y when X is not a subset of Y? (X = 2023 data series; Y = daily mean 1991-2020). How does this graph look if recalculated on data inclusive of 2021-23 (~13% of total sample size)?</p>&mdash; Regina Rini (@rinireg) <a href="https://twitter.com/rinireg/status/1683881905140137985?ref_src=twsrc%5Etfw">July 25, 2023</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script></center>~~~

I thought it was a pretty good question, since it wasn't immediately obvious to me why the daily mean should be calculated on a restricted data set and no explanation had been provided. So I looked at the image again and saw a link to the dataset, which I downloaded and had a look at.

\toc

## Acquiring and visualising the data

As a starting point, I just wanted to reproduce the posted figure to see if I'd actually understood what was being shown. There wasn't any extra information about how the figure was made, or what the exact calculations were, but I had an idea based on the title and wanted to confirm whether or not I was right.

If there's one thing I learned from my all my meetings with my PhD supervisors, it's that you can't take for granted how much explanation a plot can really need in order for it to be properly interpreted. So here I'm going to do a step-by-step breakdown of how I reproduce what *I think* is being shown.

First of all, the data can be found ~~~<a href="https://ads.nipr.ac.jp/vishop/#/extent" target="_blank" rel="nooopener noreferrer">here</a>~~~. Make sure on the right hand side in the `REGION SELECTOR` box you select `ANTARCTIC`, and then scroll down to see a button that says `Download to sea ice extent data (CSV file)`. Pick `SERIES DATASET` as the file format and then click save, and you have your file, which I saved as `antarctic.csv`.

### Importing and cleaning

```julia:import-packages
using DataFrames, CSV, Statistics, Plots, Dates, Distributions

# set up some colours for plotting
using Colors
c1 = colorant"#004488"
c2 = colorant"#DEEEEE"
col_range = range(c1, stop=c2, length=46)
```

So the first thing to do is import the csv file as a `DataFrame` and see what the columns look like. I'll just show the first 10 rows here:

```julia:load-data
df = DataFrame(CSV.File("_assets/blog/ice-extent/code/antarctic.csv"))
df[1:10, :]
```
\show{load-data}

Okay seems to make sense, the last column is what we're really interested in looking at, and we can use the date information from the other columns to help us with plotting. The name of the last column is a bit ugly so we can just rename it to `"ice"`, which is a bit easier to type.

```julia:rename
new_names = ["#num", "year", "month", "day", "time", "ice"]
rename!(df, new_names)
```

### Leap years

So far so good. Now I'm going to introduce a little trick to deal with the issue of leap years. Maybe there is a better in-built solution that someone has already implemented, but this seems to work ok. For plotting and calculation purposes it's good to make sure every day of the year has a unique value, e.g. January 1st = 1, January 2nd = 2. So what's the value for December 31st? In 2007 it's 365, but in 2008 it's 366. This is pretty annoying when it comes to indexing, so I've made a little modification to the `Dates.jl` function `dayofyear`, so that we kind of "assume" every year has a leap year, and for years that don't we just don't have any data that maps to the 60th day of the year (February 29th). 

```julia:no-leap
function dayofyear_noleap(year, month, day)
  num = dayofyear(DateTime(year, month, day))
  if year % 4 != 0 && month >= 3
      num += 1
  end
  num
end
```

Now we have this function, we can add an extra column to our `DataFrame` that corresponds to the day of the year, and get rid of the remaining columns that we won't use in plotting.

```julia:dayofyear
# add in dayofyear for indexing purposes
dates = df[!,[:year, :month, :day]]
day_of_year = [dayofyear_noleap(dates[i,:]...) for i in 1:first(size(df))]
df[!,:dayofyear] = day_of_year
df = df[!, [:ice, :dayofyear, :year]]
```

### Quick plot to investigate the data

```julia:quick-plot
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
```
\fig{quick_plot}

As we can see, there is definitely a reduction in the ice extent in 2023, compared to all the other years. I've also plotted 2016 in green, which we can see had lower ice extent than average in the latter half of the year. So this 
definitely warrants some further investigation. I won't go into other methods for analysing the data in this blog post, but rather focus on the original approach and it's claims.

## Calculating daily means and standard deviations

So now we have a nicely set up `DataFrame` and we can start doing some mean and standard deviation calculations. We want the mean and standard deviation of ice extent for each day of the year, from 1 to 366. `DataFrames.jl` has a nice function `groupby` which let's us make `GroupedDataFrame`s from grouped columns, so we can just group all of the data by day of the year:

```julia:calc-mean
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
```

Now that we have daily means, $\bar{x}$, and standard deviations, $\hat{\sigma}$, we can just compare these to the data from each year and calculate the standard deviation for a data point $x$ from day $d$ as

$$ \sigma = (x - \bar{x}_d) / \hat{\sigma}_d. $$

## Plotting

### Plotting a single year

We can plot a whole year pretty nicely with a little helper function

```julia:plot-2010
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
plot_year_sd(ice_year[33], daily_mean, daily_std; label = "2010")
plot!(xlabel = "Day of year", ylabel = "Number of standard deviations")
savefig(joinpath(@OUTPUT, "plot_2010.svg")) # hide
```
\fig{plot_2010}

So in 2010, the standard deviation of antarctic ice extent (based on data from 1991 to 2020) ranges between -1 and +2. But we're interested in seeing all of the years together, in order to make a visual comparison over time.

### Plotting all the years

Plotting all the years at once is more of the same thing and doesn't make for a very interesting discussion, so I'll just wrap it all up in a big function that takes the `DataFrame`, as well as the start and end years from which we want to calculate the daily means and standard deviations. I've also plotted 2016 in green and 2023 in red, to highlight the interesting behaviour that can be seen.

```julia:big-plot-function
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
```

## Reproducing (and modifying) the original figure

So here's the big reveal, let's have a look.

```julia:plot-reproduced
plot_yearly_sd(df; mean_start_year = 1991, mean_end_year = 2020)
plot!() # hide
savefig(joinpath(@OUTPUT, "reproduced_plot.svg")) # hide
```
\fig{reproduced_plot}

So we managed to reproduce the plot, which means my assumptions about how it was made were correct.

We can also confirm, as claimed, the 6-sigma event, which is actually more like -6.325.

```julia:six-sigma
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
```
\show{six-sigma}

This might seem like a bit of a long-winded route just to reproduce the data, but now we have a plotting function
that can show us what this looks like when we consider any subset (or indeed all) of the data! For example, it's 
super easy now to look at what happens if we include all data from 1991 upto 2023.

```julia:plot-2023
plot_yearly_sd(df; mean_start_year = 1991, mean_end_year = 2023)
plot!() # hide
savefig(joinpath(@OUTPUT, "plot_2023.svg")) # hide
```
\fig{plot_2023}

Well, this is a much different story. Now of course the 2023 data is still showing that something serious is going on with the Antarctic ice extent, but when you consider all the data, it's nowhere near a 6-sigma event. In fact we can calculate it just like we did before and see that it's roughly -3.869.

```julia:four-sigma
mean_start = findfirst(df[!,:year] .== 1991)
mean_end = findlast(df[!,:year] .== 2023)

day_df = groupby(df[mean_start:mean_end, :], :dayofyear)
daily_mean, daily_std = daily_mean_and_sd(day_df)
minimum_sd(ice_year[end], daily_mean, daily_std)
```
\show{four-sigma}

## Sigma-events

This brings us on to the "once-in-7.5-million-year event" claim (and later a ["one in 70 billion claim"](https://twitter.com/EliotJacobson/status/1685247268377804800)!!!). First of all this isn't strictly true anyway, so 
I'll talk about where this comes from and then we can calculate it for each of the sigma values we've seen.

There are two main assumptions being made here that I think make this claim misleading. The first assumption is that 
the (daily) data are Normally distributed. Well if the claim is that things are changing over time (i.e. ice extent is decreasing), this is almost certainly an unrealistic assumption. The other is that data points are independent and identically distributed, which is untrue for the same reasons.

\note{To his credit, the original poster has been met with some backlash about using this statistic, and has stated he won't continue to use it.}

[This table](https://en.wikipedia.org/wiki/68%E2%80%9395%E2%80%9399.7_rule#Table_of_numerical_values) gives the approximate frequency for a daily event with a given standard deviation value. In other words, how often we would 
expect an $n$-sigma event to occur. The probability of an $n$-sigma is given by

$$ 1 - \text{Pr} (\mu - n\sigma \leq X \leq \mu + n\sigma).$$

For 3-sigma, this is approximately equal to 0.00270, or roughly 1 in 370. So a 3-sigma event should happen, on average, once a year.

Now this function is *highly* non-linear, so a 4-sigma event should happen on average every 43 years, and a 5-sigma event should happen every 4776 years. This is getting worringly rare. Anyway, the code below calculates the likelihood of the ice extent decrease that we've seen, first only considering the data from 1991 to 2020.

```julia:reproduced-sigma
sigma_event(n) = 1 / (2 * cdf(Normal(), -abs(n)))

mean_start = findfirst(df[!,:year] .== 1991)
mean_end = findlast(df[!,:year] .== 2020)

day_df = groupby(df[mean_start:mean_end, :], :dayofyear)
daily_mean, daily_std = daily_mean_and_sd(day_df)
min_sd = minimum_sd(ice_year[end], daily_mean, daily_std)

sigma_event(min_sd) / 365
```
\show{reproduced-sigma}

Essentially, once every 10 million years. And including the data upto 2023? We see the expected frequency is actually once every 25 years. Still bad, but the statement isn't exactly.....*impactful*.

```julia:new-sigma
mean_start = findfirst(df[!,:year] .== 1991)
mean_end = findlast(df[!,:year] .== 2023)

day_df = groupby(df[mean_start:mean_end, :], :dayofyear)
daily_mean, daily_std = daily_mean_and_sd(day_df)
min_sd = minimum_sd(ice_year[end], daily_mean, daily_std)

sigma_event(min_sd) / 365
```
\show{new-sigma}

## Misleading statements create more questions than answers

So to summarise, I think really there are two key questions that need to be answered here. The first and most obvious one,

- Why were the daily means only calculated using data upto 2020?

If there's a real reason, why hasn't that been communicated? Has a specific event happened that justifies partitioning the data set at 2020?

On the website of the original poster, there actually [is a plot](https://climatecasino.net/2023/06/wtf-is-happening-an-overview/) that uses all data up to 2023. This plot shows the difference from the mean in real values, not in standard deviations. I think this is, at the very least, confusing. Why change the data range in the more recent post, and not say anything? Would the graph have gotten as much attention if the headline was "once-in-25-year" event?

And the second question,

- Is it helpful to post these graphs?

Maybe. At least, when done properly, with enough transparency about methods, I think it's necessary to communicate 
extremely pressing climate issues. It's quite clear from the data that the Antarctic ice extent is smaller than it should be at this time of year. But I also don't think these kinds of posts are useful when no clear advice or hope is given to people.

## Glimmers of hope

So on that note, I found a [job advertisement](https://twitter.com/JarnoVanhatalo/status/1684120472685023232) (also on twitter!) for a Postdoctoral researcher, focussing on modeling Antarctica's ice cover and water level. I encourage you to share this job posting, or others like it that focus on understanding complex climate problems (and hopefully communicating them effectively). The more people we have working in this area, and climate science in general, the more chance we have of continuing to survive on this planet.

~~~<center><blockquote class="twitter-tweet"><p lang="en" dir="ltr">We have a very interesting postdoc position in ocean modelling and emulation at the Faculty of Science. We look for applicants with physics, statistics and ML background 👇 (1/2)<a href="https://t.co/eSRohHXJp2">https://t.co/eSRohHXJp2</a></p>&mdash; Jarno Vanhatalo (@JarnoVanhatalo) <a href="https://twitter.com/JarnoVanhatalo/status/1684120472685023232?ref_src=twsrc%5Etfw">July 26, 2023</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script></center>~~~

## References
[^maciej]: [https://climate-dashboard.streamlit.app/](https://climate-dashboard.streamlit.app/)

{{ addcomments }}