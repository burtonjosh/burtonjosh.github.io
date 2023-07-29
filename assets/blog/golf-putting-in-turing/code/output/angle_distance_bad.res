Chains MCMC chain (2000×14×4 Array{Float64, 3}):

Iterations        = 1001:1:3000
Number of chains  = 4
Samples per chain = 2000
Wall duration     = 36.27 seconds
Compute duration  = 36.19 seconds
parameters        = sigma_angle, sigma_distance
internals         = lp, n_steps, is_accept, acceptance_rate, log_density, hamiltonian_energy, hamiltonian_energy_error, max_hamiltonian_energy_error, tree_depth, numerical_error, step_size, nom_step_size

Summary Statistics
      parameters      mean       std      mcse   ess_bulk   ess_tail      rhat   ess_per_sec
          Symbol   Float64   Float64   Float64    Float64    Float64   Float64       Float64

     sigma_angle    0.0308    0.0166    0.0042    22.2854   170.5807    1.8910        0.6158
  sigma_distance    0.0845    0.0459    0.0114    18.4874    24.2572    2.5273        0.5109

Quantiles
      parameters      2.5%     25.0%     50.0%     75.0%     97.5%
          Symbol   Float64   Float64   Float64   Float64   Float64

     sigma_angle    0.0132    0.0133    0.0334    0.0473    0.0473
  sigma_distance    0.0399    0.0402    0.0673    0.1370    0.1380
