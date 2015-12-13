## Coursera - Exploratory Data Analysis - Plotting Assignment 1
##
## plot1.R - generates plot1.png

setwd("D:/Study Materials/CourseEra Videos/Explaratory Analysis/Home Work")
filename = "exdata_plotting1.zip"
if (!file.exists(filename)) {
  loaddata = download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                         destfile = filename)
}

## unzip and read the data
df = read.csv(unz(filename, "household_power_consumption.txt"), header=T, 
              sep=";", na.strings="?", 
              colClasses=c("character", "character", "numeric", 
                           "numeric", "numeric", "numeric", 
                           "numeric", "numeric", "numeric"))

## Format the date and subset the data only for two days 
df$Date = as.Date(df$Date, format="%d/%m/%Y")
startDate = as.Date("01/02/2007", format="%d/%m/%Y")
endDate = as.Date("02/02/2007", format="%d/%m/%Y")
df = df[df$Date >= startDate & df$Date <= endDate, ]

## Create the plot
png(filename="plot1.png", width=480, height=480)
hist(df$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", col="red")
dev.off()



