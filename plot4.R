### Program to plot a graph (plot4.png)

# Read rows from the big file
allLines <- readLines("./household_power_consumption.txt")

# Read rows for 2 days only (Feb 1 and Feb 2)
seletedLines <- grep("^[12]/2/2007", substr(allLines, 1,8))

# Read data for 2 days only
seleteddata <- read.table(text=Lines[seletedLines], header = TRUE, sep=";", col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Add a date time column
seleteddata$DateTime <- as.POSIXct(strptime(paste(seleteddata$Date,seleteddata$Time), "%d/%m/%Y %H:%M:%S"))



# Open PNG graphic device
png(filename = "plot4.png",
    width = 480, height = 480, units = "px", 
    bg = "white")
par(mfrow=c(2,2))


#plot-1
plot(seleteddata$DateTime,seleteddata$Global_active_power,type="l",
     xlab="",ylab="Global Active Power")

#plot-2
plot(seleteddata$DateTime,seleteddata$Voltage,type="l",
     xlab="datetime",ylab="Voltage")


#plot-3 
plot(x=seleteddata$DateTime,y=seleteddata$Sub_metering_1,type="l",
     xlab="",ylab="Energy Sub metering")
lines(x=seleteddata$DateTime,y=seleteddata$Sub_metering_2, type="l",col="red")
lines(x=seleteddata$DateTime,y=seleteddata$Sub_metering_3, type="l",col="blue")

# Add legends
legendTxt <-c("Sub_metering_1","Sub_metering_2", "Sub_metering_3")
legend("topright",legendTxt,lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","blue","red"))

#plot-4
plot(seleteddata$DateTime,seleteddata$Global_reactive_power,type="l",
     xlab="datetime",ylab="Global_reactive_power")

# close device
dev.off()