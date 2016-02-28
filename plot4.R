# Construction of plot4.png

## Read and prepare data
electricPowerConsumptionColNames <- read.table("./household_power_consumption.txt",
                                               nrows = 1, sep = ";", stringsAsFactors = FALSE)

electricPowerConsumption <- read.table("./household_power_consumption.txt",
                                       skip = 66637, nrows = 2880,
                                       sep = ";", na.strings = "?",
                                       col.names = as.character(electricPowerConsumptionColNames[1,]))

electricPowerConsumption$ComplenteDate <- strptime(paste(electricPowerConsumption$Date,
                                                         electricPowerConsumption$Time,
                                                         sep = " "),
                                                   format = "%d/%m/%Y %H:%M:%S")

## Plot
png(filename = "./plot4.png", width = 480, height = 480) # Open device


### Set global parameters
par(mfcol = c(2,2), mar = c(4,4,2,2))


### Plot col1-row1
plot(electricPowerConsumption$ComplenteDate,
     electricPowerConsumption$Global_active_power,
     type = "l", xlab = "", ylab = "Global Active Power")


### Plot col1-row2
plot(electricPowerConsumption$ComplenteDate,
     electricPowerConsumption$Sub_metering_1,
     type = "n", xlab = "", ylab = "Energy sub metering")

lines(electricPowerConsumption$ComplenteDate,
      electricPowerConsumption$Sub_metering_1,
      col = "black")

lines(electricPowerConsumption$ComplenteDate,
      electricPowerConsumption$Sub_metering_2,
      col = "red")

lines(electricPowerConsumption$ComplenteDate,
      electricPowerConsumption$Sub_metering_3,
      col = "blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1, bty = "n")


### Plot col2-row1
plot(electricPowerConsumption$ComplenteDate,
     electricPowerConsumption$Voltage,
     type = "l", xlab = "", ylab = "Voltage")


### Plot col2-row2
plot(electricPowerConsumption$ComplenteDate,
     electricPowerConsumption$Global_reactive_power,
     type = "l", xlab = "", ylab = "Global_reactive_power")


dev.off() # Close device