#read in the dataset 
dataFile <- "/Users/ziyangwang/Desktop/coursera/Exploratory Data Analysis/power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#subset the dataset
#subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
subset1 <- subset(data,Date == "1/2/2007" | Date == "2/2/2007")
#extract Global_active_power
subset2 <- subset(subset1,select = Global_active_power) 
Global_active_power <- as.numeric(subset2$Global_active_power)

#extract time and date ,then change the datatyple of time variables
datetime <- strptime(paste(subset1$Date, subset1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#open the png device 
png("plot2.png",height = 480,width = 480)
#plot the graph and save 
plot(datetime,Global_active_power,type="l",ylab="Global Active Power (kilowatts)")
dev.off()


