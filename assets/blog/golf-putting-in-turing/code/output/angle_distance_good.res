Chains MCMC chain (2000×15×4 Array{Float64, 3}):

Iterations        = 1001:1:3000
Number of chains  = 4
Samples per chain = 2000
Wall duration     = 2.29 seconds
Compute duration  = 2.22 seconds
parameters        = sigma_angle, sigma_distance, sigma_y
internals         = lp, n_steps, is_accept, acceptance_rate, log_density, hamiltonian_energy, hamiltonian_energy_error, max_hamiltonian_energy_error, tree_depth, numerical_error, step_size, nom_step_size

Summary Statistics
      parameters      mean       std      mcse    ess_bulk    ess_tail      rhat   ess_per_sec
          Symbol   Float64   Float64   Float64     Float64     Float64   Float64       Float64

     sigma_angle    0.0178    0.0001    0.0000   3714.5549   3687.4828    1.0003     1669.4629
  sigma_distance    0.0801    0.0013    0.0000   3736.9001   3514.4025    1.0015     1679.5056
         sigma_y    0.0031    0.0006    0.0000   3909.4435   3494.1112    1.0011     1757.0532

Quantiles
      parameters      2.5%     25.0%     50.0%     75.0%     97.5%
          Symbol   Float64   Float64   Float64   Float64   Float64

     sigma_angle    0.0176    0.0177    0.0178    0.0179    0.0180
  sigma_distance    0.0775    0.0792    0.0801    0.0809    0.0826
         sigma_y    0.0021    0.0027    0.0030    0.0034    0.0043
