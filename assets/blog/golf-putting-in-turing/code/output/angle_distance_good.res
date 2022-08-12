Chains MCMC chain (2000×15×4 Array{Float64, 3}):

Iterations        = 1001:1:3000
Number of chains  = 4
Samples per chain = 2000
Wall duration     = 2.7 seconds
Compute duration  = 2.65 seconds
parameters        = sigma_angle, sigma_distance, sigma_y
internals         = lp, n_steps, is_accept, acceptance_rate, log_density, hamiltonian_energy, hamiltonian_energy_error, max_hamiltonian_energy_error, tree_depth, numerical_error, step_size, nom_step_size

Summary Statistics
      parameters      mean       std   naive_se      mcse         ess      rhat   ess_per_sec
          Symbol   Float64   Float64    Float64   Float64     Float64   Float64       Float64

     sigma_angle    0.0178    0.0001     0.0000    0.0000   3670.8364    1.0022     1385.7442
  sigma_distance    0.0801    0.0013     0.0000    0.0000   3654.2598    1.0020     1379.4865
         sigma_y    0.0031    0.0006     0.0000    0.0000   4140.9543    1.0005     1563.2141

Quantiles
      parameters      2.5%     25.0%     50.0%     75.0%     97.5%
          Symbol   Float64   Float64   Float64   Float64   Float64

     sigma_angle    0.0176    0.0177    0.0178    0.0179    0.0180
  sigma_distance    0.0775    0.0792    0.0801    0.0810    0.0828
         sigma_y    0.0021    0.0026    0.0030    0.0034    0.0044
