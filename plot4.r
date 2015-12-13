## Coursera - Exploratory Data Analysis - Plot4


filename = "exdata_plotting1.zip"
if (!file.exists(filename)) {
  loaddata = download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                         destfile = filename)
}

## Read the data from the contents of the zip file
df = read.csv(unz(filename, "household_power_consumption.txt"), header=T,
                    sep=";", stringsAsFactors=F, na.strings="?",
                    colClasses=c("character", "character", "numeric",
                                 "numeric", "numeric", "numeric",
                                 "numeric", "numeric", "numeric"))

## Format the date and time and subset the data for two days
df$timestamp = strptime(paste(df$Date, df$Time),
                              format="%d/%m/%Y %H:%M:%S", tz="UTC")
startDate = strptime("01/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S", tz="UTC")
endDate = strptime("02/02/2007 23:59:59", format="%d/%m/%Y %H:%M:%S", tz="UTC")
df = df[df$timestamp >= startDate & df$timestamp <= endDate, ]

## Creat the plot
png(filename="plot4.png", width=480, height=480)

# Set the canvas for 4 plots
par(mfrow=c(2,2))

# plot-1
plot(df$timestamp, df$Global_active_power, type="l", xlab="",
     ylab="Global Active Power")

# plot-2
plot(df$timestamp, df$Sub_metering_1, type="l", xlab="",
     ylab="Energy sub metering")
lines(df$timestamp, df$Sub_metering_2, col="red")
lines(df$timestamp, df$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lwd=par("lwd"), bty="n")

# plot-3
plot(df$timestamp, df$Voltage, type="l",
     xlab="datetime", ylab="Voltage")

# plot-4
plot(df$timestamp, df$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global_reactive_power")

dev.off()

