#reading the data
household_power <- read.table("/Users/ashleycampisano/Downloads/household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
household_powersub <-rbind(household_power[household_power$Date=="1/2/2007",],household_power[household_power$Date=="2/2/2007",])

household_powersub$Date <- as.Date(household_powersub$Date,"%d/%m/%Y")
household_powersub<-cbind(household_powersub, "DateTime" = as.POSIXct(paste(household_powersub$Date, household_powersub$Time)))

#plot 1: Global Active Power (kw) vs Frequency

hist(household_powersub$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red")

dev.copy(png, file = "plot1.png", width = 480, height = 480) 
dev.off()