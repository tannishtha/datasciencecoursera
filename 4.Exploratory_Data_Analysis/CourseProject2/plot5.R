library(dplyr)
#Read the data file
nei <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
scc <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

#Get the rows for Baltimore City
baltimore_motor_emissions <- filter(nei, fips == "24510") %>% filter(type == "ON-ROAD")

#Get the total emission for each year in Baltimore City
baltimore_motor_total_emissions <- aggregate(Emissions ~ year, data = baltimore_motor_emissions, sum)

#plot the output
png("plot5.png", width=480, height=480)
barplot(height=baltimore_motor_total_emissions$Emissions, names.arg = baltimore_motor_total_emissions$year, col="slategray3", xlab="year", ylab="PM2.5 Emissions in tons", main = "PM2.5 total emissions from motor vehicles in Baltimore City \nfrom 1999 to 2008")
dev.off()
