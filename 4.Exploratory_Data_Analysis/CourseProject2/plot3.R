library(dplyr)
#Read the data file
nei <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
scc <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

#Get the rows for Baltimore City
baltimore_emissions <- filter(nei, fips == "24510")
#Get the total emissions from various sources
baltimore_source_emissions <- aggregate(Emissions ~ year + type, data = baltimore_emissions, sum)

#plot the result
png("plot3.png", height = 480, width = 480)
ggplot(baltimore_source_emissions, aes(x = year, y = log(Emissions), col = type)) + 
      geom_boxplot(aes(fill=type)) + stat_boxplot(geom ='errorbar') + geom_jitter(alpha=0.10) +
      xlab("year") +  
      ylab ("PM2.5 Emissions in tons") +  
      ggtitle("Total PM2.5 Emissions from various sources in Baltimore City, MD \n from 1999 to 2008") + 
      theme(plot.title = element_text(hjust = 0.5))
dev.off()

