##Getting and cleaning data
Complete_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
Complete_data$Date <- as.Date(Complete_data$Date, format="%d/%m/%Y")
data_graph <- subset(Complete_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
## Creating the graph with 4 places
par(mfrow=c(2,2), mar=c(2,2,2,2), oma=c(0,0,2,0))
##Plot 1
hist(data_graph$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (Kilowatts)", ylab="Frequency", col="Red")

##Dates
datetime <- paste(as.Date(data_graph$Date), data_graph$Time)
data_graph$Datetime <- as.POSIXct(datetime)

##Plot 2
plot(data_graph$Global_active_power~data_graph$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

##Plot 3
plot(data_graph$Sub_metering_1~data_graph$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
lines(data_graph$Sub_metering_2~data_graph$Datetime,col='Red')
lines(data_graph$Sub_metering_3~data_graph$Datetime,col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1,cex=0.5, lwd=1,legend=c("submetering 1","submetering 2","submetering 3"))

##Plot 4
plot(data_graph$Global_reactive_power~data_graph$Datetime, type="l",ylab="Global_reactive_power", xlab="")



##Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

