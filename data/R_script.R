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
  plot(final_data, xlab="Commit Number", ylab="Commit Size", main= repo_name)
  lines(final_data, type="l") 

} 

# declaring vectors used
repo_name <- "cask"

# Analysis for the 2017 repos
par(mfrow=c(3,2))

repo = paste("lines_",repo_name,"_diffs.csv",sep="")
data <- read.csv(repo) # import data
data <- data[data>0] # erase commits with 0 changes
final_data = data.matrix(data) # Update vector type
for (n in c(200,400,600,800,908)){
  used_data <- final_data[1:n]
  plot(used_data, xlab=" Commits", ylab="Commit Size", main= repo_name)
  lines(used_data, type="l") 
  
} 

# declaring vectors used
repo_name <- "cask"

# Analysis for the 2017 repos
par(mfrow=c(3,2))

repo = paste("lines_",repo_name,"_diffs.csv",sep="")
data <- read.csv(repo) # import data
data <- data[data>0] # erase commits with 0 changes
final_data = data.matrix(data) # Update vector type
for (n in c(200,400,600,800,908)){
  used_data <- final_data[1:n]
  m_m = displ$new(final_data) # Declare fit object
  est=estimate_xmin(m_m) # Estimate x_min
  m_m$setXmin(est) # Set x_min as calculated
  est_1=estimate_pars(m_m) # estimate parameters
  #plot(m_m, xlab="commit size", ylab="P(commit size)", main= repo_name)
  #lines(m_m,col=2)
  
} 
