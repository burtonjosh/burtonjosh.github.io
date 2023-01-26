# This file was generated, do not modify it. # hide
# Instantiate the predictive model
logistic_predict = golf_logistic(x,similar(y, Missing),n)
posterior_predictive = predict(logistic_predict, fit_logistic)


# Ensure the ordering of the loglikelihoods matches the ordering of `posterior_predictive`
loglikelihoods = pointwise_loglikelihoods(logistic_model, fit_logistic)
names = string.(keys(posterior_predictive))
loglikelihoods_vals = getindex.(Ref(loglikelihoods), names)

# Reshape into `(nchains, nsamples, size(y)...)`
loglikelihoods_arr = permutedims(cat(loglikelihoods_vals...; dims=3), (2, 1, 3));

# construct idata object
idata_logistic = from_mcmcchains(
    fit_logistic;
    posterior_predictive=posterior_predictive,
    log_likelihood=Dict("ll" => loglikelihoods_arr),
    library="Turing",
    observed_data=(; x, n, y)
);