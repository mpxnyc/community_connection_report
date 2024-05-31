make_data_intervention_results_coverage <- function(bipartite_graph_sim, bipartite_graph){
  
  list_results <- list()
  
  n_neighborhoods <- bipartite_graph %>%
                          activate(nodes) %>%
                          filter(rep == 1) %>%
                          filter(!type) %>%
                          igraph::gorder()
  
  working_bipartite_graph_sim <- bipartite_graph_sim %>%
                                  mutate(intervention_ranking = NA) %>%
                                  mutate(intervention_contact_place = NA) 
  
  list_results[[1]] <- mark_n_neighborhoods(working_bipartite_graph_sim, n_neighborhoods,  intervention_priority = "contact",  overall) %>%
    activate(nodes) %>%
    data.frame() %>%
    mutate(intervention_priority = "contact") %>%
    mutate(intervention_stratification = "overall")
  
  list_results[[2]] <- mark_n_neighborhoods(working_bipartite_graph_sim, n_neighborhoods,  intervention_priority = "movement",  overall) %>%
  activate(nodes) %>%
    data.frame() %>%
    mutate(intervention_priority = "movement") %>%
    mutate(intervention_stratification = "overall")
  
  list_results[[3]] <- mark_n_neighborhoods(working_bipartite_graph_sim, n_neighborhoods,  intervention_priority = "contact",  demo_group) %>% 
  activate(nodes) %>%
    data.frame() %>%
    mutate(intervention_priority = "contact") %>%
    mutate(intervention_stratification = "demo_group")
  
  list_results[[4]] <- mark_n_neighborhoods(working_bipartite_graph_sim, n_neighborhoods,  intervention_priority = "movement",  demo_group) %>%
  activate(nodes) %>%
    data.frame() %>%
    mutate(intervention_priority = "movement") %>%
    mutate(intervention_stratification = "demo_group")
  
  
  final_result <- list()
  
all_data <- list_results %>%
              bind_rows() %>%
              select(name, intervention_contact_place, intervention_contact_place, intervention_priority, intervention_stratification, intervention_ranking, type, rep)
  
final_result[["person_coverage"]] <- all_data %>%
                                          filter(type)

final_result[["place_coverage"]] <- final_result[["person_coverage"]] %>%
                                          arrange() %>%
                                          group_by(intervention_contact_place, intervention_priority, intervention_stratification, rep) %>%
                                          summarize(count = n(), intervention_ranking = first(intervention_ranking)) %>%
                                          arrange(-count) %>%
                                          group_by(intervention_priority, intervention_stratification, rep) %>%
                                          mutate(proportion = count / sum(count)) %>%
                                          mutate(cum_prop = cumsum(proportion)) %>%
                                          mutate(group = "Group A") %>%
                                          mutate(group = ifelse(cum_prop >= 0.33, "Group B", group)) %>%
                                          mutate(group = ifelse(cum_prop >= 0.66, "Group C", group)) %>%
                                          mutate(group = lag(group)) %>%
                                          mutate(group = ifelse(is.na(group), "Group A", group))  %>%
  tibble()
  

final_result[["person_coverage"]] <- final_result[["person_coverage"]] %>%
                                            left_join(final_result[["place_coverage"]])  %>% 
                                            select(name, intervention_priority, intervention_stratification, rep, intervention_contact_place, intervention_ranking, proportion, cum_prop, group) %>% 
  tibble()

final_result 

}
