## prepare dataset

final <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

## Format date to Type Date
final$Date <- as.Date(final$Date, "%d/%m/%Y")

## Filter data set from Feb. 1, 2007 to Feb. 2, 2007
final <- subset(final,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

final <- final[complete.cases(final),]

## Combine Date and Time column
dateTime <- paste(final$Date, final$Time)

## Name the vector
dateTime <- setNames(dateTime, "DateTime")

## Remove Date and Time column
final <- final[ ,!(names(final) %in% c("Date","Time"))]

## Add DateTime column
final <- cbind(dateTime, final)

## Format dateTime Column
final$dateTime <- as.POSIXct(dateTime)
