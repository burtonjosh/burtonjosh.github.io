# This file was generated, do not modify it. # hide
logistic_loo = loo(idata_logistic,pointwise=true);
println("LOO estimate is ",round(logistic_loo.elpd_loo[1],digits=2), " with an SE of ",round(logistic_loo.se[1],digits=2),
        " and an estimated number of parameters of ",round(logistic_loo.p_loo[1],digits=2))