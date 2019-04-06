#!/usr/bin/Rscript
# Import poweRlaw library
library(poweRlaw)

# declaring vectors used
repo_names <- c("cask", "django", "mojo", "rakudo", "tty")
# Analysis for the 2017 repos
par(mfrow=c(3,2))
for (repo_name in repo_names){
  repo = paste("lines_",repo_name,"_diffs.csv",sep="")
  data <- read.csv(repo) # import data
  data <- data[data>0] # erase commits with 0 changes
  final_data = data.matrix(data) # Update vector type
  for (n in c(1,2,3,4)){
    used_data <- final_data[1:n*length(final_data)/4]
    m_m = displ$new(used_data) # Declare fit object
    est=estimate_xmin(m_m) # Estimate x_min
    m_m$setXmin(est) # Set x_min as calculated
    est_1=estimate_pars(m_m) # estimate parameters
    bs_p = bootstrap_p(m_m, no_of_sims=500, threads=15) 
    print(repo)
    print(n)
    print(bs_p$p)
} }
