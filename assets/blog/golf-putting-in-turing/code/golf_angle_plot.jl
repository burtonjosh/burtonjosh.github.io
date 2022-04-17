# This file was generated, do not modify it. # hide
# get posterior median
med_sigma = quantile(Array(fit_angle),0.5)

# select posterior samples at random
n_samples = 500
fit_samples = Array(fit_angle)
idxs = sample(1:length(fit_angle),n_samples)
posterior_draws = fit_samples[idxs]

threshold_angle = asin.((R-r) ./ x)

post_lines = [2 .* Phi.(threshold_angle ./ posterior_draws[i]) .- 1 for i in 1:n_samples]
plot(x,post_lines,color=:grey,alpha=0.08,legend=:false)
plot!(x,2 .* cdf.(Normal(),threshold_angle ./ med_sigma) .- 1,color=:blue,linewidth=1.5)

plot!(x,logistic.(meda .+ medb.*x),color=:black,linewidth=2)
annotate!(12,0.5,"Logistic regression model",8)
annotate!(5,0.35,text("Geometry based model",color=:blue,8))
scatter!(x,y ./ n, yerror = yerror,
        ylabel = "Probability of success",
        xlabel = "Distance from hole (feet)",
        title = "Comparison of both models",
        legend=:false,
        color=:lightblue)

savefig(joinpath(@OUTPUT, "comparison_plot.svg")) # hide