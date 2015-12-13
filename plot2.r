## Coursera - Exploratory Data Analysis - Plot2

#set working directory 
#setwd("D:/Study Materials/CourseEra Videos/Explaratory Analysis/Home Work")

filename = "exdata_plotting1.zip"
if (!file.exists(filename)) {
  loaddata = download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                         destfile = filename)
}

## unzip and read the data
df = read.csv(unz(filename, "household_power_consumption.txt"), header=T,
                    sep=";", stringsAsFactors=F, na.strings="?",
                    colClasses=c("character", "character", "numeric",
                                 "numeric", "numeric", "numeric",
                                 "numeric", "numeric", "numeric"))

## Format the date and subset the data only for two days
df$timestamp = strptime(paste(df$Date, df$Time),
                              format="%d/%m/%Y %H:%M:%S", tz="UTC")
startDate = strptime("01/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S", tz="UTC")
endDate = strptime("02/02/2007 23:59:59", format="%d/%m/%Y %H:%M:%S", tz="UTC")
df = df[df$timestamp >= startDate & df$timestamp <= endDate, ]


## Create the plot
png(filename="plot2.png", width=480, height=480)
plot(df$timestamp, df$Global_active_power, type="l",xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()

