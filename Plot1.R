library("data.table")

setwd("C:/Users/samsung/Desktop/Coursera/Module 4/Week1/exdata_data_household_power_consumption")

plot1 <- function(){
## read data
power_consumption <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?")

power_consumption_subset <- subset(power_consumption,Date %in% c("1/2/2007","2/2/2007"))
'a<-subset(power_consumption,Date=="1/2/2007"|Date=="2/2/2007")'


## change class of all columns to correct class
power_consumption_subset$Date <- format(power_consumption_subset$Date, format="%d%m%Y")
power_consumption_subset$Time <- format(power_consumption_subset$Time, format="%H:%M:%S")
power_consumption_subset$Global_active_power <- as.numeric(power_consumption_subset$Global_active_power)
power_consumption_subset$Global_reactive_power <- as.numeric(power_consumption_subset$Global_reactive_power)
power_consumption_subset$Voltage <- as.numeric(power_consumption_subset$Voltage)
power_consumption_subset$Global_intensity <- as.numeric(power_consumption_subset$Global_intensity)
power_consumption_subset$Sub_metering_1 <- as.numeric(power_consumption_subset$Sub_metering_1)
power_consumption_subset$Sub_metering_2 <- as.numeric(power_consumption_subset$Sub_metering_2)
power_consumption_subset$Sub_metering_3 <- as.numeric(power_consumption_subset$Sub_metering_3)



png("plot1.png", width=480, height=480)
hist(power_consumption_subset$Global_active_power, col="red", border="black", main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()

}