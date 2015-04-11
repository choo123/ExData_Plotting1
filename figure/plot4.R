#read and edit file
df <- read.table("household_power_consumption.txt", header = TRUE, as.is = TRUE, sep = ";")
df <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")
df.orig = df
df$DateTime = paste(df$Date, df$Time)
df$DateTime = strptime(df$DateTime, "%d/%m/%Y %H:%M:%S")  
df$Global_active_power = as.numeric(df$Global_active_power)
df$Sub_metering_1 = as.numeric(df$Sub_metering_1)
df$Sub_metering_2 = as.numeric(df$Sub_metering_2)
df$Sub_metering_3 = as.numeric(df$Sub_metering_3)
Sys.setlocale("LC_TIME", "English")
df$Weekday <- weekdays(df$DateTime, abbreviate = TRUE)

#plot 4
png( "plot4.png", width = 480, height = 480,units = "px")
par(mfrow=c(2,2))
#plot a
plot(df$DateTime,df$Global_active_power, type="l", ylab = "Global active Power (kilowatts)", xlab="")
#plot b
plot(df$DateTime,df$Voltage, type="l", ylab = "Voltage", xlab="datetime")
#plot c
plot(df$DateTime,df$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab="")
points(df$DateTime,df$Sub_metering_2, type="l", col = "red")
points(df$DateTime,df$Sub_metering_3, type="l", col = "blue")
legend("topright", bty = 'n', lty=1,col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
#plot d
plot(df$DateTime,df$Global_reactive_power, type="l", ylab = "Global_reactive_power", xlab="datetime")
dev.off ()