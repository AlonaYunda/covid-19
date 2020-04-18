library(tidyverse)


daily <- data %>% 
  group_by(countriesAndTerritories) %>% 
  mutate(dateRep = as.Date(dateRep, "%d/%m/%Y")) %>%
  do(data.frame(with(data = ., .[order(dateRep),]) ) ) %>%
  
  mutate(cases_cum = cumsum(cases),
         deaths_cum = cumsum(deaths),
         death_toll_cum = deaths_cum/cases_cum*100,
         cases_to_population = cases_cum/popData2018*100,
         deaths_to_population = deaths_cum/popData2018*100) %>%
  
  select(countriesAndTerritories,countryterritoryCode,dateRep,cases,cases_cum,deaths,deaths_cum,death_toll_cum,deaths_to_population)



#daily <- daily %>% data.frame(daily$deaths_cum, previous = lag(daily$deaths_cum,1)) %>% mutate(change = (deaths_cum/previous-1)*100) 
#index <- daily$change %in% c(NA,NaN,Inf)
#daily$change[index] <- 0



#when a first death occured in each country
first <- daily %>% filter(deaths_cum != 0) %>%
  group_by(countriesAndTerritories) %>%
  summarise(earliest = min(dateRep)) %>%
  arrange(earliest)
