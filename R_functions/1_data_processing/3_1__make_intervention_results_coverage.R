make_intervention_results_coverage <- function(data_bipartite_graph){
  
  list_results <- list()
  
  list_results[[1]] <- data_bipartite_graph %>%
                              mark_spatial_units( intervention_priority = "contact",  overall) 
  
  list_results[[2]] <- data_bipartite_graph %>%
                              mark_spatial_units(intervention_priority = "movement",  overall) 
  
  list_results[[3]] <- data_bipartite_graph %>%
                              mark_spatial_units(intervention_priority = "contact",  demo_group) 
  
  list_results[[4]] <- data_bipartite_graph %>%
                              mark_spatial_units(intervention_priority = "movement",  demo_group) 
  

  all_data          <- list_results %>%
                              bind_rows() %>%
                              select(name, intervention_contact_place, intervention_contact_place, intervention_priority, strata, intervention_ranking, type, rep)
  
  final_result <- list()
  
  final_result[["person_coverage"]] <- all_data %>%
                                          filter(type)

  final_result[["place_coverage"]] <- final_result[["person_coverage"]] %>%
                                          group_by(intervention_contact_place, intervention_priority, strata, rep) %>%
                                          summarize(count = n(), intervention_ranking = first(intervention_ranking)) %>%
                                          arrange(-count) %>%
                                          group_by(intervention_priority, strata, rep) %>%
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
                                            select(name, intervention_priority, strata, rep, intervention_contact_place, intervention_ranking, proportion, cum_prop, group) %>% 
  tibble()

  final_result 

}
