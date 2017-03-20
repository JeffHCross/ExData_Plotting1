## Read data in
power <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", 
                        check.names = FALSE, na.strings="?")
## Create new column for Date
power$POSIX_Date <- strptime(paste(power$Date, power$Time), 
                                 format = "%d/%m/%Y %H:%M:%S")
## Subset the data using the new column
power <- power[grep("2007-02-01|2007-02-02",power$POSIX_Date), ]

## Plot2.png creation starts here
png("plot2.png", width=480, height = 480, bg="transparent")
plot(power$POSIX_Date, power$Global_active_power, type="S", xlab="", 
     ylab="Global Active Power (kilowatts)")
dev.off()