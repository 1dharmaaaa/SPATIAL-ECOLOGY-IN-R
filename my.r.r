#import data
setwd("/Users/vaishnavipittala/Desktop")
Stress <- read.csv("stressmanagement.csv", header =T, sep = ",")
View(Stress)

class(Stress) 
"data.frame"
str(Stress)
#We are not interested into the first and last column

Stress.df
names(Stress.df) <- c("Agreed_to_participate",
                      "Name",
                      "Age",
                      "Gender",
                      "Pursuing_Undergrad_or_Postgrad",
                      "Year_of_Study",
                      "Travel_Time_to_University_Minutes",
                      "Hometown_to_University_Hours",
                      "Outstation_Student",
                      "Resilience_Score",
                      "Stress_Management_Score",
                      "Perceived_Stress_Scale")
str(Stress)
# Clean the data for 'country'
stress.df$country[stress.df$country == "ITALY"] <- "Italy"
stress.df$country[stress.df$country == "italy"] <- "Italy"
stress.df$country[stress.df$country == "Italy"] <- "Italy"
stress.df$country[stress.df$country == "SPAIN"] <- "Spain"

# Transform 'country' into a factor in the dataframe
stress.df$country <- as.factor(stress.df$country)

# Clean 'km_travel' column
idx <- which(is.na(as.numeric(stress.df$km_travel)))
stress.df$km_travel[stress.df$km_travel == "600 metri"] <- 0.6
stress.df$travel[idx[2]] <- 2
stress.df$travel[idx[3]] <- 2.5
stress.df$travel[idx[4]] <- 1
stress.df$travel[idx[5]] <- 35
stress.df$travel[idx[6]] <- 2
stress.df$travel[idx[7]] <- 2
stress.df$travel[idx[8]] <- 1.8
stress.df$travel[idx[9]] <- 2
stress.df$travel <- as.numeric(stress.df$km_travel)

# Convert 'stats_know' into a factor
stress.df$stats_know <- factor(stress.df$stats_know, levels = c(1, 2, 3, 4, 5))

# Convert 'hours_stud' to numeric
stress.df$hours_stud <- as.numeric(stress.df$hours_stud)

# Update 'use_R' column using ifelse
stress.df$use_R <- ifelse(stress.df$use_R == "Yes", TRUE, FALSE)

# Writing to CSV
write.table(x = stress.df, file = "stress_data_clean.csv")
