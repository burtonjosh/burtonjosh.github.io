# This file was generated, do not modify it. # hide
using DataFrames, CSV, Statistics, Plots, Dates, Distributions

# set up some colours for plotting
using Colors
c1 = colorant"#004488"
c2 = colorant"#DEEEEE"
col_range = range(c1, stop=c2, length=46)