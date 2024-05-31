make_table_movement_travel        <- function(){
  
  home_data <-  targets::tar_read(data_bipartite_graph_collected) %>%
    activate(edges) %>%
    filter(home) %>%
    mutate(person_name = .N()$name[from]) %>%
    mutate(home_name = .N()$name[to]) %>%
    data.frame() %>%
    select(home_name, person_name)
  
  place_data <-  targets::tar_read(data_bipartite_graph_collected) %>%
    activate(edges) %>%
    filter(!home) %>%
    mutate(person_name = .N()$name[from]) %>%
    mutate(place_name = .N()$name[to]) %>%
    data.frame() %>%
    select(place_name, person_name)
  
  place_data %>% 
    left_join(home_data) %>%
    transmute(from = home_name, to = place_name) %>%
    group_by(from, to) %>%
    summarize(weight = n()) 
  
}