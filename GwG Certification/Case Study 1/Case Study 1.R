library(tidyverse)  # helps wrangle data
library(lubridate)  # helps wrangle date attributes
library(ggplot2)  # helps visualize data

getwd() #displays your working directory
setwd("/Users/ugonn/Videos/DS/Google Data Analytics Certificate/Datasets/Case Study 1/2") 
# set working directory to simplify calls to data

# Collect data
m02_2021 <- read_csv("202102-divvy-tripdata.csv")
m03_2021 <- read_csv("202103-divvy-tripdata.csv")
m04_2021 <- read_csv("202104-divvy-tripdata.csv")
m05_2021 <- read_csv("202105-divvy-tripdata.csv")
m06_2021 <- read_csv("202106-divvy-tripdata.csv")
m07_2021 <- read_csv("202107-divvy-tripdata.csv")
m08_2021 <- read_csv("202108-divvy-tripdata.csv")
m09_2021 <- read_csv("202109-divvy-tripdata.csv")
m10_2021 <- read_csv("202110-divvy-tripdata.csv")
m11_2021 <- read_csv("202111-divvy-tripdata.csv")
m12_2021 <- read_csv("202112-divvy-tripdata.csv")
m01_2022 <- read_csv("202201-divvy-tripdata.csv")

# Wrangle data and combine into a single file
colnames(m02_2021)
colnames(m03_2021)
colnames(m04_2021)
colnames(m05_2021)
colnames(m06_2021)
colnames(m07_2021)
colnames(m08_2021)
colnames(m09_2021)
colnames(m10_2021)
colnames(m11_2021)
colnames(m12_2021)
colnames(m01_2022)

# Inspect data frames and look for incongruencies
str(m02_2021)
str(m03_2021)
str(m04_2021)
str(m05_2021)
str(m06_2021)
str(m07_2021)
str(m08_2021)
str(m09_2021)
str(m10_2021)
str(m11_2021)
str(m12_2021)
str(m01_2022)

# Stack individual data frames into one big data frame
all_trips <- bind_rows(m02_2021, m03_2021, m04_2021, m05_2021, m06_2021, m07_2021,
                       m08_2021, m09_2021, m10_2021, m11_2021, m12_2021, m01_2022)

# List of column names
colnames(all_trips)

# How many rows are in data frame
nrow(all_trips)

# Dimensions of the data frame
dim(all_trips)

# See the first 6 rows of the data frame
head(all_trips)

# See list of columns and data types (numeric, character, etc)
str(all_trips)

# Statistical summary of data. (mainly numerics)
summary(all_trips)

# How many observations fall under each usertype
table(all_trips$member_casual)

# Add columns that lst the date, month, day, and year of each ride
all_trips$date <- as.Date(all_trips$started_at) # default format is yyyy-mm-dd
all_trips$month <- format(as.Date(all_trips$date), "%m")
all_trips$day <- format(as.Date(all_trips$date), "%d")
all_trips$year <- format(as.Date(all_trips$date), "%Y")
all_trips$day_of_week <- format(as.Date(all_trips$date), "%A")

# Calculation of trip length
all_trips$ride_length <- difftime(all_trips$ended_at, all_trips$started_at)

# Convert "ride_length" from Factor to numeric
all_trips$ride_length <- as.numeric(as.character(all_trips$ride_length))

# Check
is.numeric(all_trips$ride_length)

# Remove bad data
all_trips_v2 <- subset(all_trips, start_station_name != "HQ QR" & ride_length > 0)

summary(all_trips_v2)

# Descriptive analysis on ride_length (in seconds)
mean(all_trips_v2$ride_length) # average
median(all_trips_v2$ride_length) # midpoint number
max(all_trips_v2$ride_length) # longest ride
min(all_trips_v2$ride_length) # shortest ride

summary(all_trips_v2$ride_length)

# Comparing members and casual users
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = mean)
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = median)
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = max)
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = min)

# Average ride time by each day for members vs casual users
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual
          + all_trips_v2$day_of_week, FUN = mean)

# Ordering the days of the week
all_trips_v2$day_of_week <- ordered(all_trips_v2$day_of_week,
                                    levels=c("Sunday", "Monday", "Tuesday",
                                             "Wednesday", "Thursday", "Friday",
                                             "Saturday"))

aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual
          + all_trips_v2$day_of_week, FUN = mean)

# Analyze ridership data by type and weekday
all_trips_v2 %>% 
  mutate(weekday = wday(started_at, label = TRUE)) %>% 
  #creates weekday field using wday()
  group_by(member_casual, weekday) %>%  
  #groups by user type and weekday
  summarise(number_of_rides = n()							
            #calculates the number of rides and average duration 
            ,average_duration = mean(ride_length)) %>% 		
            # calculates the average duration
  arrange(member_casual, weekday)								
  # sorts

# Let's visualize the number of rides by rider type
all_trips_v2 %>% 
  mutate(weekday = wday(started_at, label = TRUE)) %>% 
  group_by(member_casual, weekday) %>% 
  summarise(number_of_rides = n()
            ,average_duration = mean(ride_length)) %>% 
  arrange(member_casual, weekday)  %>% 
  ggplot(aes(x = weekday, y = number_of_rides, fill = member_casual)) +
  geom_col(position = "dodge")

# Visualization for average duration
all_trips_v2 %>% 
  mutate(weekday = wday(started_at, label = TRUE)) %>% 
  group_by(member_casual, weekday) %>% 
  summarise(number_of_rides = n()
            ,average_duration = mean(ride_length)) %>% 
  arrange(member_casual, weekday)  %>% 
  ggplot(aes(x = weekday, y = average_duration, fill = member_casual)) +
  geom_col(position = "dodge")

# Rideable_type
ggplot(data=all_trips_v2) + geom_bar(mapping=(aes(x=rideable_type, fill = member_casual)))
ggplot(data=all_trips_v2)

