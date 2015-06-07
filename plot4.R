setwd("~/My R Files/Coursera/4 - Exploratory Data Analysis")

# Download data from https://github.com/rdpeng/ExData_Plotting1
# Unzip data file to this location

powerall <- read.table("household_power_consumption.txt", header = TRUE,
                   sep = ";", na = "?",
                   colClasses = c("character", "character", rep("numeric",7)))
head(powerall)

# Subsetting to get the two days we need for graphing
power <- subset(powerall, powerall$Date == "1/2/2007" | powerall$Date == "2/2/2007")

# Adjusting the date and time variables
datefix <- paste(power$Date, power$Time)
power$Date_time <- strptime(datefix, "%d/%m/%Y %H:%M:%S")
head(power)

# Creating Plot 4
png(filename = "plot4.png", 
        width = 480, height = 480, 
        units = "px", bg = "transparent")
par(mfrow = c(2,2))

plot(power$Date_time, power$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power")

plot(power$Date_time, power$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage")

plot(power$Date_time, power$Sub_metering_1, type = "l",
        xlab = "", ylab = "Energy sub metering", col = "black")
lines(power$Date_time, power$Sub_metering_2, col = "red")
lines(power$Date_time, power$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"),
        c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1, bty = "n")

plot(power$Date_time, power$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power", col = "black")

dev.off()