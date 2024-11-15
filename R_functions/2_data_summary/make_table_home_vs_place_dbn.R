make_table_home_vs_place_dbn <- function(){
  contact_venue_proportions               <-  make_table_movement_travel() %>%
                                                dplyr::group_by(to, to_borough) %>%
                                                dplyr::summarize(weight = sum(weight)) %>%
                                                dplyr::ungroup() %>%
                                                dplyr::mutate(weight = weight / sum(weight)) %>%
                                                dplyr::rename(community = to, borough = to_borough, to_weight = (weight))
  
  home_venue_proportions               <-  make_table_movement_travel() %>%
                                                dplyr::group_by(from, from_borough) %>%
                                                dplyr::summarize(weight = sum(weight)) %>%
                                                dplyr::ungroup() %>%
                                                dplyr::mutate(weight = weight / sum(weight)) %>%
                                                dplyr::rename(community = from, borough = from_borough, from_weight = (weight)) 
  
  net_venue_proportions                <- contact_venue_proportions %>%
                                                left_join(home_venue_proportions, by = c("community", "borough")) %>%
                                                mutate(from_weight = ifelse(is.na(from_weight), 0, from_weight)) %>%
                                                mutate(to_weight = ifelse(is.na(to_weight), 0, to_weight)) %>%
                                                mutate(weight = to_weight - from_weight)
  
  
  net_venue_proportions %>%
    mutate(community = as.factor(community), highlight = ifelse(weight > 0, "highlight", "lowlight"))
  

}