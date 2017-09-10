library(dplyr)
#Read the data file
nei <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
scc <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

#calculate the total PM2.5 emissions per year
total_emission <- aggregate(Emissions ~ year, data = nei, sum)

#Plot result (From the plot it can be seen that the total emissions have decreased from 1999 to 2008)
png("plot1.png", height = 480, width = 480)
barplot(height = total_emission$Emissions/1000000, names.arg = total_emission$year, col = "slategray3", xlab = "year", ylab="PM2.5 Emissions (10^6 tons)", main = "Total PM2.5 emissions in the US from 1999 to 2008")
dev.off()
