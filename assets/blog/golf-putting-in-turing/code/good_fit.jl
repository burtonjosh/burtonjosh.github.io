# This file was generated, do not modify it. # hide
# get posterior median
med_sigma_angle, med_sigma_distance, _ = [quantile(Array(fit_angle_distance_3)[:,i],0.5) for i in 1:3]

threshold_angle = asin.((R-r) ./ x_new)

p_angle = 2 .* Phi.(threshold_angle ./ med_sigma_angle) .- 1
p_distance = Phi.((distance_tolerance - overshot) ./ ((x_new .+ overshot) .* med_sigma_distance)) -
    Phi.(-overshot ./ ((x_new .+ overshot) .* med_sigma_distance))
post_line = p_angle .* p_distance

plot(x_new,post_line,color=:blue,legend=:false)

scatter!(x_new,y, yerror = yerror_new,
        ylabel = "Probability of success",
        xlabel = "Distance from hole (feet)",
        title = "Angle and distance model (good fit)",
        legend=:false,
        color=:blue)

savefig(joinpath(@OUTPUT, "good_fit.svg")) # hide