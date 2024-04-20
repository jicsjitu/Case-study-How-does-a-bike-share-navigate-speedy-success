# Data Validation And Cleaning

# Importing Important Libraries

library(tidyverse)  #helps wrangle data
library(lubridate)  #helps wrangle date attributes
library(ggplot2)  #helps visualize data
library(dplyr) #helps clean data
library(tidyr) #helps clean data

# Importing Datasets
# DATA CHECK

View(X202212_divvy_tripdata)
colnames(X202212_divvy_tripdata)

colnames(X202301_divvy_tripdata)
colnames(X202302_divvy_tripdata)
colnames(X202303_divvy_tripdata)
colnames(X202304_divvy_tripdata)
colnames(X202305_divvy_tripdata)
colnames(X202306_divvy_tripdata)
colnames(X202307_divvy_tripdata)
colnames(X202308_divvy_tripdata)
colnames(X202309_divvy_tripdata)
colnames(X202310_divvy_tripdata)
colnames(X202311_divvy_tripdata)

str(X202212_divvy_tripdata)
str(X202301_divvy_tripdata)
str(X202302_divvy_tripdata)
str(X202303_divvy_tripdata)
str(X202304_divvy_tripdata)
str(X202305_divvy_tripdata)
str(X202306_divvy_tripdata)
str(X202307_divvy_tripdata)
str(X202308_divvy_tripdata)
str(X202309_divvy_tripdata)
str(X202310_divvy_tripdata)
str(X202311_divvy_tripdata)

# Total number of rows
sum(nrow(X202212_divvy_tripdata) + nrow(str(X202301_divvy_tripdata)) + nrow(str(X202302_divvy_tripdata)) 
    + nrow(str(X202303_divvy_tripdata)) + nrow(str(X202304_divvy_tripdata)) + nrow(str(X202305_divvy_tripdata)) 
    + nrow(str(X202306_divvy_tripdata)) + nrow(str(X202307_divvy_tripdata)) + nrow(str(X202308_divvy_tripdata))
    + nrow(str(X202309_divvy_tripdata)) + nrow(str(X202310_divvy_tripdata)) + nrow(str(X202311_divvy_tripdata)))

# Combine Data of 12 month into for smooth workflow
trip_final <- rbind(X202212_divvy_tripdata,X202301_divvy_tripdata,X202302_divvy_tripdata,X202303_divvy_tripdata,
                    X202304_divvy_tripdata,X202305_divvy_tripdata,X202306_divvy_tripdata,X202307_divvy_tripdata,
                    X202308_divvy_tripdata,X202309_divvy_tripdata,X202310_divvy_tripdata, X202311_divvy_tripdata)


# Save the combined files
write.csv(trip_final,file = "data/trip_final.csv",row.names = FALSE)

# Setting global variable size to inf
options(future.globals.maxSize = Inf)

#Final data validation
str(trip_final)
View(head(trip_final))
View(tail(trip_final))
dim(trip_final)
summary(trip_final)
names(trip_final)

#Data Cleaning
#Count rows with "na" values

colSums(is.na(trip_final))

#Remove missing
clean_trip_final <- trip_final[complete.cases(trip_final),]
#Remove duplicates
clean_trip_final <- distinct(clean_trip_final)
#Remove data with greater start_at than end_at
clean_trip_final<- clean_trip_final %>% 
  filter(started_at < ended_at)
#Remove na
clean_trip_final <- drop_na(clean_trip_final)
clean_trip_final <- remove_empty(clean_trip_final)
clean_trip_final <- remove_missing(clean_trip_final)

#Check Cleaned data
colSums(is.na(clean_trip_final))
View(filter(clean_trip_final, clean_trip_final$started_at > clean_trip_final$ended_at))

#Renaming column for better context
clean_trip_final <- rename(clean_trip_final, costumer_type = member_casual, bike_type = rideable_type)

#Separate date in date, day, month, year for better analysis
clean_trip_final$date <- as.Date(clean_trip_final$started_at)
clean_trip_final$week_day <- format(as.Date(clean_trip_final$date), "%A")
clean_trip_final$month <- format(as.Date(clean_trip_final$date), "%b_%y")
clean_trip_final$year <- format(clean_trip_final$date, "%Y")

#Separate column for time
clean_trip_final$time <- as.POSIXct(clean_trip_final$started_at, format = "%Y-%m-%d %H:%M:%S")
clean_trip_final$time <- format(clean_trip_final$time, format = "%H:%M")

#Add ride length column
clean_trip_final$ride_length <- difftime(clean_trip_final$ended_at, clean_trip_final$started_at, units = "mins")

#Select the data we are going to use
clean_trip_final <- clean_trip_final %>% 
  select(bike_type, costumer_type, month, year, time, started_at, week_day, ride_length)

#Remove stolen bikes
clean_trip_final <- clean_trip_final[!clean_trip_final$ride_length>1440,] 
clean_trip_final <- clean_trip_final[!clean_trip_final$ride_length<5,] 

#Save the cleaned data
write.csv(clean_trip_final,file = "clean_trip_final.csv",row.names = FALSE)