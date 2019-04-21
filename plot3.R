#reading the data
household_power <- read.table("/Users/ashleycampisano/Downloads/household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
household_powersub <-rbind(household_power[household_power$Date=="1/2/2007",],household_power[household_power$Date=="2/2/2007",])

household_powersub$Date <- as.Date(household_powersub$Date,"%d/%m/%Y")
household_powersub<-cbind(household_powersub, "DateTime" = as.POSIXct(paste(household_powersub$Date, household_powersub$Time)))

#plot 3: DateTime vs Energy Sub-Metering

with(household_powersub, plot(Sub_metering_1 ~ DateTime, type = "l", xlab = "", ylab = "Energy Sub-Metering"))
with(household_powersub, lines(Sub_metering_2 ~ DateTime, col = "Red"))
with(household_powersub, lines(Sub_metering_3 ~ DateTime, col = "Blue"))

legend("topright", lty = 1, lwd = 3, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png", width = 480, height = 480) 
dev.off()