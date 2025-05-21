

prepare_table_3 <- function(variable, stratum_a, stratum_b, person_analysis = TRUE){
  make_table_freq3({{variable}}, {{stratum_a}}, {{stratum_b}}, person_analysis = person_analysis) |>
    dplyr::mutate(
      proportion       = scales::percent(proportion, 1),
      proportion_ci_lb = scales::percent(proportion_ci_lb, 1, suffix = ""),
      proportion_ci_ub = scales::percent(proportion_ci_ub, 1, suffix = "")
    ) |>
    dplyr::transmute(
      stratum_a,
      stratum_b,
      group            = level,
      count            = count, 
      percentage       = paste0(proportion, " (", proportion_ci_lb, "-", proportion_ci_ub, ")")
    )
}