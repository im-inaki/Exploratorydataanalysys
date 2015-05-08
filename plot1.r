##Getting and cleaning data
Complete_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
Complete_data$Date <- as.Date(Complete_data$Date, format="%d/%m/%Y")
data_graph <- subset(Complete_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
## Creating the graph
hist(data_graph$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (Kilowatts)", ylab="Frequency", col="Red")
##Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
