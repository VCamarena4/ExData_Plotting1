#Course Project 1: Exploratory Data Analysis


#Data
power_consumption <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power_consumption) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower_consumption <- subset(power_consumption,power_consumption$Date=="1/2/2007" | power_consumption$Date =="2/2/2007")

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
subpower_consumption$Date <- as.Date(subpower_consumption$Date, format="%d/%m/%Y")
subpower_consumption$Time <- strptime(subpower_consumption$Time, format="%H:%M:%S")
subpower_consumption[1:1440,"Time"] <- format(subpower_consumption[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpower_consumption[1441:2880,"Time"] <- format(subpower_consumption[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# Generating png
png("plot2.png", width=480, height=480)

# Basic plot
plot(subpower_consumption$Time,as.numeric(as.character(subpower_consumption$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

#Annotation
title(main="Global Active Power Vs Time")

#Close png
dev.off()