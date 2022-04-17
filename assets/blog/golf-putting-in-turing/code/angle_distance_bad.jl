# This file was generated, do not modify it. # hide
@model function golf_angle_distance_2(x,y,n,r,R,overshot,distance_tolerance)
    sigma_angle ~ truncated(Normal(),0,Inf)
    sigma_distance ~ truncated(Normal(),0,Inf)

    threshold_angle = asin.((R-r) ./ x)

    p_angle = 2 .* Phi.(threshold_angle ./ sigma_angle) .- 1
    p_distance = Phi.((distance_tolerance - overshot) ./ ((x .+ overshot) .* sigma_distance)) -
        Phi.(-overshot ./ ((x .+ overshot) .* sigma_distance))
    p = p_angle .* p_distance

    for i in 1:length(n)
        y[i] ~ Binomial(n[i],p[i])
    end
    return sigma_angle*180/π
end

overshot = 1
distance_tolerance = 3

angle_distance_2_model = golf_angle_distance_2(x_new, y_new, n_new, r, R, overshot, distance_tolerance)
fit_angle_distance_2 = sample(angle_distance_2_model,NUTS(),MCMCThreads(),2000,4) # hide
fit_angle_distance_2 = sample(angle_distance_2_model,NUTS(),MCMCThreads(),2000,4)