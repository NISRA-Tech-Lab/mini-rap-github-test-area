# uncomment these lines if you need to install packages first.



library(plotly)
library(knitr)
library(dplyr)
library(janitor)
library(tidyr)



df_all_data <- data.frame(personid = c(75789, 60371, 57342, 47219, 13334, 12228,
                                       77103, 57342, 29183, 31502, 60371, 95883,
                                       64518, 82054, 26559, 37013, 50558, 81193),
                          gender = c(1, 2, 9, 1, 1, 2, 2, 1, 1, 2, 1, 1, 2, 1, 9, 2, 1, 1),
                          age = c(16, 15, 14, 15, 17, 16, 18, 14, 18, 12, 13, 10, 12, 17, 11, 15, 18, 16),
                          offence_type = c(1, 2, 3, 2, 3, 3, 3, 2, 2, 2, 3, 3, 1, 2, 3, 2, 1, 2))


# make gender and offence type into factors
df_all_data$gender <- factor(df_all_data$gender, levels = c(1, 2, 9),
                             labels = c("male", "female", "not_stated"))

df_all_data$offence_type <- factor(df_all_data$offence_type, levels = c(1, 2, 3),
                                   labels = c("theft", "drugs", "motoring"))


# create named variables
# total number of individuals (in this dataframe each row is unique)
tot_individuals <- nrow(df_all_data)
tot_males <- nrow(subset(df_all_data, gender == "male"))
tot_females <- nrow(subset(df_all_data, gender == "female"))

# dataframe of individuals by gender
df_indivs_gender <- df_all_data %>% 
  group_by(gender) %>% 
  summarise(individuals = n())

# historic indivs x gender
df_indivs_gender_historic <- data.frame(year =  c(2019, 2020, 2021, 2022),
                                        male = c(8, 9, 12, 11),
                                        female = c(7, 6, 7, 6))


# gender by age group
df_historic_data <- data.frame(year = c(2019, 2020, 2021, 2022),
                               male_under_16 = c(3, 4, 4, 3),
                               male_16_to_18 = c(4, 3, 5, 4),
                               male_over_18 = c(2, 0, 1, 1),
                               female_under_16 = c(2, 3, 1, 4),
                               female_16_to_18 = c(1, 2, 3, 2),
                               female_over_18 = c(1, 0, 1, 1)) 

df_gender_ageband <- df_all_data %>% 
  subset(gender != "not_stated") %>% 
  mutate(age_bands = case_when(age >= 10 & age <16 ~ "under_16",
                               age >= 16 & age <18 ~ "16_to_18",
                               age >=18 ~ "over_18",
                               TRUE ~ "check_age")) %>% 
  group_by(age_bands, gender) %>% 
  summarise(count = n())

# reshape so we can bind with historic data
df_gender_ageband_wide <- df_gender_ageband %>% 
  pivot_wider(names_from = c(gender, age_bands), values_from = count) %>% 
  mutate(year = 2023)

# add new data to historic
df_gender_ageband_allyrs <- rbind(df_historic_data, df_gender_ageband_wide)


