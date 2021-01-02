sumaCD <- function(country){
  listCD <- c()
  
  for(i in 1:length(confirmed$Country.Region)){
    if(confirmed$Country.Region[i]==country){
        element <- confirmed[ncol(confirmed)][i,]
        listCD$Confirmed[length(listCD$Confirmed)+1] <- element
            }
  }
  
  return(sum(listCD$Confirmed))
}