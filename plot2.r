##Getting and cleaning data
Complete_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
Complete_data$Date <- as.Date(Complete_data$Date, format="%d/%m/%Y")
data_graph <- subset(Complete_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
## Creating the graph
datetime <- paste(as.Date(data_graph$Date), data_graph$Time)
data_graph$Datetime <- as.POSIXct(datetime)
plot(data_graph$Global_active_power~data_graph$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
##Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

