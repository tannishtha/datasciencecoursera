#Load the data
electric_data <- read.table("household_power_consumption.txt", sep=";", header=T, stringsAsFactors = F, na.strings = "?")

#Subset the data
electric_data <- electric_data[electric_data$Date %in% c("1/2/2007", "2/2/2007"), ]

#Change the type of the date and time columns
date_time <- paste(electric_data$Date, electric_data$Time, sep = " ")
date_time <- strptime(date_time, format = "%d/%m/%Y %H:%M:%S")

#Max of the three submeter values for the yaxis of the plot
max_meter <- max(electric_data$Sub_metering_1, electric_data$Sub_metering_2, electric_data$Sub_metering_3)
png("plot3.png", width=480, height=480)
par(mfrow=c(1,1), oma=c(2,2,2,2))
plot(date_time, electric_data$Sub_metering_1, type="l", col="black", ylab="Energy sub metering", xlab="", ylim = c(0, max_meter))
lines(date_time, electric_data$Sub_metering_2,  col="red")
lines(date_time, electric_data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=2)
dev.off()
