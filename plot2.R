## Read the source data
epc <- read.csv("household_power_consumption.txt", header=TRUE, sep=";",stringsAsFactors=FALSE)

## Filter by required dates
epc2 <- epc[epc$Date == "1/2/2007" | epc$Date == "2/2/2007",]

## Create DateTime variable by pasting Date and Time
epc3 <- transform(epc2, DateTime=as.POSIXlt(paste(Date,Time, sep=" "),format="%d/%m/%Y %H:%M:%S"))
                  
## Open the png device
png(file ="plot2.png")

## Create plot2.png: Plot DateTime & Global_active_power
with(epc3,plot(DateTime,Global_active_power, xlab=" ",ylab="Global Active Power(kilowatts)",type="l"))

## Close the device
dev.off()
