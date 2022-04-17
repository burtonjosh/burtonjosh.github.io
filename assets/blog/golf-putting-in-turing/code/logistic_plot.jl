# This file was generated, do not modify it. # hide
# get posterior median
meda, medb = [quantile(Array(fit_logistic)[:,i],0.5) for i in 1:2]

# select some posterior samples at random
n_samples = 500
fit_samples = Array(fit_logistic)
idxs = sample(axes(fit_samples,1),n_samples)
posterior_draws = fit_samples[idxs,:]

posterior_data = [logistic.(posterior_draws[i,1] .+ posterior_draws[i,2].*x) for i in 1:n_samples]
plot(x,posterior_data,color=:grey,alpha=0.08,legend=:false)

plot!(x,logistic.(meda .+ medb.*x),color=:black,linewidth=2)
scatter!(x,y ./ n, yerror = yerror,
        ylabel = "Probability of success",
        xlabel = "Distance from hole (feet)",
        title = "Fitted logistic regression",
        legend=:false,
        color=:lightblue)
savefig(joinpath(@OUTPUT, "logistic_plot.svg")) # hide