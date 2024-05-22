analyze_contact_matrices_single <- function(bipartite_graph_sim, ...){

  variables_list         <- enquos(...)
  
  activity_setting_list  <- list(
                                c("home"),
                                c("home", "social"),
                                c("home", "social", "sexual")
                                )

  activity_setting_list %>%
         purrr::map(
                   function(activity_setting){
                             variables_list %>%
                                 purrr::map(
                                           function(variable) analyze_contact_matrix(bipartite_graph_sim, variable = {{variable}}, activity_setting_input = activity_setting) 
                                            ) %>%
                                 dplyr::bind_rows() 
                           }) %>% 
         dplyr::bind_rows()
 
  

  
}





