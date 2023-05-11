# Cyclistic
Cyclistic Case Study 
Introduction
Bellabeat is a successful small company with the potential to become a larger player in the global smart device market.  Urska Srsen, cofounder and Cheif Creative Officer of Bellabeat believes analyzing smart device fitness data could help unlock new growth opportunities.
Step 1: Ask
Business Task
Identify potential opportunities for growth and provide recommendations for the Bellabeat marketing strategy improvement based on trends in smart device usage
Key Stakeholders:
Urska Srsen:Bellabeat's cofounder and Cheif Creative Officer
Sando Mur: Mathematician and Bellabeat's co-founder
Questions to explore:
1. What are some trends in smart device usage?
2. How could these trends apply to Bellabeat customers?
3. How could these trends help influence Bellabeat marketing strategy?
Step 2 Prepare
The data being used in this case study can be found here: FitBit Fitnexx Tracker Data: PublicDomain, dataset made available through Mobius
This data is stored and uploaded in RStudio.  Thirty three eligible Fitbit users consented to the submission of personal tracker data, including minute-level output for physical activity,heart rate, and sleep monitoring.  It includes information about daily activity,steps, and heart rate that can be used to explore users habits.
The data sets contains 18 CSV files organized in log format.  
Step 3: Process
Please see bellabeat_case_study_2.R process of importing datasets into RStudio as well as cleaning functions.
Step 4: Analyze
In this step of analyzing there are 33 participants in the activity,calories, and intensities datasets, 24 in the sleep dataset, and only 8 in the weight dataset. Since there are only 8 participants in the weight dataset means that more data would be needed to make a strong reccommendation or conclusion. There are no significant changes in weight coming from these 8 participants and decided to not use dataset further. 
Observations made from summaries:
1. Sedetary minutes on average is 16.5 hours.
2. The average number of steps per day is 7638.  
3. The majority of the participants are lightly active. 
4. The average participant burns 97 callories per hour.
5. On average, participants sleep for 7 hours. 
Merged Data from sleep and activity for visualizations.
Step 5: Share
Created scatter plots to illistrate Total Steps vs. Calories, Total time asleep vs Total time in bed,Sleep Duration and Sedentary Time.  The scatter chart linked a correlation between steps taken and calories burned. The participants that produced more steps burned more calories.  The was also a correlation between SedentaryMinutes and TotalMinutesAsleep which means that the less active a participant is, the less sleep they tend to get. 


Step 6: Act
After analyzing the FitBit Fitness Tracker data, the recommendations for Bellabeat marketing strategy based on trends in smart device usage.
1. The average number of steps is well below the suggested average of 8,000 steps per day by the CDC.  Perhaps words of encouragement when steps are almost there and when made.
2. The majority of participants are lightly active.  Bellabeats should offer a progression system or streak when goals are made to encourage participants to become fairly active.
3. Sedetary minutes on average is 16.5 hours.  Bellabeats should prompt participants when noticing more that an hour of sedetary minutes during the day to help with step accumilation. 
4. Participants are most active on Saturdays but least on Sunday.  Bellabeat can used motavational wording or activities going on in area to continue steps. 
