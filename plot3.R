#read in the dataset 
dataFile <- "/Users/ziyangwang/Desktop/coursera/Exploratory Data Analysis/power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#subset the dataset
subset1 <- subset(data,Date == "1/2/2007" | Date == "2/2/2007")
#extract Global_active_power
subset2 <- subset(subset1,select = Global_active_power) 
Global_active_power <- as.numeric(subset2$Global_active_power)

#extract energy submetering 
subset3 <- subset(subset1,select = Sub_metering_1)
Sub_metering_1 <- as.numeric(subset3$Sub_metering_1)

subset4 <- subset(subset1,select = Sub_metering_2)
Sub_metering_2 <- as.numeric(subset4$Sub_metering_2)

subset5 <- subset(subset1,select = Sub_metering_3)
Sub_metering_3 <- as.numeric(subset5$Sub_metering_3)

#extract time and date ,then change the datatyple of time variables
datetime <- strptime(paste(subset1$Date, subset1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#open the device 
png("plot3.png",width = 480,height = 480)
#paint 
plot(datetime,Sub_metering_1 , type="l", ylab="Energy Submetering", xlab="")
lines(datetime,Sub_metering_2,type = "l",col = "red")
lines(datetime,Sub_metering_3,type = "l",col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()