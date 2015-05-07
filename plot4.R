library(data.table)
setwd("C:/Users/NNarasim/OneDrive/Temp/Coursera/04. Exploratory Data Analysis/RWorking")

require(data.table)
DT <- fread("./data/household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
febData <- as.data.frame(DT[Date == c("1/2/2007","2/2/2007"),])

febData$Time <- strptime(paste(febData$Date, febData$Time), "%d/%m/%Y %H:%M:%S")
febData$Date <- as.Date(febData$Date , "%d/%m/%Y")
febData$Global_active_power <- as.numeric(febData$Global_active_power)

png(filename="plot4.png", width=480, height=480)

par(mfrow = c(2,2))
#graph 1
with(febData, plot(Time, Global_active_power, type="l", xlab = "", ylab = "Global Active Power"))

#graph 2
with(febData, plot(Time, Voltage, type="l", xlab = "datetime", ylab = "Voltage"))

#graph 3
with(febData, plot(Time, Sub_metering_1, type="n", xlab = "", ylab = "Energy sub metering"))
with(febData, points(Time, Sub_metering_1, type = "l",col="black" ))
with(febData, points(Time, Sub_metering_2, type="l",col="red"))
with(febData, points(Time, Sub_metering_3, type="l",col="blue"))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1)

#graph 4
with(febData, plot(Time, Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power"))

dev.off()

