## Read data from the household_power_consumption.txt file into read_data
read_data<-read.table ("household_power_consumption.txt", header = TRUE, sep=";",na.strings="?")

## subset data from the entire date set for the dates Feb 1 and Feb 2, 2007. Date format is dd/mm/yyyy
our_data<-subset(read_data, Date =="1/2/2007" | Date == "2/2/2007")


## Set time variable
DateTime<-strptime(paste(our_data$Date,our_data$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S") 
our_data<-cbind(DateTime, our_data)

## Give the chart file a name
png(file="plot3.png")

## Plot the graph
plot(our_data$DateTime,our_data$Sub_metering_1,type="l", xlab="", ylab="Energy sub metering",col="black")
lines(our_data$DateTime, our_data$Sub_metering_2, type="l", col="red")
lines(our_data$DateTime, our_data$Sub_metering_3, type="l", col="blue")
 
## Add legend
legend(x="topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black", "red", "blue"), lty="solid") 


## Close the device. The plot is saved in the png file.
dev.off()
