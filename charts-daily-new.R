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



#day since first death case

date <- format(Sys.Date(), "%B %d")

daily_new <- daily %>% filter(deaths_cum != 0) %>%
  group_by(countriesAndTerritories) %>%
  mutate(DayNumber = 1:n())


daily_new %>%
  
  ggplot(aes(DayNumber, deaths_cum, group = countriesAndTerritories), show.legend = FALSE) +
  
  geom_line(size = 0.5,
            col = ifelse(daily_new$countriesAndTerritories %in% top$countriesAndTerritories[1:which(top$countriesAndTerritories == "China")],
                         indigo1, gray2)) +
  
  theme_economist() + 
  
  scale_y_continuous(labels = scales::comma_format(big.mark = ','),
                     breaks = seq(0, plyr::round_any(max(daily_new$deaths_cum), 10000, f = ceiling), 5000)) +
  
  scale_x_continuous(breaks = seq(0, plyr::round_any(max(daily_new$DayNumber), 10, f = ceiling), 10)) +
  
  expand_limits(y = c(0, plyr::round_any(max(daily_new$deaths_cum), 10000, f = ceiling)),
                x = c(0, plyr::round_any(max(daily_new$DayNumber), 10, f = ceiling))) +
  
  labs(y = "Cumulative death toll", x = "Days since announcement of the first Covid-19 death case in each country") +
  
  ggtitle("Reported Covid-19 deaths", 
          subtitle = str_c("Source: European Centre for Disease Prevention and Control (Data updated on ", date, ")")) +
  
  theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5),
        legend.text = element_blank(), legend.background = element_blank(), legend.key = element_blank(), legend.position = "none") +
  
  geom_text(data = daily_new %>%
              group_by(countriesAndTerritories) %>% arrange(desc(deaths_cum)) %>% slice(1) %>% 
              filter(deaths_cum >= top$deaths[which(top$countriesAndTerritories == "China")]),
            aes(x = DayNumber, label = gsub("_", " ", countriesAndTerritories)), hjust = 0, vjust = 1) +
  
  geom_vline(xintercept = max(daily_new$DayNumber[which(daily_new$countriesAndTerritories == "United_Kingdom")]),
               colour = rubine1, linetype = "longdash") +
  
  annotate(geom = "text",
           label = str_c("day #", max(daily_new$DayNumber[which(daily_new$countriesAndTerritories == "United_Kingdom")])),
           x = max(daily_new$DayNumber[which(daily_new$countriesAndTerritories == "United_Kingdom")]) + 2,
           y = max(daily_new$deaths_cum[which(daily_new$countriesAndTerritories == "United_Kingdom")]) - 2000,
           col = rubine1)



#top = 1, middle = 0.5, bottom = 0
#left = 0, center = 0.5, right = 1

