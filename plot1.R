library(data.table)
data <- fread("household_power_consumption.txt",header=TRUE,na.strings="?")
data[,Date:=as.Date(Date,format="%d/%m/%Y")]
data <-data[data$Date>=as.Date("2007-02-01")&data$Date<=as.Date("2007-02-02"),]
png(file="plot1.png",width=480,height=480)
hist(data$Global_active_power,col="red",xlab="Global Active Power(kilowatts)",main="Global Active Power")
dev.off()
