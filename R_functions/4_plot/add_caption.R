add_caption <- function(plot, plot_name){
  
  plot + 
    labs(
      title    = captions_and_titles(plot_name)$title,
      subtitle = captions_and_titles(plot_name)$subtitle,
      caption  = captions_and_titles(plot_name)$caption %>% str_wrap(110) %>% paste0("\n\n", captions_and_titles("common_caption") )
    )
}