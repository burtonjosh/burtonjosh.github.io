Chains MCMC chain (2000×14×4 Array{Float64, 3}):

Iterations        = 1001:1:3000
Number of chains  = 4
Samples per chain = 2000
Wall duration     = 2.68 seconds
Compute duration  = 2.61 seconds
parameters        = sigma_angle, sigma_distance
internals         = lp, n_steps, is_accept, acceptance_rate, log_density, hamiltonian_energy, hamiltonian_energy_error, max_hamiltonian_energy_error, tree_depth, numerical_error, step_size, nom_step_size

Summary Statistics
      parameters      mean       std      mcse   ess_bulk   ess_tail      rhat   ess_per_sec
          Symbol   Float64   Float64   Float64    Float64    Float64   Float64       Float64

     sigma_angle    0.0327    0.0151    0.0038    20.4818   112.2453    2.1376        7.8384
  sigma_distance    0.0885    0.0340    0.0085    17.3585    28.7873    3.3087        6.6431

Quantiles
      parameters      2.5%     25.0%     50.0%     75.0%     97.5%
          Symbol   Float64   Float64   Float64   Float64   Float64

     sigma_angle    0.0132    0.0168    0.0370    0.0473    0.0473
  sigma_distance    0.0422    0.0707    0.0872    0.1046    0.1379
