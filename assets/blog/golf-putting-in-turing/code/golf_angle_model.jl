# This file was generated, do not modify it. # hide
Phi(x) = cdf(Normal(),x)

@model function golf_angle(x,y,n,r,R)
    threshold_angle = asin.((R-r) ./ x)
    sigma ~ truncated(Normal(0,1),0,Inf)
    p = 2 .* Phi.(threshold_angle ./ sigma) .- 1
    for i in 1:length(n)
        y[i] ~ Binomial(n[i],p[i])
    end
    return sigma*180/π # generated quantities
end

r = (1.68 / 2) / 12;
R = (4.25 / 2) / 12;

angle_model = golf_angle(x,y,n,r,R)
fit_angle = sample(angle_model,NUTS(),MCMCThreads(),2000,4)