make_intervention_results_coverage <- function(data_bipartite_graph){
  
  list_results            <-  list()
  list_results[[1]]       <-  find_participant_intervention_contact_place(data_bipartite_graph, intervention_priority = "contact",  overall) 
  list_results[[2]]       <-  find_participant_intervention_contact_place(data_bipartite_graph, intervention_priority = "movement",  overall) 
  list_results[[3]]       <-  find_participant_intervention_contact_place(data_bipartite_graph, intervention_priority = "contact",  demo_group) 
  list_results[[4]]       <-  find_participant_intervention_contact_place(data_bipartite_graph, intervention_priority = "movement",  demo_group) 
  

  all_data                <- list_results %>%
                                    dplyr::bind_rows() %>%
                                    dplyr::select(name, intervention_contact_place, intervention_priority, strata, intervention_ranking, rep)
                                    
  
  final_result                      <- list()
  
  final_result[["person_coverage"]] <- all_data 

  final_result[["place_coverage"]]  <- final_result[["person_coverage"]] %>%
                                            group_by(intervention_ranking, intervention_contact_place, intervention_priority, strata, rep) %>%
                                            summarize(count = n()) %>%
                                            arrange(-count, intervention_ranking, intervention_priority, strata, rep) %>%
                                            group_by(intervention_priority, strata, rep) %>%
                                            arrange(intervention_ranking) %>%
                                            mutate(proportion = count / sum(count)) %>%
                                            mutate(cum_prop = cumsum(proportion)) %>%
                                            mutate(rank = 1:n()) %>%
                                            mutate(group = "Group A") %>%
                                            mutate(group = ifelse(cum_prop >= 0.33, "Group B", group)) %>%
                                            mutate(group = ifelse(cum_prop >= 0.66, "Group C", group)) %>%
                                            mutate(group = lag(group)) %>%
                                            mutate(group = ifelse(is.na(group), "Group A", group))  %>%
                                            ungroup() %>%
                                            tibble() %>%
                                            arrange(intervention_ranking, intervention_priority, strata)
  

  final_result[["person_coverage"]] <- final_result[["person_coverage"]] %>%
                                            left_join(final_result[["place_coverage"]])  %>% 
                                            select(name, intervention_priority, strata, rep, intervention_contact_place, intervention_ranking, proportion, cum_prop, group) %>% 
  tibble()

  final_result 

}




