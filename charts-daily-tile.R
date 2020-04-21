library(ggthemes)
library(scales)

source("get-data.R")
source("analysis-daily.R")
source("analysis-total.R")
source("C:/Users/alona/projects/set-colours.R")


#tile chart 

date <- format(Sys.Date(), "%B %d")

#***
#daily$deaths_cum <- daily$deaths_cum %>% as.numeric() %>% format(big.mark = ",")

#daily <- daily %>% group_by(countriesAndTerritories) %>% 
#mutate(AxisTitles = str_c(countriesAndTerritories, " (", max(deaths_cum), ")" ), ) %>% #ungroup()

#daily$AxisTitles <- daily$AxisTitles %>% gsub("_", " ", .)
#***

daily %>% transform(countriesAndTerritories = factor(countriesAndTerritories, levels = rev(countries10))) %>%
  arrange(countriesAndTerritories) %>%
  filter(countriesAndTerritories %in% countries10) %>%
  
  ggplot(aes(dateRep, countriesAndTerritories, fill = deaths_to_population)) +
  geom_tile(color = "grey50") +
  scale_fill_gradientn(colors = c("#CFB08F", "#6F0791")) +
  theme_minimal() + 
  theme(plot.title = element_text(hjust = 0.5), panel.grid = element_blank(), legend.title = element_blank() ) +
  ggtitle("Death toll as a share of total population (%)") +
  ylab(str_c("Country and its total death toll as of ", date)) +
  xlab("") +
  scale_x_date(limits = as.Date(c("2020-03-01", date))) +
  scale_y_discrete(limits = levels(countries10))


#to change axis titles only change x in the ggplot aes -- but it riuns sorting ...
