make_table_movement_travel        <- function(){
  

  
  home_data <-  targets::tar_read(data_bipartite_graph_collected) %>%
    activate(edges) %>%
    filter(home) %>%
    mutate(person_name = .N()$name[from]) %>%
    mutate(home_name = .N()$name[to]) %>%
    data.frame() %>%
    transmute(home_name, person_name)
  
  place_data <-  targets::tar_read(data_bipartite_graph_collected) %>%
    activate(edges) %>%
    filter(!home) %>%
    mutate(person_name = .N()$name[from]) %>%
    mutate(place_name = .N()$name[to]) %>%
    data.frame() %>%
    select(place_name, person_name, place_borough) %>%
    tibble()
  
  home_data_with_borough <- place_data %>%
    group_by(place_name) %>%
    summarize(place_borough = first(place_borough)) %>%
    right_join(home_data, by = c("place_name" = "home_name")) %>%
    rename(home_name = place_name, home_borough = place_borough) %>%
    tibble()
  
  place_data %>% 
    left_join(home_data_with_borough) %>%
    transmute(from = home_name, to = place_name, from_borough = home_borough, to_borough = place_borough) %>%
    group_by(from, to, from_borough, to_borough) %>%
    summarize(weight = n()) 
  
}