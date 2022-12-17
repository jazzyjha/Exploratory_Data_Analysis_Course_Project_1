
## Read data from the household_power_consumption.txt file into read_data
read_data<-read.table ("household_power_consumption.txt", header = TRUE, sep=";",na.strings="?")

## subset data from the entire date set for the dates Feb 1 and Feb 2, 2007. Date format is dd/mm/yyyy
our_data<-subset(read_data, Date =="1/2/2007" | Date == "2/2/2007")

## Give the chart file a name
png(file="plot1.png")

## Create the histogram. Plot the data
hist(as.numeric(our_data$Global_active_power), main="Global Active Power", xlab="Global Active Power (kilowatts)", xlim = c(0,6), ylim = c(0,1200), breaks = 12,col="red", border="black")

## Close the device. Histogram is saved in the png file.
dev.off()
