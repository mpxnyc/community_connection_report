calculate_centrality_stats <- function(bipartite_graph, which = "true") {
  
 bipartite_graph %>%
                                igraph::bipartite_projection(which = which) %>%
                                tidygraph::as_tbl_graph() %>%
                                tidygraph::mutate(betweenness =  igraph::betweenness(., directed = FALSE)) %>%
                                tidygraph::mutate(closeness   =  igraph::closeness(.)) %>%
                                tidygraph::mutate(pagerank    =  igraph::page_rank(., directed = FALSE)$vector) %>%
                                tidygraph::select(name, betweenness, closeness, pagerank) %>%
                                data.frame() %>%
    dplyr::tibble()


        
  
}