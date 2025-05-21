prepare_table_1 <- function(variable, person_analysis = TRUE){
  make_table_freq1({{variable}}, person_analysis = person_analysis) |>
    dplyr::select(level, count, proportion, proportion_ci_lb, proportion_ci_ub) |>
    dplyr::mutate(
      proportion       = scales::percent(proportion, 1),
      proportion_ci_lb = scales::percent(proportion_ci_lb, 1, suffix = ""),
      proportion_ci_ub = scales::percent(proportion_ci_ub, 1, suffix = "")
    ) |>
    dplyr::transmute(
      group            = level,
      count            = count, 
      percentage       = paste0(proportion, " (", proportion_ci_lb, "-", proportion_ci_ub, ")")
    )
}
