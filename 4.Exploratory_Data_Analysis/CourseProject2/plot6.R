library(dplyr)
library(ggplot2)
#Read the data file
nei <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
scc <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

#Get the rows for Baltimore City
baltimore_motor_emissions <- filter(nei, fips == "24510") %>% filter(type == "ON-ROAD")

#Get the total emission for each year in Baltimore City
baltimore_motor_total_emissions <- aggregate(Emissions ~ year, data = baltimore_motor_emissions, sum)
baltimore_motor_total_emissions$city <- "Baltimore"

#Get the rows for Los Angeles
la_motor_emissions <- filter(nei, fips == "06037") %>% filter(type == "ON-ROAD")

#Get the total emission for each year in Los Angeles
la_motor_total_emissions <- aggregate(Emissions ~ year, data = la_motor_emissions, sum)
la_motor_total_emissions$city <- "Los Angeles"

#Combine the emission result from the two cities
baltimore_la_total_emissions <- rbind(baltimore_motor_total_emissions, la_motor_total_emissions)
baltimore_la_total_emissions$city <- as.factor(baltimore_la_total_emissions$city)

#Plot the result
png("plot6.png", width=480, height=480)
ggplot(baltimore_la_total_emissions, aes(x=year, y=Emissions, col = city)) + 
  geom_line() +
  xlab("year") +  
  ylab ("PM2.5 Emissions in tons") +  
  ggtitle("Total PM2.5 Emissions from motor vehicles in Baltimore vs Los Angeles \n from 1999 to 2008") + 
  theme(plot.title = element_text(hjust = 0.5))
dev.off()
