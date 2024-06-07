draw_table_stratified <- function(table){
  table %>%
    select(stratum, level, count, proportion, proportion_ci_lb, proportion_ci_ub) %>%
    mutate(level = str_replace(level, "\n", " ")) %>%
    mutate(
      proportion = scales::percent(proportion, accuracy = 2, suffix = ""),
      proportion_ci_lb = scales::percent(proportion_ci_lb, accuracy = 2, suffix = ""),
      proportion_ci_ub = scales::percent(proportion_ci_ub, accuracy = 2, suffix = "")
    ) %>%
    transmute(stratum, Group = level, N = count, `% (95% CI)` = paste0(proportion, " (", proportion_ci_lb," to " , proportion_ci_ub, ")")) %>%
    gt::gt(groupname_col = "stratum") %>%
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
