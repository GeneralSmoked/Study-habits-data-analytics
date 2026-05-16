library(tidyverse)

df_clean <- read_csv(paste0(
  "C:/Users/Rosh/Documents/GitHub/Coding Shinanigans/",
  "Final Project/cleaned_student_habits.csv"
))

df_manipulated <- df_clean %>%
  #Binning for study_hours
  mutate(study_category = case_when(
    study_hours < 1 ~ "None",
    study_hours < 3 ~ "Low",
    study_hours < 5 ~ "Moderate",
    TRUE ~ "High"
  ),
  #Binning for sleep
  sleep_category = case_when(
    sleep < 5 ~ "Very Low",
    sleep < 7 ~ "Low",
    sleep < 9 ~ "Adequate",
    TRUE ~ "High"
  ),
  #Binning for mental health
  mental_health_level = case_when(
    mental_health <= 3 ~ "Poor",
    mental_health <= 7 ~ "Average",
    TRUE ~ "Good"
  ),
  # New variable for netflix + social media
  total_screen_time = social_media + netflix,

  #Binary indicator for part time job
  has_job = ifelse(tolower(part_time_job) == "yes", 1, 0)
  )

df_manipulated <- df_manipulated %>%
  select(-part_time_job)

write_csv(df_manipulated, paste0(
  "C:/Users/Rosh/Documents/GitHub/Coding Shinanigans/",
  "Final Project/cleaned_and_manipulated_student_habits.csv"
))