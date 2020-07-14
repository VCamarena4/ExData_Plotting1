#Course Project 1: Exploratory Data Analysis


#Data

power_consumption <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power_consumption) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#Create a subset in order to save memory consumption
subpower_consumption <- subset(power_consumption,power_consumption$Date=="1/2/2007" | power_consumption$Date =="2/2/2007")

#Generate png

png("plot1.png", width=480, height=480)

#Basic plot function for histograms
hist(as.numeric(as.character(subpower_consumption$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

#Annotations
title(main="Global Active Power")

#close png
dev.off()