plot_map_choro_stratified        <- function(data, fill){
  
  strata <- data %>% 
                filter(!is.na(stratum)) %>%
                pull(stratum) %>% 
                unique()
  
  map_list <- list()
  
  map_object <- strata %>%
                      purrr::map(
                        function(stratum_input){
                          
                                        data_internal <- data %>% filter(stratum == stratum_input)
                                        
                                        mpxnyc::community_sf_obj %>%
                                          dplyr::rename(level = 1) %>%
                                          dplyr::left_join(data_internal, by = "level") %>%
                                          dplyr::mutate(stratum = stratum_input)
                        }
                      ) %>%
                      bind_rows()
  
  
  map_object %>%
    ggplot() +
    geom_sf(fill = "grey") +
    geom_sf(aes(fill = {{fill}}), color = "black") +
    facet_grid(. ~ stratum)

}