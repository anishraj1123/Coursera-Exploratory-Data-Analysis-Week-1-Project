library("data.table")
setwd("C:/Users/samsung/Desktop/Coursera/Module 4/Week1/exdata_data_household_power_consumption")


Plot3 <-function(){

power_consumption <- data.table::fread(input = "household_power_consumption.txt"
                                       , na.strings="?")
power_consumption_subset <- subset(power_consumption,Date %in% c("1/2/2007","2/2/2007"))
'a<-subset(power_consumption,Date=="1/2/2007"|Date=="2/2/2007")'


## Create column in table with date and time merged together
FullTimeDate <- strptime(paste(power_consumption_subset$Date, power_consumption_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
power_consumption_subset <-cbind(power_consumption_subset,FullTimeDate)


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


## plot energysubmetering vs date&time
png("plot3.png", width=480, height=480)
with(power_consumption_subset, plot(FullTimeDate, Sub_metering_1, type="l", xlab="Day", ylab="Energy sub metering"))
lines(power_consumption_subset$FullTimeDate, power_consumption_subset$Sub_metering_2,type="l", col= "red")
lines(power_consumption_subset$FullTimeDate, power_consumption_subset$Sub_metering_3,type="l", col= "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))

dev.off()

}