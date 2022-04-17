# This file was generated, do not modify it. # hide
@model function golf_logistic(x, y, n)
    a ~ Normal(0,1)
    b ~ Normal(0,1)

    p = logistic.(a .+ b .* x)
    for i in 1:length(n)
        y[i] ~ Binomial(n[i],p[i])
    end
end