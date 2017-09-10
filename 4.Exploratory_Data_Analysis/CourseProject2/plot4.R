library(dplyr)
#Read the data file
nei <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
scc <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

#Get the coal combustion source identifiers from the scc data frame
coal_comb <- grepl("Comb.*Coal", scc$EI.Sector)
coal_comb_identifier <- scc[coal_comb, "SCC"]

#Subset the NEI database
coal_comb_emissions <- nei[nei$SCC %in% coal_comb_identifier, ]

#Get the total emissions for each year
coal_comb_total_emissions <- aggregate(Emissions ~ year, data = coal_comb_emissions, sum)

#Plot the result
png("plot4.png", width=480, height = 480)
barplot(height = coal_comb_total_emissions$Emissions/100000, names.arg =coal_comb_total_emissions$year, col="slategray3", xlab="year", ylab = "PM2.5 Emissions in 10^5 tons", main = "PM2.5 Emissions from coal combustion related sources in the US \nfrom 1999 to 2008")
dev.off()

