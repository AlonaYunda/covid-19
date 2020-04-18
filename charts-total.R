library(ggthemes)
library(RColorBrewer)
library(scales)


top10 %>% transform(countriesAndTerritories = factor(countriesAndTerritories, levels = countries10)) %>%
  arrange(countriesAndTerritories) %>% 
  
  
  ggplot() + 
  geom_col(aes(countriesAndTerritories, deaths, fill = countriesAndTerritories)) +
  ggtitle("Death toll to date", subtitle = "Source: ECDC") +
  scale_fill_manual(values=c(fastmarkets_pal_dark[1:10]))
