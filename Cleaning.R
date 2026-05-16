library(tidyverse)

df <- read_csv(paste0(
  "C:/Users/Rosh/Documents/GitHub/Coding Shinanigans/",
  "Final Project/student_habits_performance.csv"
))

glimpse(df)

#dropping irrelevant columns
df_clean <- df %>%
  select(-student_id)

#Handling missing values
df_clean <- df_clean %>%
  drop_na()

#Conversion of columns to data types
df_clean <- df_clean %>%
  mutate(
    gender = as.factor(tolower(gender)),
    part_time_job = as.factor(tolower(part_time_job)),
    diet_quality = as.factor(tolower(diet_quality)),
    parental_education_level = as.factor(tolower(parental_education_level)),
    internet_quality = as.factor(tolower(internet_quality)),
    mental_health_rating = as.numeric(mental_health_rating),
    extracurricular_participation = as.factor(
      tolower(
        extracurricular_participation
      )
    ),
    study_hours_per_day = as.numeric(study_hours_per_day),
    sleep_hours = as.numeric(sleep_hours),
    exam_score = as.numeric(exam_score),
    social_media_hours = as.numeric(social_media_hours),
    netflix_hours = as.numeric(netflix_hours),
    attendance_percentage = as.numeric(attendance_percentage),
    age = as.numeric(age),
    exercise_frequency = as.numeric(exercise_frequency)
  )

#Removing unrealistic values
df_clean <- df_clean %>%
  filter(
    study_hours_per_day >= 0 & study_hours_per_day <= 24,
    sleep_hours >= 0 & sleep_hours <= 24,
    social_media_hours >= 0 & social_media_hours <= 24,
    netflix_hours >= 0 & netflix_hours <= 24,
    attendance_percentage >= 0 & attendance_percentage <= 100,
    exam_score >= 0 & exam_score <= 100
  )

#Renaming of columns for ease of use
df_clean <- df_clean %>%
  rename(
    study_hours = study_hours_per_day,
    social_media = social_media_hours,
    netflix = netflix_hours,
    sleep = sleep_hours,
    attendance = attendance_percentage,
    mental_health = mental_health_rating,
    parental_edu = parental_education_level,
    extracurricular = extracurricular_participation,
    exam = exam_score
  )

glimpse(df_clean)

write_csv(df_clean, paste0(
  "C:/Users/Rosh/Documents/GitHub/Coding Shinanigans/",
  "Final Project/cleaned_student_habits.csv"
))
