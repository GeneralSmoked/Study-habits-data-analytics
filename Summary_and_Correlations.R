library(tidyverse)

df_correlate <- read_csv(paste0(
  "C:/Users/Rosh/Documents/GitHub/Coding Shinanigans/",
  "Final Project/cleaned_and_manipulated_student_habits.csv"
))

summary_stats <- df_correlate %>%
  select(where(is.numeric)) %>%
  summarise_all(list(
    mean = ~mean(., na.rm = TRUE),
    sd = ~sd(., na.rm = TRUE),
    min = ~min(., na.rm = TRUE),
    max = ~max(., na.rm = TRUE)
  )) %>%
  pivot_longer(cols = everything(),
               names_to = c("Variable", ".value"),
               names_sep = "_(?=[^_]+$)")
write_csv(summary_stats, "Statistics Summary.csv")

correlations <- df_correlate %>%
  select(where(is.numeric)) %>%
  cor(use = "complete.obs") %>%
  as.data.frame() %>%
  select(exam) %>%
  rownames_to_column(var = "variable") %>%
  filter(variable != "exam") %>%
  arrange(desc(exam))
write_csv(correlations, "Exam_score_correlations.csv")