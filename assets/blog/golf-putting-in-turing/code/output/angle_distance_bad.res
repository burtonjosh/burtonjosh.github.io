Chains MCMC chain (2000×14×4 Array{Float64, 3}):

Iterations        = 1001:1:3000
Number of chains  = 4
Samples per chain = 2000
Wall duration     = 2.03 seconds
Compute duration  = 1.95 seconds
parameters        = sigma_angle, sigma_distance
internals         = lp, n_steps, is_accept, acceptance_rate, log_density, hamiltonian_energy, hamiltonian_energy_error, max_hamiltonian_energy_error, tree_depth, numerical_error, step_size, nom_step_size

Summary Statistics
      parameters      mean       std      mcse   ess_bulk   ess_tail      rhat   ess_per_sec
          Symbol   Float64   Float64   Float64    Float64    Float64   Float64       Float64

     sigma_angle    0.0388    0.0147    0.0037    28.0149   113.0127    1.5425       14.3446
  sigma_distance    0.0819    0.0362    0.0090    17.3784    31.6017    3.4040        8.8983

Quantiles
      parameters      2.5%     25.0%     50.0%     75.0%     97.5%
          Symbol   Float64   Float64   Float64   Float64   Float64

     sigma_angle    0.0132    0.0389    0.0473    0.0473    0.0473
  sigma_distance    0.0436    0.0534    0.0733    0.1014    0.1379
