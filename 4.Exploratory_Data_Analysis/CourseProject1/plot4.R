#Load the data
electric_data <- read.table("household_power_consumption.txt", sep=";", header=T, stringsAsFactors = F, na.strings = "?")

#Subset the data
electric_data <- electric_data[electric_data$Date %in% c("1/2/2007", "2/2/2007"), ]

#Change the type of the date and time columns
date_time <- paste(electric_data$Date, electric_data$Time, sep = " ")
date_time <- strptime(date_time, format = "%d/%m/%Y %H:%M:%S")

#Code for creating the panel plots
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
#1st panel plot
plot(date_time, electric_data$Global_active_power, ylab="Global Active Power", xlab="", type="l")
#2nd panel plot
plot(date_time, electric_data$Voltage, type="l", xlab="datetime", ylab="Voltage")
#3rd panel plot
plot(date_time, electric_data$Sub_metering_1, type="l", col="black", ylab="Energy sub metering", xlab="", ylim = c(0, max_meter))
lines(date_time, electric_data$Sub_metering_2, type="l", col="red")
lines(date_time, electric_data$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, bty="n", col=c("black", "red", "blue"), cex=0.8)
#4th panel plot
plot(date_time, electric_data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
