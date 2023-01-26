# This file was generated, do not modify it. # hide
# Instantiate the predictive model
angle_predict = golf_angle(x,similar(y, Missing),n,r,R)
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
    observed_data=(;x, n, y)
);

angle_loo = loo(idata_angle,pointwise=true);
println("LOO is ",round(angle_loo.elpd_loo[1],digits=2), " with an SE of ",round(angle_loo.se[1],digits=2),
        " and an estimated number of parameters of ",round(angle_loo.p_loo[1],digits=2))