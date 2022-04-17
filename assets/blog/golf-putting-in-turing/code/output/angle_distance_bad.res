Chains MCMC chain (2000×14×4 Array{Float64, 3}):

Iterations        = 1001:1:3000
Number of chains  = 4
Samples per chain = 2000
Wall duration     = 3.78 seconds
Compute duration  = 3.73 seconds
parameters        = sigma_angle, sigma_distance
internals         = lp, n_steps, is_accept, acceptance_rate, log_density, hamiltonian_energy, hamiltonian_energy_error, max_hamiltonian_energy_error, tree_depth, numerical_error, step_size, nom_step_size

Summary Statistics
      parameters      mean       std   naive_se      mcse       ess       rhat   ess_per_sec
          Symbol   Float64   Float64    Float64   Float64   Float64    Float64       Float64

     sigma_angle    0.0218    0.0147     0.0002    0.0016   16.0322   312.7898        4.2959
  sigma_distance    0.1184    0.0326     0.0004    0.0035   16.0349    75.5601        4.2966

Quantiles
      parameters      2.5%     25.0%     50.0%     75.0%     97.5%
          Symbol   Float64   Float64   Float64   Float64   Float64

     sigma_angle    0.0132    0.0133    0.0133    0.0219    0.0473
  sigma_distance    0.0620    0.1171    0.1370    0.1375    0.1382
