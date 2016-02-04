library(data.table)
data <- fread("household_power_consumption.txt",header=TRUE,na.strings="?")
data[,Date:=as.Date(Date,format="%d/%m/%Y")]
data <-data[data$Date>=as.Date("2007-02-01")&data$Date<=as.Date("2007-02-02"),]
t <- strptime(paste(data$Date,data$Time),format="%Y-%m-%d %H:%M:%S")
png(file="plot2.png",width=480,height=480)
plot(t,data$Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowatts)")
dev.off()
