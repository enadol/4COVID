masuno <- function(x){
  
  return(x+1)
}

matchandcompute <- function(x){
  indexin <- match(x, generals$Country_Region)
  indexout <- match(x, confirmed2$Country.Region)
  confirmed2$rate[indexout] <- confirmed2[ncol(confirmed2)-1][indexout,]/generals$Population[indexin] * 1000000
  
}


matchandcomputeequal <- function(x){
  index <- match(x, tablaconfirmed2$Country)
  tablaconfirmed2$Rate[index] <- tablaconfirmed2$Cases[index]/tablaconfirmed2$Population[index] * 1000000
  
}

getPop <- function(country){
  index <- match(country, generals$Country_Region)
  pop <- generals$Population[index]
  return(pop)
}

getPopAll <- function(lista){
  popAll <- lapply(lista, getPop)
  return(popAll)
  
}

injectRate <- function(country){
  index <- match(country, totals$Country)
  totals$Rate[index] <- totals$Cases[index]/totals$Population[index] * 1000000
  
}

injectRateAll <- function(){
  
  totRates <- lapply(totals$Country, injectRate)
  return(unlist(totRates))
}

injectDeathRate <- function(country){
  index <- match(country, totalsDeaths$Country)
  totalsDeaths$Rates[index] <- totalsDeaths$Deaths[index]/totalsDeaths$Population[index] * 1000000
  
}

injectRateDeathsAll <- function(){
  
  totDeathRates <- lapply(totalsDeaths$Country, injectDeathRate)
  return(unlist(totDeathRates))
}

sumaCDlap <- function(country){
  listaCDlap <- c()

  if(confirmed$Country.Region[index] == country){
    index <- match(country, confirmed$Country.Region)
    element <- confirmed[ncol(confirmed)][index,]
    listaCDlap$Confirmed[length(listaCDlap$Confirmed)+1] <- element
  }
  return(sum(listaCDlap$Confirmed))
  
}

sumaCDlapAll <- function(){
  listaCDlapAll <- c()
  for(i in 1:length(totals$Country)){
    country <- totals$Country[i]
    total <- lapply(totals$Country, sumaCDlap)
    listaCDlapAll[length(listaCDlapAll)+1] <- total
 }
  return(listaCDlapAll)
  
}

sumaDeaths <- function(country){
  listDeaths <- c()
  
  for(i in 1:length(deaths$Country.Region)){
    if(deaths$Country.Region[i]==country){
      element <- deaths[ncol(deaths)][i,]
      listDeaths$Deaths[length(listDeaths$Deaths)+1] <- element
    }
  }
  
  return(sum(listDeaths$Deaths))
}

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

