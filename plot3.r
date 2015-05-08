##Getting and cleaning data
Complete_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
Complete_data$Date <- as.Date(Complete_data$Date, format="%d/%m/%Y")
data_graph <- subset(Complete_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
## Creating the graph
datetime <- paste(as.Date(data_graph$Date), data_graph$Time)
data_graph$Datetime <- as.POSIXct(datetime)
plot(data_graph$Sub_metering_1~data_graph$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
lines(data_graph$Sub_metering_2~data_graph$Datetime,col='Red')
lines(data_graph$Sub_metering_3~data_graph$Datetime,col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=3,legend=c("sub metering 1","sub metering 2","sub metering 3"))
##Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

