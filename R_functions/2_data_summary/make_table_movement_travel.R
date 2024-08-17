make_table_movement_travel        <- function(){
  
  home_data                 <-  targets::tar_read(data_bipartite_graph_collected) %>%
                                        tidygraph::activate(edges) %>%
                                        tidygraph::filter(home) %>%
                                        tidygraph::mutate(person_name = .N()$name[from]) %>%
                                        tidygraph::mutate(home_name = .N()$name[to]) %>%
                                        data.frame() %>%
                                        dplyr::transmute(home_name, person_name)
  
  place_data                <-  targets::tar_read(data_bipartite_graph_collected) %>%
                                        tidygraph::activate(edges) %>%
                                        tidygraph::filter(!home) %>%
                                        tidygraph::mutate(person_name = .N()$name[from]) %>%
                                        tidygraph::mutate(place_name = .N()$name[to]) %>%
                                        data.frame() %>%
                                        dplyr::select(place_name, person_name, place_borough) %>%
                                        dplyr::tibble()
  
  home_data_with_borough    <- place_data %>%
                                        dplyr::group_by(place_name) %>%
                                        dplyr::summarize(place_borough = first(place_borough)) %>%
                                        dplyr::right_join(home_data, by = c("place_name" = "home_name")) %>%
                                        dplyr::rename(home_name = place_name, home_borough = place_borough) %>%
                                        dplyr::tibble()
  
  place_data %>% 
        dplyr::left_join(home_data_with_borough) %>%
        dplyr::transmute(from = home_name, to = place_name, from_borough = home_borough, to_borough = place_borough) %>%
        dplyr::group_by(from, to, from_borough, to_borough) %>%
        dplyr::summarize(weight = dplyr::n()) 
  
}