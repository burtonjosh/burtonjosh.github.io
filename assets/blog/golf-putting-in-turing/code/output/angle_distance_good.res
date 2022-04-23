Chains MCMC chain (2000×15×4 Array{Float64, 3}):

Iterations        = 1001:1:3000
Number of chains  = 4
Samples per chain = 2000
Wall duration     = 2.3 seconds
Compute duration  = 2.24 seconds
parameters        = sigma_angle, sigma_distance, sigma_y
internals         = lp, n_steps, is_accept, acceptance_rate, log_density, hamiltonian_energy, hamiltonian_energy_error, max_hamiltonian_energy_error, tree_depth, numerical_error, step_size, nom_step_size

Summary Statistics
      parameters      mean       std   naive_se      mcse         ess      rhat   ess_per_sec
          Symbol   Float64   Float64    Float64   Float64     Float64   Float64       Float64

     sigma_angle    0.0178    0.0001     0.0000    0.0000   3452.5692    1.0004     1539.2640
  sigma_distance    0.0801    0.0013     0.0000    0.0000   3364.6794    1.0006     1500.0800
         sigma_y    0.0031    0.0006     0.0000    0.0000   4429.5938    1.0010     1974.8524

Quantiles
      parameters      2.5%     25.0%     50.0%     75.0%     97.5%
          Symbol   Float64   Float64   Float64   Float64   Float64

     sigma_angle    0.0176    0.0177    0.0178    0.0179    0.0180
  sigma_distance    0.0775    0.0792    0.0801    0.0809    0.0825
         sigma_y    0.0021    0.0026    0.0030    0.0034    0.0044
