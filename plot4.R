#Global power,Voltage,energy sub,global reactive power

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
#extract Voltage
subset6 <- subset (subset1,select = Voltage )
Voltage <- as.numeric(subset6$Voltage)
#extract reactive power
subset7 <-subset(subset1,select = Global_reactive_power)
Global_reactive_power <- as.numeric(subset7$Global_reactive_power)

#extract time and date ,then change the datatyple of time variables
datetime <- strptime(paste(subset1$Date, subset1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#open png device 
png("plot4",width = 480,height = 480)
par(mfrow = c(2, 2)) 

#first graph 
hist(Global_active_power,col = "red",main = "Global Active Power",xlab="Global Active Power (kilowatts)",ylab = "Frequency")
#second 
plot(datetime,Global_active_power,type="l",ylab="Global Active Power (kilowatts)")
#third
plot(datetime,Sub_metering_1 , type="l", ylab="Energy Submetering", xlab="")
lines(datetime,Sub_metering_2,type = "l",col = "red")
lines(datetime,Sub_metering_3,type = "l",col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
#4th
plot(datetime,Global_reactive_power,type = "l",ylab = "Global Reactive Power")

dev.off()
