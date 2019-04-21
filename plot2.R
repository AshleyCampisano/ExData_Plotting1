#reading the data
household_power <- read.table("/Users/ashleycampisano/Downloads/household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
household_powersub <-rbind(household_power[household_power$Date=="1/2/2007",],household_power[household_power$Date=="2/2/2007",])

household_powersub$Date <- as.Date(household_powersub$Date,"%d/%m/%Y")
household_powersub<-cbind(household_powersub, "DateTime" = as.POSIXct(paste(household_powersub$Date, household_powersub$Time)))

#plot 2: Day vs Global Active Power (kilowatts)

plot(household_powersub$Global_active_power ~ household_powersub$DateTime, type="l", xlab= "", ylab="Global Active power (kilowatts)")
dev.copy(png, file = "plot2.png", width = 480, height = 480) 
dev.off()