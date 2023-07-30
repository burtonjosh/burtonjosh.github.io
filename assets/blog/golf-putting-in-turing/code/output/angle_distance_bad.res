Chains MCMC chain (2000×14×4 Array{Float64, 3}):

Iterations        = 1001:1:3000
Number of chains  = 4
Samples per chain = 2000
Wall duration     = 25.08 seconds
Compute duration  = 25.04 seconds
parameters        = sigma_angle, sigma_distance
internals         = lp, n_steps, is_accept, acceptance_rate, log_density, hamiltonian_energy, hamiltonian_energy_error, max_hamiltonian_energy_error, tree_depth, numerical_error, step_size, nom_step_size

Summary Statistics
      parameters      mean       std      mcse   ess_bulk   ess_tail      rhat   ess_per_sec
          Symbol   Float64   Float64   Float64    Float64    Float64   Float64       Float64

     sigma_angle    0.0138    0.0016    0.0004    37.4918    21.0001    1.3165        1.4972
  sigma_distance    0.1327    0.0127    0.0031    38.0229    28.9432    1.3176        1.5184

Quantiles
      parameters      2.5%     25.0%     50.0%     75.0%     97.5%
          Symbol   Float64   Float64   Float64   Float64   Float64

     sigma_angle    0.0132    0.0133    0.0133    0.0134    0.0196
  sigma_distance    0.0942    0.1366    0.1371    0.1375    0.1383
