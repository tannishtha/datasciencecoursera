#Load the data
electric_data <- read.table("household_power_consumption.txt", sep=";", header=T, stringsAsFactors = F, na.strings = "?")

#Subset the data
electric_data <- electric_data[electric_data$Date %in% c("1/2/2007", "2/2/2007"), ]

#Code to plot the histogram of Global Active Power
png("plot1.png", width=480, height=480)
par(oma=c(2,2,2,2))
hist(electric_data$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()



