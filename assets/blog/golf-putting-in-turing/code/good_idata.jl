# This file was generated, do not modify it. # hide
# Instantiate the predictive model
angle_distance_3_predict = golf_angle_distance_3(x_new,similar(y_new./n_new, Missing),n_new,r,R,overshot,distance_tolerance)
posterior_predictive = predict(angle_distance_3_predict, fit_angle_distance_3)

# Ensure the ordering of the loglikelihoods matches the ordering of `posterior_predictive`
loglikelihoods = pointwise_loglikelihoods(angle_distance_3_model, fit_angle_distance_3)
names = string.(keys(posterior_predictive))
loglikelihoods_vals = getindex.(Ref(loglikelihoods), names)
# Reshape into `(nchains, nsamples, size(y)...)`
loglikelihoods_arr = permutedims(cat(loglikelihoods_vals...; dims=3), (2, 1, 3));

idata_distance = from_mcmcchains(fit_angle_distance_3;
                                 posterior_predictive=posterior_predictive,
                                 log_likelihood=Dict("ll" => loglikelihoods_arr),
                                 library="Turing",
                                 observed_data=Dict("x" => x_new,
                                                    "n" => n_new,
                                                    "raw" => y_new./n_new));
distance_loo = loo(idata_distance,pointwise=true);
println("LOO is ",round(distance_loo.loo[1],digits=2), " with an SE of ",round(distance_loo.loo_se[1],digits=2),
        " and an estimated number of parameters of ",round(distance_loo.p_loo[1],digits=2))