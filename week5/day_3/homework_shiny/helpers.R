library(tidyverse)
library(CodeClanData)

# variables
medals <- unique(olympics_overall_medals$medal)
season <- unique(olympics_overall_medals$season)

# table from first tab
medals_5_countries <- olympics_overall_medals %>% 
  filter(team %in% c("United States",
                     "Soviet Union",
                     "Germany",
                     "Italy",
                     "Great Britain"))

  

# functions

# plot 1
medal_plot_1 <- function(my_medal,my_season){
  olympics_overall_medals %>%
    filter(team %in% c("United States",
                       "Soviet Union",
                       "Germany",
                       "Italy",
                       "Great Britain")) %>%
    filter(medal == my_medal ) %>%
    filter(season == my_season) %>%
    ggplot() +
    aes(x = team, y = count,fill = team) +
    geom_col()
}

# plot 2
medal_plot_2 <- function(my_medal_2,my_season_2){
  
  olympics_overall_medals %>%
    filter(team %in% c("United States",
                       "Soviet Union",
                       "Germany",
                       "Italy",
                       "Great Britain")) %>%
    filter(medal == my_medal_2 ) %>%
    filter(season == my_season_2) %>%
    ggplot() +
    aes(x = team, y = count,color = team, size = count) +
    update_geom_defaults("point", list(size = 10))+
    geom_point()+
    scale_size_continuous(range = c(5,20))
  
}



