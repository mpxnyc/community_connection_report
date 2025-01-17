draw_table_matrix_mixing <- function(table){
  table |>
    dplyr::select(ego_level, alter_level, mean_selection_coef, ci_lb_selection_coef, ci_ub_selection_coef) |>
    dplyr::mutate(
                      From = ego_level, 
                      To = alter_level, 
                      mean_selection_coef = scales::percent(mean_selection_coef - 1, accuracy = 1),
                      ci_lb_selection_coef = scales::percent(ci_lb_selection_coef - 1, accuracy = 1, suffix = ""), 
                      ci_ub_selection_coef = scales::percent(ci_ub_selection_coef - 1, accuracy = 1, suffix = "")
                      ) |>
    dplyr::transmute(From, To, Value = paste0(mean_selection_coef, " (", ci_lb_selection_coef, " to ", ci_ub_selection_coef, ") ")) |>
    gt::gt() |>
    gt::cols_align(
          align = c( "center"),
          columns = everything()
        )
}
