# This file was generated, do not modify it. # hide
@model function golf_angle_distance_3(x,y,n,r,R,overshot,distance_tolerance)
    sigma_angle ~ truncated(Normal(),0,Inf)
    sigma_distance ~ truncated(Normal(),0,Inf)    
    sigma_y ~ truncated(Normal(),0,Inf)

    threshold_angle = asin.((R-r) ./ x)
    p_angle = 2 .* Phi.(threshold_angle ./ sigma_angle) .- 1
    p_distance = Phi.((distance_tolerance - overshot) ./ ((x .+ overshot) .* sigma_distance)) -
        Phi.(-overshot ./ ((x .+ overshot) .* sigma_distance))
    p = p_angle .* p_distance

    for i in 1:length(n)
        y[i] ~ Normal(p[i], sqrt(p[i] * (1 - p[i]) / n[i] + sigma_y^2));
    end
    return sigma_angle*180/π
end

angle_distance_3_model = golf_angle_distance_3(x_new,y,n_new,r,R,overshot,distance_tolerance)
fit_angle_distance_3 = sample(angle_distance_3_model,NUTS(),MCMCThreads(),2000,4) # hide
fit_angle_distance_3 = sample(angle_distance_3_model,NUTS(),MCMCThreads(),2000,4)