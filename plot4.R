## Read data in
power <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", 
                        check.names = FALSE, na.strings="?")
## Create new column for Date
power$POSIX_Date <- strptime(paste(power$Date, power$Time), 
                                 format = "%d/%m/%Y %H:%M:%S")
## Subset the data using the new column
power <- power[grep("2007-02-01|2007-02-02",power$POSIX_Date), ]

## Plot4.png creation starts here
png("plot4.png", width=480, height = 480, bg="transparent")
par(mfrow = c(2,2))

## Top-left
plot(power$POSIX_Date, power$Global_active_power, type="S", xlab="", 
     ylab="Global Active Power")

## Top-right
plot(power$POSIX_Date, power$Voltage, type="S", xlab="datetime", ylab="Voltage")

## Lower-left
plot(power$POSIX_Date, power$Sub_metering_1, type = "n", 
     xlab="", ylab="Energy sub metering")
with(power, points(power$POSIX_Date, power$Sub_metering_1, type="S", col="black"))
with(power, points(power$POSIX_Date, power$Sub_metering_2, type="S", col="red"))
with(power, points(power$POSIX_Date, power$Sub_metering_3, type="S", col="blue"))
legend("topright", col=c("black","red","blue"), 
       legend = c("Sub_metering1","Sub_metering2","Sub_metering3"), 
       lwd=par("lwd"), bty = "n")

## Lower-right
plot(power$POSIX_Date, power$Global_reactive_power, type="S", 
     xlab="datetime", ylab="Global_reactive_power")

## fin
dev.off()