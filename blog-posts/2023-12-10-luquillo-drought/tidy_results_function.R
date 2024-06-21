# create function to run model and clean results
tidy_results_fun <- function(model, data){
  
  # clean model outputs
  tidy <- broom::tidy(model)
  summary <- broom::glance(model)
  
  # combine desired results (keeping R/R^2 only once)
  tidy$adj_r_squared <- ifelse(1:nrow(tidy) == 1, summary$adj.r.squared, NA)
  tidy$r_squared <- ifelse(1:nrow(tidy) == 1, summary$r.squared, NA)
  
  # save results to environment
  assign(paste0(tolower(unique(data$species)), "_model"), tidy, envir = .GlobalEnv)
  
}