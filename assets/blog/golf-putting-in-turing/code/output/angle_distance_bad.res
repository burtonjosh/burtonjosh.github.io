Chains MCMC chain (2000×14×4 Array{Float64, 3}):

Iterations        = 1001:1:3000
Number of chains  = 4
Samples per chain = 2000
Wall duration     = 2.32 seconds
Compute duration  = 2.27 seconds
parameters        = sigma_angle, sigma_distance
internals         = lp, n_steps, is_accept, acceptance_rate, log_density, hamiltonian_energy, hamiltonian_energy_error, max_hamiltonian_energy_error, tree_depth, numerical_error, step_size, nom_step_size

Summary Statistics
      parameters      mean       std      mcse    ess_bulk    ess_tail      rhat   ess_per_sec
          Symbol   Float64   Float64   Float64     Float64     Float64   Float64       Float64

     sigma_angle    0.0133    0.0001    0.0000   2195.2269   2110.3821    1.0039      967.9131
  sigma_distance    0.1373    0.0006    0.0000   2241.9928   2289.1637    1.0038      988.5330

Quantiles
      parameters      2.5%     25.0%     50.0%     75.0%     97.5%
          Symbol   Float64   Float64   Float64   Float64   Float64

     sigma_angle    0.0132    0.0132    0.0133    0.0133    0.0134
  sigma_distance    0.1362    0.1369    0.1373    0.1376    0.1383
