make_table_freq2                <- function(variable = overall, stratum_variable = overall, person_analysis = TRUE){
  
  make_table_freq3({{variable}}, {{stratum_variable}}, person_analysis = person_analysis) |>
    dplyr::select(-stratum_b, -strata_b) |>
    dplyr::rename(stratum = stratum_a, strata = strata_a)
}
