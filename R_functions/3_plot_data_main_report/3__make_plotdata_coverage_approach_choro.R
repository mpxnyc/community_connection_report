make_plotdata_coverage_approach_choro <- function(){
  data_1                     <- make_table_coverage(
    intervention_priority = "contact", 
    intervention_stratification = "overall"
  ) |>
    dplyr::mutate(stratum = "Contact\nneutralizing\napproach")
  
  data_2                     <- make_table_coverage(
    intervention_priority = "movement", 
    intervention_stratification = "overall"
  ) |>
    dplyr::mutate(stratum = "Movement\nneutralizing\napproach")
  
  
  data_1 |>
    rbind(data_2)
}