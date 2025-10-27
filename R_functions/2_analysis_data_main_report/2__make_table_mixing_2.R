make_table_mixing_2       <- function(variable){
  
  helper_breakdown_into_graph_list <- function(current_rep){

    
    working_graph_simulation |> 
      tidygraph::filter(rep == current_rep) |>
      igraph::bipartite.projection(which = "true") |>
      tidygraph::as_tbl_graph(directed = FALSE)
    
  }
  
  helper_get_specific_degree_data <- function(current_graph){

    
    current_graph |>
      dplyr::mutate(ego_level = {{variable}}) |>
      specific_degree({{variable}}) |>
      dplyr::mutate(preference = specific_degree / degree) |>
      data.frame()
  }
  
  helper_get_preference_data <- function(current_working_graph, current_specific_degree_data){

    
    current_working_graph |>
      data.frame() |>
      dplyr::left_join(current_specific_degree_data, by = c("name", "rep")) |>
      dplyr::mutate(ego_level = {{variable}}) |>
      dplyr::group_by(rep, ego_level, alter_level) |>
      dplyr::summarize(preference = mean(preference, na.rm = TRUE)) |>
      dplyr::ungroup()
    
  }
  
  helper_get_prevalence_data <- function(current_graph){

    
    current_graph |>
      data.frame() |>
      dplyr::mutate(level = {{variable}}) |>
      dplyr::group_by(rep, level) |>
      dplyr::summarize(count = dplyr::n()) |>
      dplyr::ungroup() |>
      dplyr::group_by(rep) |>
      dplyr::mutate(prevalence = count / sum(count)) |>
      dplyr::ungroup()
  }
  
  helper_get_selection_coef_data <- function(preference_data, prevalence_data){

    
    preference_data |>
      dplyr::left_join(prevalence_data, by = c("rep", "alter_level" = "level")) |>
      dplyr::mutate(selection_coef = preference / prevalence ) |>
      dplyr::select(rep, ego_level, alter_level, selection_coef)
  }
  
  working_graph_simulation                <- targets::tar_read(data_bipartite_graph_simulated) 
    
  reps_vector                             <- working_graph_simulation |>
                                                tidygraph::activate(nodes) |>
                                                tidygraph::pull(rep) |>
                                                unique()
  
  working_graph_list                      <- reps_vector |>
                                                purrr::map(helper_breakdown_into_graph_list) 
  
  specific_degree_data_list               <-  working_graph_list |>
                                                purrr::map(helper_get_specific_degree_data)
     

  preference_data_list                    <- working_graph_list |> 
                                                purrr::map2(specific_degree_data_list, helper_get_preference_data)
  

  prevalence_data_list                    <- working_graph_list |>
                                                purrr::map(helper_get_prevalence_data)
    
  
  selection_coef_data_list                <- preference_data_list |> 
                                                purrr::map2(prevalence_data_list, helper_get_selection_coef_data)
  
  selection_coef_data_list |>
    dplyr::bind_rows() |>
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
