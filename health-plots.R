library(tidyverse)
library(ggplot2)

health2 <- read.csv("health_t2.csv")
head(health2)

# Histograms 

ggplot(health2, aes(x = Weight)) + geom_histogram()


# Boxplot

ggplot(health2, aes(x = Weight)) + geom_boxplot(notch = TRUE)
mean(health2$Sleep.score, na.rm = TRUE)
glimpse(health2)
summarize(health2)
summarise(health2)


p <- ggplot(health2, aes(x = Night.stress)) + 
  geom_boxplot()

p + coord_flip()



# Convert the dates to datetimes

head(health2)

health2$Date <- as.POSIXct(health2$Date, format="%m/%d/%Y", tz = "UTC")
head(health2)


# Plot time series of sleep score colored by stress levels 

health2 %>%
  ggplot(aes(x = Date, y = Sleep.score, color = Night.stress)) + geom_point(alpha = 0.8, size = 4) + scale_color_gradient(low = "green", high = "red", name = "Overnight stress score") + labs(title = "Stress and sleep score over time", x = "Date", y = "Sleep score")

