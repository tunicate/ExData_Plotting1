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

# Creating Plot 2
png(filename = "plot2.png", 
        width = 480, height = 480, 
        units = "px", bg = "transparent")
plot(power$Date_time, power$Global_active_power, type = "l",
        xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()