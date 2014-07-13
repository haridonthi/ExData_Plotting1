## Read the source data
epc <- read.csv("household_power_consumption.txt", header=TRUE, sep=";",stringsAsFactors=FALSE)

## Filter by required dates
epc2 <- epc[epc$Date == "1/2/2007" | epc$Date == "2/2/2007",]

## Open the png device
png(file="plot1.png")

## Create histogram of Global Active Power
hist(as.numeric(epc2$Global_active_power),xlab="Global Active Power (kilowatts)",main ="Global Active Power", col="red")

## Close the device
dev.off()
