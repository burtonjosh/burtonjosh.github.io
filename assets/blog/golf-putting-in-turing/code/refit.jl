# This file was generated, do not modify it. # hide
# hideall
logistic_model = golf_logistic(x_new,y_new,n_new)
fit_logistic = sample(logistic_model,NUTS(),MCMCThreads(),2000,4)
loglikelihoods = pointwise_loglikelihoods(logistic_model, fit_logistic)

# Instantiate the predictive model
logistic_predict = golf_logistic(x_new,similar(y_new, Missing),n_new)
posterior_predictive = predict(logistic_predict, fit_logistic)

# Ensure the ordering of the loglikelihoods matches the ordering of `posterior_predictive`
names = string.(keys(posterior_predictive))
loglikelihoods_vals = getindex.(Ref(loglikelihoods), names)
# Reshape into `(nchains, nsamples, size(y)...)`
loglikelihoods_arr = permutedims(cat(loglikelihoods_vals...; dims=3), (2, 1, 3));

idata_logistic = from_mcmcchains(
    fit_logistic;
    posterior_predictive=posterior_predictive,
    log_likelihood=Dict("ll" => loglikelihoods_arr),
    library="Turing",
    observed_data=(; y_new)
)

angle_model = golf_angle(x_new,y_new,n_new,r,R)
fit_angle = sample(angle_model,NUTS(),MCMCThreads(),2000,4)
# Instantiate the predictive model
angle_predict = golf_angle(x_new,similar(y_new, Missing),n_new,r,R)
posterior_predictive = predict(angle_predict, fit_angle)

# Ensure the ordering of the loglikelihoods matches the ordering of `posterior_predictive`
loglikelihoods = pointwise_loglikelihoods(angle_model, fit_angle)
names = string.(keys(posterior_predictive))
loglikelihoods_vals = getindex.(Ref(loglikelihoods), names)
# Reshape into `(nchains, nsamples, size(y)...)`
loglikelihoods_arr = permutedims(cat(loglikelihoods_vals...; dims=3), (2, 1, 3));

idata_angle = from_mcmcchains(
    fit_angle;
    posterior_predictive=posterior_predictive,
    log_likelihood=Dict("ll" => loglikelihoods_arr),
    library="Turing",
    observed_data=(; y_new)
);