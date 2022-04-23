Chains MCMC chain (2000×14×4 Array{Float64, 3}):

Iterations        = 1001:1:3000
Number of chains  = 4
Samples per chain = 2000
Wall duration     = 17.54 seconds
Compute duration  = 17.49 seconds
parameters        = sigma_angle, sigma_distance
internals         = lp, n_steps, is_accept, acceptance_rate, log_density, hamiltonian_energy, hamiltonian_energy_error, max_hamiltonian_energy_error, tree_depth, numerical_error, step_size, nom_step_size

Summary Statistics
      parameters      mean       std   naive_se      mcse       ess      rhat   ess_per_sec
          Symbol   Float64   Float64    Float64   Float64   Float64   Float64       Float64

     sigma_angle    0.0230    0.0142     0.0002    0.0015   16.0507   18.5438        0.9176
  sigma_distance    0.1039    0.0410     0.0005    0.0043   16.2094    5.9386        0.9266

Quantiles
      parameters      2.5%     25.0%     50.0%     75.0%     97.5%
          Symbol   Float64   Float64   Float64   Float64   Float64

     sigma_angle    0.0132    0.0133    0.0134    0.0283    0.0473
  sigma_distance    0.0386    0.0803    0.1365    0.1373    0.1381
