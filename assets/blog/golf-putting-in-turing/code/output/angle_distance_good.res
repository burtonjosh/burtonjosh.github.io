Chains MCMC chain (2000×15×4 Array{Float64, 3}):

Iterations        = 1001:1:3000
Number of chains  = 4
Samples per chain = 2000
Wall duration     = 4.05 seconds
Compute duration  = 3.99 seconds
parameters        = sigma_angle, sigma_distance, sigma_y
internals         = lp, n_steps, is_accept, acceptance_rate, log_density, hamiltonian_energy, hamiltonian_energy_error, max_hamiltonian_energy_error, tree_depth, numerical_error, step_size, nom_step_size

Summary Statistics
      parameters      mean       std   naive_se      mcse         ess      rhat   ess_per_sec
          Symbol   Float64   Float64    Float64   Float64     Float64   Float64       Float64

     sigma_angle    0.0178    0.0001     0.0000    0.0000   3544.8549    1.0004      889.3264
  sigma_distance    0.0801    0.0013     0.0000    0.0000   3598.7065    1.0002      902.8366
         sigma_y    0.0031    0.0006     0.0000    0.0000   4682.5987    1.0006     1174.7613

Quantiles
      parameters      2.5%     25.0%     50.0%     75.0%     97.5%
          Symbol   Float64   Float64   Float64   Float64   Float64

     sigma_angle    0.0176    0.0177    0.0178    0.0179    0.0180
  sigma_distance    0.0776    0.0792    0.0801    0.0809    0.0827
         sigma_y    0.0021    0.0026    0.0030    0.0034    0.0044
