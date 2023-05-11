#2 Prepare/load packages
library(tidyverse)
library(lubridate)
library(dplyr)
library(ggplot2)
library(tidyr)
library(janitor)

#3 Process/Importing the datasets
library(readr)
dailyActivity_merged <- read_csv("C:/Users/Jerry J Villa/Desktop/Case Study 2/Fitabase Data 4.12.16-5.12.16/dailyActivity_merged.csv")
View(dailyActivity_merged)
dailyCalories_merged <- read_csv("C:/Users/Jerry J Villa/Desktop/Case Study 2/Fitabase Data 4.12.16-5.12.16/dailyCalories_merged.csv")
View(dailyCalories_merged)
dailyIntensities_merged <- read_csv("C:/Users/Jerry J Villa/Desktop/Case Study 2/Fitabase Data 4.12.16-5.12.16/dailyIntensities_merged.csv")
dailyIntensities_merged <- read_csv("C:/Users/Jerry J Villa/Desktop/Case Study 2/Fitabase Data 4.12.16-5.12.16/dailyIntensities_merged.csv")
View(dailyIntensities_merged)
sleepDay_merged <- read_csv("C:/Users/Jerry J Villa/Desktop/Case Study 2/Fitabase Data 4.12.16-5.12.16/sleepDay_merged.csv")
View(sleepDay_merged)
weightLogInfo_merged <- read_csv("C:/Users/Jerry J Villa/Desktop/Case Study 2/Fitabase Data 4.12.16-5.12.16/weightLogInfo_merged.csv")
View(weightLogInfo_merged)
#Check for errors
head(dailyActivity_merged)
colnames(weightLogInfo_merged)
#4 Analyze
n_distinct(dailyActivity_merged$Id)
n_distinct(dailyCalories_merged$Id)
n_distinct(hourlyIntensities_merged$Id)
n_distinct(sleepDay_merged$Id)
n_distinct(weightLogInfo_merged$Id)
colnames(dailyActivity_merged)
head(weightLogInfo_merged)
#Change in weight
weightLogInfo_merged%>%
  group_by(Id)%>%
  summarise(min(WeightKg),max(WeightKg))
#Summaries 
#activity 
dailyActivity_merged%>%
  select(TotalSteps,TotalDistance,SedentaryMinutes,Calories)%>%
  summary()
#active minutes
dailyActivity_merged%>%
  select(VeryActiveMinutes,FairlyActiveMinutes,LightlyActiveMinutes)%>%
  summary()
#calories
dailyCalories_merged%>%
  select(Calories)%>%
  summary()
#sleep
sleepDay_merged%>%
  select(TotalSleepRecords,TotalMinutesAsleep,TotalTimeInBed)%>%
  summary()
#weight
weightLogInfo_merged%>%
  select(WeightKg,BMI)%>%
  summary()
#Merging Data for visualizing
merged_data <- merge(sleepDay_merged,dailyActivity_merged,by = c('Id','Date'))
head(merged_data)
#Share
ggplot(data = dailyActivity_merged, aes(x=TotalSteps,y=Calories))+geom_point()+geom_smooth()+
  labs(title="Total Steps vs. Calories")

ggplot(data = sleepDay_merged, aes(x= TotalMinutesAsleep, y = TotalTimeInBed)) + geom_point()+
  labs(title = "Total time asleep vs Total time in bed")

cor(merged_data$TotalMinutesAsleep,merged_data$SedentaryMinutes)
#Day of the week summarized averages

merged_data <- merged_data %>%
  mutate(Date = as.Date(Date, format = "%m/%d/%Y"),
         day = wday(Date, label = TRUE))

summarized_activity_sleep <- merged_data %>%
  group_by(day) %>%
  summarise(AvgDailySteps = mean(TotalSteps),
            AvgAsleepMinutes = mean(TotalMinutesAsleep),
            AvgAwakeTimeInBed = mean(TotalTimeInBed),
            AvgSedentaryMinutes = mean(SedentaryMinutes),
            AvgLightlyActiveMinutes = mean(LightlyActiveMinutes),
            AvgFairlyActiveMinutes = mean(FairlyActiveMinutes),
            AvgVeryActiveMinutes = mean(VeryActiveMinutes),
            AvgCalories = mean(Calories))

head(summarized_activity_sleep)


ggplot(data = summarized_activity_sleep, mapping = aes(x=day, y= AvgDailySteps)) + 
  geom_col(fill = "blue") + labs(title = "Daily Step Count")
#saveWorkspace
save.image("bellabeat_case_study_2.RData")
savehistory("bellabeat_case_study_2.Rhistory")