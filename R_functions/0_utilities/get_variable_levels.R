get_variable_levels             <- function(variable_name, person_analysis = TRUE){
  
  variable_labels           <- targets::tar_read(factor_labels)[[variable_name]][["levels"]] %>% unlist()
  variable_levels           <- names(variable_labels)
  
  if (is.null(variable_labels)){
    if (person_analysis){
      variable_labels <- targets::tar_read(data_bipartite_graph_collected) %>%
        tidygraph::activate(nodes) %>%
        tidygraph::filter(type) %>%
        data.frame() %>%
        {.[,variable_name]} %>%
        unique()
      
      variable_levels <- variable_labels
    } else {
      
      variable_labels <- targets::tar_read(data_bipartite_graph_collected) %>%
        tidygraph::activate(edges) %>%
        tidygraph::filter(type) %>%
        data.frame() %>%
        {.[,variable_name]} %>%
        unique()
      
      variable_levels <- variable_labels
    }} 
  
  return(list(variable_levels = variable_levels, variable_labels = variable_labels))
  
}