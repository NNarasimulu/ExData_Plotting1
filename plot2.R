library(data.table)
setwd("C:/Users/NNarasim/OneDrive/Temp/Coursera/04. Exploratory Data Analysis/RWorking")

require(data.table)
DT <- fread("./data/household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
febData <- as.data.frame(DT[Date == c("1/2/2007","2/2/2007"),])

febData$Time <- strptime(paste(febData$Date, febData$Time), "%d/%m/%Y %H:%M:%S")
febData$Date <- as.Date(febData$Date , "%d/%m/%Y")
febData$Global_active_power <- as.numeric(febData$Global_active_power)

png(filename="plot2.png", width=480, height=480)
with(febData, plot(Time, Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()

