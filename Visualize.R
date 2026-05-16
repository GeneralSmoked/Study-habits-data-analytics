library(tidyverse)

df_visuals <- read_csv(paste0(
  "C:/Users/Rosh/Documents/GitHub/Coding Shinanigans/",
  "Final Project/cleaned_and_manipulated_student_habits.csv"
))

#Effects on study duration on Academic Performance
ggplot(df_visuals, aes(x = study_category, y = exam)) +
  geom_boxplot(fill = "skyblue") +
  labs(title = "Exam Score by Study Duration Category",
       x = "Study Duration Category",
       y = "Exam Score") +
  theme_minimal()
ggsave("Duration vs Performance.png")

#Impact of Sleep Quality on Exam Scores
ggplot(df_visuals, aes(x = sleep_category, y = exam)) +
  geom_boxplot(fill = "lightgreen") +
  labs(title = "Exam Score by Sleep Category",
       x = "Sleep Category",
       y = "Exam Score") +
  theme_minimal()
ggsave("Sleep quality vs Exam Scores.png")

#Mental Health Levels and Academic Success
ggplot(df_visuals, aes(x = mental_health_level, y = exam)) +
  geom_boxplot(fill = "orange") +
  labs(title  = "Exam Score by Mental Health Level",
       x = "Mental Health Level",
       y = "Exam Scores") +
  theme_minimal()
ggsave("Mental Health Levels vs Academic Success.png")

#Participation in Extracurricular Activities
ggplot(df_visuals, aes(x = extracurricular, y = exam)) +
  geom_boxplot(fill = "steelblue") +
  labs(title = "Exam Score by Extracurricular Participation",
       x = "Participation in Extracurriculars?",
       y = "Exam Scores") +
  theme_minimal()
ggsave("Extracurricular vs Exam Scores.png")

#Influence of Part-time Employment
ggplot(df_visuals, aes(x = factor(has_job), y = exam)) +
  geom_boxplot(fill = "tomato") +
  labs(title = "Exam Score by Part-Time Status",
       x = "Has Part-Time (0  = No, 1 = Yes)",
       y = "Exam Score") +
  theme_minimal()
ggsave("Part-Time vs Exam Scores.png")

#Correlation Between Total Screen Time and Academic Outcomes
ggplot(df_visuals, aes(x = total_screen_time, y = exam)) +
  geom_point(alpha = 0.6, color = "purple") +
  geom_smooth(method = "lm", se = FALSE, color = "darkred") +
  labs(title = "Total Screen Time vs Exam Scores",
       x = "Total Screen Time(Hours)",
       y = "Exam Scores") +
  theme_minimal()
ggsave("Correlation of screen time and Academic Outcome.png")