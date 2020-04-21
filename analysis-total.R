library(tidyverse)

source("get-data.R")

str(data)
sum(is.na(data$countriesAndTerritories)) #no NAs


#Total numbers to date

total <- data %>% 
  group_by(countriesAndTerritories) %>%
  summarise(cases = sum(cases), deaths = sum(deaths), population = unique(popData2018)) %>% 
  
  mutate(death_toll = round(deaths/cases*100, digits = 2),
         cases_to_population = round(cases/population*100, digits = 2),
         deaths_to_population = round(deaths/population*100, digits = 2),
         
         cases = as.numeric(cases),
         deaths = as.numeric(deaths),
         population = as.numeric(population)) %>%
  
  arrange(desc(deaths))

#sorted <- total[order(total$deaths_to_population,decreasing = TRUE),]


#Filter options

#option 1
top <- total %>% 
  filter(deaths >= 200) %>% 
  select(countriesAndTerritories, deaths) %>% 
  arrange(desc(deaths))

countries <- as.vector(top$countriesAndTerritories)

#option2
top10 <- total %>% 
  top_n(n = 10, wt = deaths) %>% 
  select(countriesAndTerritories,deaths) %>% 
  arrange(desc(deaths))

countries10 <- as.vector(top10$countriesAndTerritories)
