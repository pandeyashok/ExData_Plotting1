# Read rows from the big file
allLines <- readLines("./household_power_consumption.txt")
# Read rows for 2 days only (Feb 1 and Feb 2)
seletedLines <- grep("^[12]/2/2007", substr(allLines, 1,8))
# Read data for 2 days only
seleteddata <- read.table(text=Lines[seletedLines], header = TRUE, sep=";", col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Open png graphics device
png(filename = "plot1.png",
    width = 480, height = 480, units = "px", 
    bg = "white")

# Plot graph 
hist(seleteddata$Global_active_power,main="Global Active Power",
     xlab="Global Active Power (Killowats)",col="red")

# Close device
dev.off()