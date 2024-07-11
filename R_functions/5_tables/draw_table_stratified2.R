draw_table_stratified2 <- function(table){
  table %>%
    ungroup() %>%
    select(stratum_a, stratum_b, level, count, proportion, proportion_ci_lb, proportion_ci_ub) %>%
    mutate(level = str_replace(level, "\n", " ")) %>%
    mutate(
      proportion = scales::percent(proportion, accuracy = 2, suffix = ""),
      proportion_ci_lb = scales::percent(proportion_ci_lb, accuracy = 2, suffix = ""),
      proportion_ci_ub = scales::percent(proportion_ci_ub, accuracy = 2, suffix = "")
    ) %>%
    transmute(stratum_a, stratum_b, Group = level, N = count, `% (95% CI)` = paste0(proportion, " (", proportion_ci_lb," to " , proportion_ci_ub, ")")) %>%
    gt::gt(groupname_col = c("stratum_a", "stratum_b") ) %>%
    gt::cols_align(
      align = "left",
      columns = Group
    ) %>%
    gt::cols_align(
      align = "center",
      columns = `% (95% CI)`
    ) %>%
    gt::cols_align(
      align = "center",
      columns = N
    )
  
  
}


make_table_freq2(sexOrientation, demo_group) %>%
  draw_table_stratified() 
