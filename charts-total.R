library(ggthemes)
library(scales)

source("get-data.R")
source("analysis-total.R")
source("C:/Users/alona/projects/set-colours.R")

date <- format(Sys.Date(), "%B %d")

new_labels <- rev(countries10) %>% gsub("_", " ", .)

top10 %>%
  transform(countriesAndTerritories = factor(countriesAndTerritories, levels = rev(countries10))) %>%
  arrange(countriesAndTerritories) %>%
  
  ggplot() +
  geom_col(aes(countriesAndTerritories, deaths, fill = countriesAndTerritories),
           show.legend = FALSE) +
  geom_text(aes(countriesAndTerritories, deaths, label = comma(deaths, big.mark = ",")),
            stat = "identity", size = 3, position = position_stack(vjust = 0.5)) +
  ggtitle("Death toll to date", subtitle = "Source: ECDC") +
  labs(y = str_c("Total deaths as of ", date), x = "") +
  scale_y_continuous(labels = comma_format(big.mark = ',')) +
  scale_x_discrete(labels = new_labels) +
  scale_fill_manual(values = c(fastmarkets_pal_mid[1:10])) +
  theme_minimal() +
  coord_flip()

#vjust - set to 0 to align with the bottom, 0.5 for the middle, and 1 (the default) for the top