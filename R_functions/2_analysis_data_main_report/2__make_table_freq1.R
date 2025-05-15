make_table_freq1                <- function(variable = overall, person_analysis = TRUE){
  
  make_table_freq2({{variable}}, person_analysis = person_analysis) |>
    dplyr::select(-stratum, -strata)
}