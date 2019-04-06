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
repo_name <- "mojo"

# Analysis for the 2017 repos
par(mfrow=c(2,2))

repo = paste("lines_",repo_name,"_diffs.csv",sep="")
data <- read.csv(repo) # import data
data <- data[data>0] # erase commits with 0 changes
final_data = data.matrix(data) # Update vector type
for (n in c(2361,4722,7084,length(final_data))){
  used_data <- final_data[1:n]
  plot(used_data, xlab=" Commits", ylab="Commit Size", main= repo_name)
  lines(used_data, type="l") 
  
} 

# declaring vectors used
repo_name <- "django"

# Analysis for the 2017 repos
par(mar = rep(2, 4))
par(mfrow=c(4,2))

repo = paste("lines_",repo_name,"_diffs.csv",sep="")
data <- read.csv(repo) # import data
data <- data[data>0] # erase commits with 0 changes
final_data = data.matrix(data) # Update vector type
for (n in c(10000,20000,30000,length(final_data))){
  used_data <- final_data[1:n]
  plot(used_data, xlab=" Commits", ylab="Commit Size", main= repo_name)
  lines(used_data, type="l") 
  m_m = displ$new(used_data) # Declare fit object
  m_1 = dispois$new(used_data)
  m_1$setPars(estimate_pars(m_1))
  m_2 = dislnorm$new(used_data)
  m_2$setPars(estimate_pars(m_2))
  est=estimate_xmin(m_m) # Estimate x_min
  m_m$setXmin(est) # Set x_min as calculated
  est_1=estimate_pars(m_m) # estimate parameters
  repo_ti = paste(repo_name," Params: alpha=",round(est$pars,3)," xmin=",est$xmin,sep="")
  plot(m_m, xlab="commit size", ylab="P(commit size)", main= repo_ti)
  lines(m_m,col=2)
  lines(m_1,col=3,lty=2)
  lines(m_2,col=4,lty=3)
} 
