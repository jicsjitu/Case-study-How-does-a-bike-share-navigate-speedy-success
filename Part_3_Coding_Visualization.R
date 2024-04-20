#Libraries

library(dplyr)
library(ggplot2)

## Visualization of the rider types

clean_trip_final %>%
  group_by(costumer_type) %>%
  summarize(total_rider_type = n()) %>%
  ggplot(aes(x = costumer_type, y = total_rider_type, fill = costumer_type)) + 
  geom_col(position = "dodge") +
  geom_text(aes(label = total_rider_type), vjust = -0.25)

## Visualization of the rider types ride duration

rider_type_average_duration <- clean_trip_final %>% 
  group_by(costumer_type) %>% 
  summarize(average_ride_length = mean(ride_length))

rider_type_average_duration %>% 
  ggplot(aes(x = costumer_type, y = average_ride_length, fill = costumer_type)) +
  geom_col(position = "dodge") + geom_text(aes(label = average_ride_length, vjust = -0.25))


## Visualization of the usage by members and casual riders by the weekday

clean_trip_final %>% 
  group_by(costumer_type, week_day) %>% 
  summarise(number_of_rides = n(),average_duration = mean(ride_length)) %>% 
  arrange(costumer_type, week_day)  %>% 
  ggplot(aes(x = week_day, y = average_duration, fill = costumer_type)) +
  geom_col(position = "dodge")


## Visualization of the number of trips by members and casual riders by the weekday


clean_trip_final %>% 
  group_by(costumer_type, week_day) %>% 
  summarise(number_of_rides = n(),average_duration = mean(ride_length)) %>% 
  arrange(costumer_type, week_day)  %>% 
  ggplot(aes(x = week_day, y = number_of_rides, fill = costumer_type)) +
  geom_col(position = "dodge")


## Visualization of the usage by members and casual riders by the month

clean_trip_final$month <- ordered(clean_trip_final$month, levels=c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"))

clean_trip_final %>% 
  group_by(costumer_type, month) %>% 
  summarise(number_of_ride = n(),average_duration = mean(ride_length)) %>% 
  arrange(costumer_type, month)  %>% 
  ggplot(aes(x = month, y = average_duration, fill = costumer_type)) +
  geom_col(position = "dodge") +
  geom_text(aes(label = number_of_ride, angle = 90)) +
  facet_wrap(~costumer_type)

## Visualization of the number of trips by members and casual riders by the month


clean_trip_final %>% 
  group_by(costumer_type, month) %>% 
  summarise(number_of_ride = n()) %>% 
  arrange(costumer_type, month)  %>% 
  ggplot(aes(x = month, y = number_of_ride, fill = costumer_type)) +
  geom_col(position = "dodge") +
  geom_text(aes(label = number_of_ride, angle = 90)) +
  facet_wrap(~costumer_type)


chicago_mean_temp <- c(-3.2, -1.2, 4.4, 10.5, 16.6, 22.2, 24.8, 23.9, 19.9, 12.9, 5.8, -0.3)
month <- c("001 - Jan","002 - Feb","003 - Mar","004 - Apr","005 - May","006 - Jun","007 - Jul","008 - Aug","009 - Sep","010 - Oct","011 - Nov","012 - Dec")

data.frame(month, chicago_mean_temp) %>%
  ggplot(aes(x=month, y=chicago_mean_temp)) +
  labs(x="Month", y="Mean temperature", title="Chart 02.5 - Mean temperature for Chicago (1991-2023)") +
  geom_col()

# Print all column names of the data frame
names(clean_trip_final)