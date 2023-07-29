Chains MCMC chain (2000×14×4 Array{Float64, 3}):

Iterations        = 1001:1:3000
Number of chains  = 4
Samples per chain = 2000
Wall duration     = 5.05 seconds
Compute duration  = 4.97 seconds
parameters        = sigma_angle, sigma_distance
internals         = lp, n_steps, is_accept, acceptance_rate, log_density, hamiltonian_energy, hamiltonian_energy_error, max_hamiltonian_energy_error, tree_depth, numerical_error, step_size, nom_step_size

Summary Statistics
      parameters      mean       std      mcse   ess_bulk   ess_tail      rhat   ess_per_sec
          Symbol   Float64   Float64   Float64    Float64    Float64   Float64       Float64

     sigma_angle    0.0234    0.0141    0.0035    21.3095   113.6074    2.0275        4.2842
  sigma_distance    0.1056    0.0367    0.0091    20.6221    34.3622    2.0184        4.1460

Quantiles
      parameters      2.5%     25.0%     50.0%     75.0%     97.5%
          Symbol   Float64   Float64   Float64   Float64   Float64

     sigma_angle    0.0132    0.0133    0.0134    0.0302    0.0473
  sigma_distance    0.0492    0.0830    0.1363    0.1373    0.1382
