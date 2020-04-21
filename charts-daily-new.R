library(ggthemes)
library(scales)

source("get-data.R")
source("analysis-daily.R")
source("analysis-total.R")
source("C:/Users/alona/projects/set-colours.R")


#countries reporting first death
length(unique(first$continentExp))

date <- format(Sys.Date(), "%Y-%m-%d")

first %>%
  ggplot(aes(earliest, group = interaction(earliest, continentExp), fill = continentExp)) +
  geom_bar(width = 1) +
  ggtitle("Countries per region announcing the first Covid-19 death",
          subtitle = "Source: European Centre for Disease Prevention and Control") +
  labs(y = "Number of countries per day", x = "") +
  expand_limits(y = c(0,10)) +
  scale_y_continuous(breaks = seq(0, 10, by = 1)) +
  scale_x_date(date_labels = "%b-%d", breaks = "10 days", limits = as.Date(c("2020-01-01", date))) +
  theme_light() +
  scale_fill_manual(values = c(purple1, aqua2, gold2, rubine2, gray2, gray3),
                    name = "Region") +
  theme(legend.key = element_blank(), legend.background = element_blank(),
        legend.position = c(0.15,0.75))

