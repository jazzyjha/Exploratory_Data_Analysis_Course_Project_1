## Read data from the household_power_consumption.txt file into read_data
read_data<-read.table ("household_power_consumption.txt", header = TRUE, sep=";",na.strings="?")

## subset data from the entire date set for the dates Feb 1 and Feb 2, 2007. Date format is dd/mm/yyyy
our_data<-subset(read_data, Date =="1/2/2007" | Date == "2/2/2007")


## Set time variable
DateTime<-strptime(paste(our_data$Date,our_data$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S") 
our_data<-cbind(DateTime, our_data)

## Give the chart file a name
png(file="plot2.png")

## Plot the line graph
plot(our_data$DateTime, our_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## Close the device. The plot is saved in the png file.
dev.off()
