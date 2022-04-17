# This file was generated, do not modify it. # hide
using Turing, DelimitedFiles, StatsPlots, StatsFuns, ArviZ
gr(size=(580,300))

# Turing can have quite verbose output, so I'll
# suppress that for readability
# It's usually a good idea to not do this,
# so you are warned of any divergences
import Logging
Logging.disable_logging(Logging.Warn); # or e.g. Logging.Info