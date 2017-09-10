library(dplyr)
#Read the data file
nei <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
scc <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

#Get the rows for Baltimore City
baltimore_emissions <- filter(nei, fips == "24510")

#Get the total emission for each year in Baltimore City
baltimore_total_emissions <- aggregate(Emissions ~ year, data = baltimore_emissions, sum)

#plot the result
png("plot2.png", height = 480, width = 480)
barplot(height = baltimore_total_emissions$Emissions, names.arg = baltimore_total_emissions$year, col = "slategray3", xlab = "year", ylab="PM2.5 Emissions in tons", main = "Total PM2.5 emissions in Baltimore City, MD from 1999 to 2008")
dev.off()
