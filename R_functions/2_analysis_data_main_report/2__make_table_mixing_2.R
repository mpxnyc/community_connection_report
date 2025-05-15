make_table_mixing_2       <- function(variable){
  
  
  working_graph                <- targets::tar_read(data_bipartite_graph_simulated) |>
    igraph::bipartite.projection(which = "true") |>
    tidygraph::as_tbl_graph(directed = FALSE) 
  
  
  specific_degree_data         <-  working_graph |>
    dplyr::mutate(ego_level = {{variable}}) |>
    specific_degree({{variable}}) |>
    dplyr::mutate(preference = specific_degree / degree) |>
    data.frame()
  
  preference                    <- working_graph |>
    data.frame() |>
    dplyr::left_join(specific_degree_data, by = c("name", "rep")) |>
    dplyr::mutate(ego_level = {{variable}}) |>
    dplyr::group_by(rep, ego_level, alter_level) |>
    dplyr::summarize(preference = mean(preference, na.rm = TRUE)) |>
    dplyr::ungroup()
  
  prevalence                    <- working_graph |>
    data.frame() |>
    dplyr::mutate(level = {{variable}}) |>
    dplyr::group_by(rep, level) |>
    dplyr::summarize(count = dplyr::n()) |>
    dplyr::ungroup() |>
    dplyr::group_by(rep) |>
    dplyr::mutate(prevalence = count / sum(count)) |>
    dplyr::ungroup()
  
  
  preference |>
    dplyr::left_join(prevalence, by = c("rep", "alter_level" = "level")) |>
    dplyr::mutate(selection_coef = preference / prevalence ) |>
    dplyr::select(rep, ego_level, alter_level, selection_coef) |>
    dplyr::group_by(ego_level, alter_level) |>
    dplyr::summarize(
      mean_selection_coef = mean(selection_coef), 
      ci_lb_selection_coef = quantile(selection_coef, 0.025, na.rm = TRUE),
      ci_ub_selection_coef  = quantile(selection_coef, 0.975, na.rm = TRUE)
    ) |>
    dplyr::ungroup() |>
    dplyr::mutate(
      from_level = ego_level, 
      to_level = alter_level, 
      mean_bias = mean_selection_coef ,
      ci_lb_bias = ci_lb_selection_coef,
      cl_ub_bias = ci_ub_selection_coef
    ) |>
    tidyr::drop_na() 
  
}
