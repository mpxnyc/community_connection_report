calculate_centrality_stats <- function(bipartite_graph) {
  
  working_graph          <- bipartite_graph %>%
                                igraph::bipartite_projection(which = "true") %>%
                                tidygraph::as_tbl_graph() 
  

    centrality_measures <- working_graph %>% 
                                pull(rep) %>% 
                                max() %>%
                                seq() %>%
                                purrr::map(
                                  function(x){
                                    working_graph %>%
                                      filter(rep == x) %>%
                                      tidygraph::mutate(betweenness =  igraph::betweenness(., directed = FALSE)) %>%
                                      tidygraph::mutate(closeness =  igraph::closeness(.)) %>%
                                      tidygraph::select(name, rep, betweenness, closeness) %>%
                                      data.frame()
                                  }
                                ) %>%
                              dplyr::bind_rows()
    
    working_graph %>% 
      data.frame() %>%
      left_join(centrality_measures) %>%
      group_by(rep) %>%
      summarize(
        avg_betweenness = mean(betweenness, na.rm = TRUE),
        sd_closeness = mean(closeness, na.rm = TRUE)
        ) %>%
      ungroup() %>%
      summarize(
        mean_avg_betweenness     = mean(avg_betweenness, na.rm = TRUE),
        mean_sd_closeness       = mean(sd_closeness, na.rm = TRUE),
        ci_lb_avg_betweenness    = quantile(avg_betweenness, 0.025, na.rm = TRUE),
        ci_lb_sd_closeness       = quantile(sd_closeness, 0.025, na.rm = TRUE),
        ci_ub_avg_betweenness    = quantile(avg_betweenness, 0.975, na.rm = TRUE),
        ci_ub_sd_closeness       = quantile(sd_closeness, 0.975, na.rm = TRUE)
      )

        
  
}