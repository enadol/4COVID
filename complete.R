library(dplyr)
library(rlist)

#specs
options(scipen = 999)
options(digits = 3)

#Load Data
confirmed <- read.csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv")
deaths <- read.csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv")
recovered <- read.csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_recovered_global.csv")
generals <- read.csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/UID_ISO_FIPS_LookUp_Table.csv")

totalPopUSA <- 330642330
totalPopCanada <- 37681093
totalPopChina <- 1439323776
totalPopFrance <- 65273511
totalPopAustralia <- 25499884

#Inject cases
for(i in 1:length(totals$Country)){
totals$Cases[i] <- sumaCD(as.character(totals$Country[i]))
}

#Inject deaths
for(i in 1:length(totalsDeaths$Country)){
totalsDeaths$Deaths[i] <- sumaDeaths(as.character(totalsDeaths$Country[i]))
}

#Compute cases rates
#for(i in 1:length(totals$Country)){
#totals$Rate[i] <- totals$Cases[i]/totals$Population[i] * 100000
#}
totals$Rate <- injectRateAll()

#Compute deaths rates
#for(i in 1:length(totalsDeaths$Country)){
#totalsDeaths$Rates[i] <- totalsDeaths$Deaths[i]/totalsDeaths$Population[i] * 100000
#}
totalsDeaths$Rates <- injectRateDeathsAll()

#Filtered anomalies, cases, deaths
totalswo <- totals %>% filter(Rate < 25000)
totalsDeathswo <- totalsDeaths %>% filter(Rates <1000)

#Write to csvs
write.csv(totals, "C:\\Users\\enado\\covid\\confirmedrates.csv")
write.csv(totalsDeaths, "C:\\Users\\enado\\covid\\deathrates.csv")
write.csv(totalswo, "C:\\Users\\enado\\covid\\confirmedrateswo.csv")
write.csv(totalsDeathswo, "C:\\Users\\enado\\covid\\deathrateswo.csv")
