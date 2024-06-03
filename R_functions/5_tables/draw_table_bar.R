draw_table_bar <- function(table){
  table %>%
    select(level, count, proportion, proportion_ci_lb, proportion_ci_ub) %>%
    mutate(level = str_replace(level, "\n", " ")) %>%
    mutate(
      proportion = scales::percent(proportion),
      proportion_ci_lb = scales::percent(proportion_ci_lb),
      proportion_ci_ub = scales::percent(proportion_ci_ub)
    ) %>%
    transmute(level, count, prop = paste0(proportion, "(", proportion_ci_lb," to " , proportion_ci_ub, ")")) %>%
    knitr::kable() %>%
    kableExtra::kable_classic()
}
