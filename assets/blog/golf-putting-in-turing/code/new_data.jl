# This file was generated, do not modify it. # hide
# get posterior median
med_sigma = quantile(Array(fit_angle),0.5)

threshold_angle = asin.((R-r) ./ x_new)
plot(x_new,2 .* cdf.(Normal(),threshold_angle ./ med_sigma) .- 1,color=:blue,linewidth=1.5)
scatter!(x_new,y_new ./ n_new, yerror = yerror_new,
        ylabel = "Probability of success",
        xlabel = "Distance from hole (feet)",
        title = "New data, old model",
        legend=:false,
        color=:lightblue)

savefig(joinpath(@OUTPUT, "new_data.svg")) # hide