
create_data_bipartite_graph_simulated <- function(bipartite_graph, initial_settings){
  
  n_reps = initial_settings[["n_reps_graph"]]
  
  n_spatial_units <- attr(bipartite_graph, "n_spatial_units") 

  participant_data     <- bipartite_graph %>%
                                tidygraph::activate(nodes) %>%
                                tidygraph::filter(type) %>%
                                data.frame() %>%
                                tibble() %>%
                                select(-rep)
                                
  n_participants       <- dim(participant_data)[1]



    participants         <- participant_data  %>%
                                    dplyr::pull(name) %>%
                                    sample(n_participants * n_reps, replace = TRUE)


                                
  rep_labels           <- seq(n_reps) %>%
                                rep(each = n_participants)

  old_edges            <- bipartite_graph %>%
                                tidygraph::activate(edges) %>%
                                tidygraph::mutate(from_name = .N()$name[from]) %>%
                                tidygraph::mutate(to_name   = .N()$name[to]) %>%
                                data.frame() %>%
                                dplyr::mutate(
                                  to = to_name,
                                  old_from = from_name
                                  ) %>%
                                dplyr::select(old_from, to, names(.)) %>%
                                dplyr::select(-from) %>%
                                dplyr::tibble()
    

  new_edges           <- data.frame(  
                                      old_from = participants,
                                      new_from = uuid::UUIDgenerate(n = length(participants), output = "string"),
                                      rep = rep_labels
                                      ) %>%
                                dplyr::tibble() %>%
                                dplyr::left_join(old_edges, relationship = "many-to-many", by = "old_from") %>%
                                dplyr::mutate(
                                  new_from = paste0(new_from, "_rep", rep),
                                  to = paste0(to, "_rep", rep)
                                )  %>%
                                dplyr::mutate(from = new_from) %>%
                                dplyr::select(from, to, rep, names(.))
                                  
                   
  cross_walk_people   <- new_edges %>%
                                dplyr::transmute(name = new_from, old_name = old_from, rep) %>%
                                unique() %>%
                                dplyr::left_join(participant_data, by = c("old_name" = "name")) %>%
                                dplyr::tibble() %>%
                                dplyr::select(-old_name, rep) %>%
                                dplyr::mutate(type = TRUE)
  
  cross_walk_places   <- new_edges %>%
                                dplyr::transmute(name = to, rep)
  
  cross_walk          <- list(cross_walk_people, cross_walk_places) %>%
                                dplyr::bind_rows() %>%
                                unique()
                                    
  result              <- tidygraph::tbl_graph(edges = new_edges) %>%
                                tidygraph::activate(nodes) %>%
                                tidygraph::left_join(cross_walk, by = "name") %>%
                                tidygraph::mutate(type = ifelse(is.na(type), FALSE, type)) %>%
                                tidygraph::activate(edges) %>%
                                tidygraph::select(-old_from, -new_from) %>%
                                tidygraph::mutate(
                                      from_name = tidygraph::.N()$name[from], 
                                      to_name = tidygraph::.N()$name[to]
                                      ) %>%
                                tidygraph::activate(nodes) %>%
                                tidygraph::arrange(type, name, rep) %>%
                                tidygraph::mutate(overall = "overall")
              
  
  
    attr(result, "n_reps") <- n_reps
    attr(result, "n_spatial_units") <- n_spatial_units
    
    result

}

