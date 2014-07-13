## Read the source data
epc <- read.csv("household_power_consumption.txt", header=TRUE, sep=";",stringsAsFactors=FALSE)

## Filter by required dates
epc2 <- epc[epc$Date == "1/2/2007" | epc$Date == "2/2/2007",]

## Create DateTime variable by pasting Date and Time
epc3 <- transform(epc2, DateTime=as.POSIXlt(paste(Date,Time, sep=" "),format="%d/%m/%Y %H:%M:%S"))
                  
## Open the png device
png(file ="plot4.png")

## Create plot4.png: Draw empty plot, then add datasets, then legend
par(mfrow=c(2,2))
with(epc3,{
  plot(DateTime,Global_active_power, xlab=" ",ylab="Global Active Power(kilowatts)",type="l")
  plot(DateTime,Voltage, xlab=" ",ylab="Voltage",type="l")
  {
    plot(DateTime,Sub_metering_1, xlab="",ylab="Energy sub metering", type="n")
    points(DateTime, Sub_metering_1, type="l")
    points(DateTime, Sub_metering_2, type="l", col="red")
    points(DateTime, Sub_metering_3, type="l", col="blue")
    legend("topright", lty="solid", col=c("black","blue","red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  }
plot(DateTime,Global_reactive_power, xlab=" ",type="l")
})



## Close the device
dev.off()
