library(ggthemes)
library(RColorBrewer)
library(scales)

#mutate(axis_titles = str_c(gsub("_", " ", daily$countriesAndTerritories), " (", daily$deaths_total, ")" ) )



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



#Line chart for top countries
myColours <- c(fastmarkets_pal[1:30])
names(myColours) <- levels(countries)
colScale <- scale_colour_manual(name = "countriesAndTerritories", values = myColours)

daily %>% transform(countriesAndTerritories = factor(countriesAndTerritories, levels = countries)) %>%
  arrange(countriesAndTerritories) %>%
  filter(countriesAndTerritories %in% countries) %>%

  ggplot(aes(dateRep, deaths_cum, col = countriesAndTerritories)) +
  geom_line() +
  theme_gray() + 
  scale_y_continuous(labels = scales::comma_format(big.mark = ',')) +
  expand_limits(y = c(0,40000)) +
  labs(y = "Cumulative death toll", x = "") +
  ggtitle("Reported deaths in countries with highest death toll") +
  theme(plot.title = element_text(hjust = 0.5), legend.title = element_blank() ) +
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
  expand_limits(y = c(0,10000)) +
  labs(y = "Cumulative death toll", x = "") +
  ggtitle("Reported deaths in countries with highest death toll") +
  theme(plot.title = element_text(hjust = 0.5), legend.title = element_blank() ) +
  colScale



#tile chart 
daily %>% transform(countriesAndTerritories = factor(countriesAndTerritories, levels = rev(countries10))) %>%
  arrange(countriesAndTerritories) %>%
  filter(countriesAndTerritories %in% countries10) %>%
  
  ggplot(aes(dateRep, countriesAndTerritories, fill = deaths_to_population)) +
  geom_tile(color = "grey50") +
  scale_fill_gradientn(colors = c("#CFB08F", "#6F0791")) +
  theme_minimal() + 
  theme(plot.title = element_text(hjust = 0.5), panel.grid = element_blank(), legend.title = element_blank() ) +
  ggtitle("Death toll as a share of total population (%)") +
  ylab("Country and its total death toll as of April 17") +
  xlab("") +
  scale_x_date(limits = as.Date(c("2020-03-15","2020-04-17"))) +
  scale_y_discrete(limits = levels(countries10))

#change axis titles again for name+deaths
