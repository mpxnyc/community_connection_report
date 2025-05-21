

draw_table_1 <- function(data, label){
  
  data |>
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
    ) |>
    gt::gt() |>
    gt::tab_header(
      title = label,
      subtitle = "(MPX NYC, 2022)"
    ) |>
    gt::cols_label(
      group = "",
      count = "N",
      percentage = "% (CI)"
    ) |>
    gt::cols_align(
      align = c( "left"),
      columns = group
    ) |>
    gt::cols_align(
      align = c( "center"),
      columns = c(count, percentage)
    ) |>
    gt::tab_options(
      table.font.size = 11
    )
}

