library(ggthemes)
library(scales)

source("get-data.R")
source("analysis-daily.R")
source("analysis-total.R")
source("C:/Users/alona/projects/set-colours.R")


length(countries)

myColours <- c(fastmarkets_pal[1:length(countries)])
names(myColours) <- levels(countries)
colScale <- scale_colour_manual(name = "countriesAndTerritories", values = myColours)


#Line chart for top countries

daily %>% transform(countriesAndTerritories = factor(countriesAndTerritories, levels = countries)) %>%
  arrange(countriesAndTerritories) %>%
  filter(countriesAndTerritories %in% countries) %>%
  
  ggplot(aes(dateRep, deaths_cum, col = countriesAndTerritories)) +
  geom_line() +
  theme_gray() + 
  scale_y_continuous(labels = scales::comma_format(big.mark = ',')) +
  expand_limits(y = c(0, plyr::round_any(max(daily$deaths_cum), 10000, f = ceiling))) +
  labs(y = "Cumulative death toll", x = "") +
  ggtitle("Reported deaths in countries with highest death toll") +
  theme(plot.title = element_text(hjust = 0.5), 
        legend.title = element_blank(), legend.key = element_blank()) +
  colScale


#One country

daily %>% transform(countriesAndTerritories = factor(countriesAndTerritories, levels = countries)) %>%
  arrange(countriesAndTerritories) %>%
  filter(countriesAndTerritories %in% countries) %>%
  filter(countriesAndTerritories == "China") %>%
  
  ggplot(aes(dateRep, deaths_cum, col = countriesAndTerritories)) +
  geom_line() +
  theme_gray() + 
  scale_y_continuous(labels = scales::comma_format(big.mark = ',')) +
  expand_limits(y = c(0, 10000)) +
  labs(y = "Cumulative death toll", x = "") +
  ggtitle("Reported deaths in countries with highest death toll") +
  theme(plot.title = element_text(hjust = 0.5), 
        legend.title = element_blank(), legend.key = element_blank()) +
  colScale


#need to fix the issue with _ in country names or use codes