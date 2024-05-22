make_social_contact_matrix_data <- function(bipartite_graph_sim, ...){

  attr(bipartite_graph_sim, "n_reps") %>%
          seq() %>%
          purrr::map(
            function(current_rep){
              
                        bipartite_graph_sim %>%
                                tidygraph::filter(!is.na(demo_group) | !type) %>%
                                tidygraph::filter(rep == current_rep) %>%
                                analyze_contact_matrices_single(...) %>%
                                dplyr::mutate(rep = current_rep) 
                                
                                  }) %>%
          dplyr::bind_rows() %>%
          dplyr::group_by(activity_setting, variable, from, to) %>%
          dplyr::summarize(
                          risk_deviation_ci_lb  = quantile(risk_deviation, 0.025),
                          risk_deviation_ci_ub  = quantile(risk_deviation, 0.975),
                          risk_deviation        = mean(risk_deviation)
                                            ) %>%
          dplyr::filter(from != "missing" & to != "missing")
        
  
}