mpxnyc_all <- function(n){
  c("#F73C95", 
    "#FF99C5", 
    "#009BE8", 
    "#41BFFF", 
    "#C5EFFF", 
    "#5D207A", 
    "#7F3F98", 
    "#9E7ACC", 
    "#459B0E", 
    "#59C618", 
    "#EA773D", 
    "#FFAA7B", 
    "#844D28", 
    "#D89000", 
    "#FFCD2E")[1:n]
}

mpxnyc_light <- function(n){
  c(
    "#FF99C5", 
    "#009BE8", 
    "#C5EFFF", 
    "#9E7ACC", 
    "#59C618", 
    "#EA773D", 
    "#FFAA7B", 
    "#D89000", 
    "#FFCD2E"
  )[1:n]
}

mpxnyc_dark <- function(n){
  c("#F73C95",
    "#009BE8", 
    "#5D207A", 
    "#EA773D",  
    "#459B0E", 
    "#FFCD2E")[1:n]
}

mpxnyc_colors <- function(option){
  if (option == "all")   return(mpxnyc_all)
  if (option == "light") return(mpxnyc_light)
  if (option == "dark")  return(mpxnyc_dark)
}