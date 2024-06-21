# create function to run model and clean results
tidy_results_fun <- function(model, data){
  
  # clean model outputs
  tidy <- broom::tidy(model)
  summary <- broom::glance(model)
  
  # combine desired results
  tidy$adj_r_squared <- c(summary$adj.r.squared, NA)
  tidy$r_sqaured <- c(summary$r.squared, NA)
  
  # save results to environment
  assign(paste0(tolower(unique(data$species)), "_model"), tidy, envir = .GlobalEnv)
  
}