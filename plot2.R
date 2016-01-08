# plot2

require(sqldf)

# read only relevant lines of the data file, 
# assuming that house_power_consumption.txt file is located in the working directory

hpc <- read.csv.sql(file = "household_power_consumption.txt", sep = ";", 
                    sql = "select * from file where Date IN ('1/2/2007','2/2/2007')")

#let's create

png(file = "plot2.png", width = 480, height = 480)

ticks <- length(hpc$Global_active_power)

plot(hpc$Global_active_power, 
    ylab = "Global Active Power (kilowatts)", type = "l", xaxt = "n", xlab = "")

axis(1, at = c(0, ticks/2, ticks), labels = c("Thu", "Fri", "Sat"))

dev.off()



