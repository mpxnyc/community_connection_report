make_vaccination_network_impact_data         <- function(data_vaccination_campaign, n_neighborhoods_input = 5){
  

  
  data_vaccination_campaign %>%
    purrr::map(
      function(graph){
        seq(n_neighborhoods_input) %>%
          purrr::map(
            function(min_rank){
              
              node_count <- graph %>%
                                tidygraph::activate(nodes) %>%
                                filter(type) %>%
                                data.frame() %>%
                                group_by(rep) %>%
                                summarize(count = n()) %>%
                                pull(count) %>%
                                {.[1]}
              
              graph %>% 
                tidygraph::activate(nodes) %>%
                tidygraph::filter(intervention_ranking >= min_rank | is.na(intervention_ranking)) %>%
                get_graph_descriptives_single(min_rank) %>%
                mutate(node_count = node_count)
            }
          ) %>%
          bind_rows() 
      }
    ) %>%
    bind_rows() %>%
    tibble()
  
    

}


