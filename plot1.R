#read in the dataset 
dataFile <- "/Users/ziyangwang/Desktop/coursera/Exploratory Data Analysis/power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#subset the dataset
#subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
subset1 <- subset(data,Date == "1/2/2007" | Date == "2/2/2007")
#extract Global_active_power
subset2 <- subset(subset1,select = Global_active_power) 
Global_active_power <- as.numeric(subset2$Global_active_power)

#draw graph and save to png file
png(filename = "plot1.png",width = 480,height = 480)
hist(Global_active_power,col = "red",main = "Global Active Power",xlab="Global Active Power (kilowatts)",ylab = "Frequency")
dev.off() #close the png device, see the file 
