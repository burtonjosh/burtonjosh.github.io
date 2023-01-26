Chains MCMC chain (2000×14×4 Array{Float64, 3}):

Iterations        = 1001:1:3000
Number of chains  = 4
Samples per chain = 2000
Wall duration     = 1.82 seconds
Compute duration  = 1.79 seconds
parameters        = sigma_angle, sigma_distance
internals         = lp, n_steps, is_accept, acceptance_rate, log_density, hamiltonian_energy, hamiltonian_energy_error, max_hamiltonian_energy_error, tree_depth, numerical_error, step_size, nom_step_size

Summary Statistics
      parameters      mean       std   naive_se      mcse       ess       rhat   ess_per_sec
          Symbol   Float64   Float64    Float64   Float64   Float64    Float64       Float64

     sigma_angle    0.0303    0.0170     0.0002    0.0018   16.0322   432.1545        8.9715
  sigma_distance    0.0961    0.0418     0.0005    0.0044   16.0333   115.9391        8.9722

Quantiles
      parameters      2.5%     25.0%     50.0%     75.0%     97.5%
          Symbol   Float64   Float64   Float64   Float64   Float64

     sigma_angle    0.0132    0.0133    0.0304    0.0473    0.0473
  sigma_distance    0.0442    0.0604    0.1006    0.1373    0.1381
