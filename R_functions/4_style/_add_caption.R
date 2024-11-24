add_caption <- function(plot, caption = "Data source: MPX NYC Survey (restricted to 1,304 residents of New York City). www.mpxresponse.org", wrap_n = 5000000){
  
  plot + 
    labs(
      caption  = caption %>% str_wrap(wrap_n)  
    )
}