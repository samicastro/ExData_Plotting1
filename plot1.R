# plot1

require(sqldf)

# read only relevant lines of the data file, 
# assuming that house_power_consumption.txt file is located in the working directory

hpc <- read.csv.sql(file = "household_power_consumption.txt", sep = ";", 
                    sql = "select * from file where Date IN ('1/2/2007','2/2/2007')")

#let's save the histogram as a png file

png(file = "plot1.png", width = 480, height = 480)
hist(hpc$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()



