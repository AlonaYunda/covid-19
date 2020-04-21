library(ggthemes)
library(scales)

source("get-data.R")
source("analysis-daily.R")
source("analysis-total.R")
source("C:/Users/alona/projects/set-colours.R")


#Bar plots per country

daily %>% transform(countriesAndTerritories = factor(countriesAndTerritories, levels = countries)) %>%
  arrange(countriesAndTerritories) %>%
  filter(countriesAndTerritories %in% countries) %>%

  ggplot(aes(dateRep, deaths_cum)) + 
  geom_bar(stat = "identity", fill = "#6F0791", colour = "#6F0791") + 
  theme_gray() + 
  scale_y_continuous(labels = scales::comma_format(big.mark = ',')) +
  expand_limits(y = c(0,40000)) + 
  labs(y = "Cumulative death toll", x = "") +
  facet_wrap(.~countriesAndTerritories, scales = "free") +
  ggtitle("Reported deaths in countries with highest death toll") +
  theme(plot.title = element_text(hjust = 0.5) ) +
  scale_x_date(labels = date_format("%b")) #abbreviated month names


#need to change country names for country codes!