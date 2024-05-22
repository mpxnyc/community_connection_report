analyze_contact_matrix <- function(bipartite_graph_sim, variable = demo_group, activity_setting_input){
  
      
  working_graph                <- bipartite_graph_sim %>%
                                        tidygraph::activate(edges) %>%
                                        tidygraph::mutate(intervention_setting = as.character(intervention_setting)) %>%
                                        tidygraph::filter(intervention_setting %in% activity_setting_input) %>%
                                        tidygraph::activate(nodes)  %>%
                                        tidygraph::mutate(var = {{variable}}) %>%
                                        igraph::bipartite_projection(which = "true") %>%
                                        tidygraph::as_tbl_graph() %>%
                                        tidygraph::activate(edges) %>%
                                        tidygraph::filter(from != to) %>%
                                        tidygraph::mutate(from_value = .N()$var[from], to_value = .N()$var[to]) 
                                        
  
  conditional_probabilities     <- working_graph %>%
                                        tidygraph::activate(edges) %>%
                                        data.frame()  %>%
                                        dplyr::group_by(from_value, to_value) %>%
                                        dplyr::summarize(weight = sum(weight)) %>%
                                        dplyr::group_by(from_value) %>%
                                        dplyr::mutate(conditional_prob = weight / sum(weight)) %>%
                                        dplyr::ungroup()
  
  marginal_probabilities       <- bipartite_graph_sim %>%
                                        tidygraph::activate(nodes) %>%
                                        tidygraph::filter(type) %>%
                                        data.frame() %>%
                                        dplyr::mutate(var = {{variable}}) %>%
                                        dplyr::group_by(var) %>%
                                        dplyr::summarize(count = n()) %>%
                                        dplyr::mutate(marginal_prob = count / sum(count)) %>%
                                        dplyr::ungroup()
  
  
  
  result                      <- conditional_probabilities %>%
                                        dplyr::left_join(marginal_probabilities, by = c("to_value" = "var")) %>%
                                        dplyr::mutate(risk_deviation = conditional_prob/marginal_prob - 1) %>%
                                        dplyr::transmute(
                                                  from = from_value,
                                                  to = to_value,
                                                  risk_deviation = risk_deviation
                                                ) %>%
                                        dplyr::mutate(
                                                  variable = rlang::quo_name(variable),
                                                  activity_setting = paste(activity_setting_input, collapse = ".")
                                                )
  
  
  return(result)
}


