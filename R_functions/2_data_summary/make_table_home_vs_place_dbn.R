make_table_home_vs_place_dbn <- function(){
  contact_venue_proportions               <-  make_table_movement_travel() %>%
    dplyr::group_by(to, to_borough) %>%
    dplyr::summarize(weight = sum(weight)) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(weight = weight / sum(weight)) %>%
    dplyr::rename(community = to, borough = to_borough) %>%
    dplyr::mutate(weight = (weight)) 
  
  residence_proportions                    <-  make_table_freq3(
    community, 
    borough, 
    groupSex, 
    person_analysis = TRUE
  ) %>%
    dplyr::filter(stratum_b == "Yes") %>%
    dplyr::transmute(
      from = level, 
      from_borough = stratum_a, 
      count
    ) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(
      weight = count / sum(count)
    ) %>%
    dplyr::rename(community = from, borough = from_borough) %>%
    dplyr::mutate(weight = -weight) %>%
    dplyr::select(community, borough, weight)
  
contact_venue_proportions %>%
    rbind(residence_proportions) %>%
    dplyr::group_by(community) %>%
    dplyr::mutate(highlight = ifelse(
      abs(weight) == max(abs(weight)), 
      "highlight", 
      "lowlight"
    )
    ) %>%
    dplyr::mutate(highlight = ifelse(weight < 0, "lowlight", highlight)) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(community = factor(community, (unique(community))))
  
  
}