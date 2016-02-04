library(data.table)
data <- fread("household_power_consumption.txt",header=TRUE,na.strings="?")
data[,Date:=as.Date(Date,format="%d/%m/%Y")]
data <-data[data$Date>=as.Date("2007-02-01")&data$Date<=as.Date("2007-02-02"),]
t <- strptime(paste(data$Date,data$Time),format="%Y-%m-%d %H:%M:%S")

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(t,data$Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowatts)")

plot(t,data$Voltage,type="l",xlab="datetime",ylab="Voltage")

plot(t,data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(t,data$Sub_metering_2,col="red")
lines(t,data$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1,bty="n") 

plot(t,data$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()

