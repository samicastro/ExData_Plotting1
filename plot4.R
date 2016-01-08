# plot4

require(sqldf)

# read only relevant lines of the data file, 
# assuming that house_power_consumption.txt file is located in the working directory

hpc <- read.csv.sql(file = "household_power_consumption.txt", sep = ";", 
                    sql = "select * from file where Date IN ('1/2/2007','2/2/2007')")

#let's create

png(file = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

#plot1
ticks <- length(hpc$Global_active_power)
plot(hpc$Global_active_power, 
     ylab = "Global Active Power", type = "l", xaxt = "n", xlab = "")
axis(1, at = c(0, ticks/2, ticks), labels = c("Thu", "Fri", "Sat"))

#plot2
ticks <- length(hpc$Global_active_power)
plot(hpc$Voltage, 
     ylab = "Voltage", type = "l", xaxt = "n", xlab = "datetime")
axis(1, at = c(0, ticks/2, ticks), labels = c("Thu", "Fri", "Sat"))

#plot3
ticks <- length(hpc$Global_active_power)

plot(hpc$Sub_metering_1 , 
     ylab = "Energy sub metering", type = "l", xaxt = "n", xlab = "")
lines(hpc$Sub_metering_2, col = "red")
lines(hpc$Sub_metering_3, col = "blue")

axis(1, at = c(0, ticks/2, ticks), labels = c("Thu", "Fri", "Sat"))

legend("topright", 
       lty = c(1,1,1),
       col = c("black", "red", "blue"), 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#plot4
ticks <- length(hpc$Global_active_power)
plot(hpc$Global_reactive_power, 
     ylab = "Global_reactive_power", type = "l", xaxt = "n", xlab = "datetime")
axis(1, at = c(0, ticks/2, ticks), labels = c("Thu", "Fri", "Sat"))


dev.off()

