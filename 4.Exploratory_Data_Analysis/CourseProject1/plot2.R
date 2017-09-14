#Load the data
electric_data <- read.table("household_power_consumption.txt", sep=";", header=T, stringsAsFactors = F, na.strings = "?")

#Subset the data
electric_data <- electric_data[electric_data$Date %in% c("1/2/2007", "2/2/2007"), ]

#Change the type of the date and time columns
date_time <- paste(electric_data$Date, electric_data$Time, sep = " ")
date_time <- strptime(date_time, format = "%d/%m/%Y %H:%M:%S")

#plot the line graph for the Global Active Power vs the date
png("plot2.png", width=480, height=480)
par(oma=c(2,2,2,2))
plot(date_time, electric_data$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="l")
dev.off()
