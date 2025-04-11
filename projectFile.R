library(tidyverse)

#The runtime of the shows listed is in minutes and represents how long on average ONE episode of the show is/how long the movie is.

movieTitles <- read_csv("titles.csv") %>% 
  rename(show_title = title) %>% 
  mutate(seasons = ifelse(is.na(seasons), 0, seasons)) %>% 
  select(-type, -description, -age_certification, -imdb_id, -id) 

globalViewership <- read_csv("all-weeks-global.csv") %>% 
  select(-season_title, -runtime, -weekly_views, -episode_launch_details, -weekly_rank, -is_staggered_launch) %>% 
  mutate(week = as.character(week)) %>% 
  filter(grepl('2022', week)) %>% 
  group_by(show_title, category) %>% 
  summarise(weekly_hours_viewed = sum(weekly_hours_viewed), 
            cumulative_top10 = sum(cumulative_weeks_in_top_10))

cleaned_data <- globalViewership %>% 
  inner_join(movieTitles, by = "show_title")
 

# Introduction (Table 1)
summary(cleaned_data)

#Explanations of the variables in the summary

#Visualizations:

#Quantitative

#Qualitative
#Univariate
#Multivariate

#Our Structure for the project paper.

#What do the visualization predict?
#Explain what our research question is
#The methodology behind our research question
#If effect modifiers/confounding variables are taken into account and how we will assess it, (hypothesis testing, p value), and why?


