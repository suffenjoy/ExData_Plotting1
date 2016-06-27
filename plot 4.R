#read the data set 
setwd("~/Box Sync/2016 Spring/Data Science/Exploratory Data Analysis/week 1")
house<-read.table("household_power_consumption.txt",header = TRUE,sep = ";")
house$Date<-as.Date(house$Date,"%d/%m/%Y")
sample_house<-subset(house,house$Date== "2007-02-02" | house$Date=="2007-02-01" )

#time
library(lubridate)
dt_tm<-paste(sample_house$Date,sample_house$Time,sep = " ")
dt_tm<-ymd_hms(dt_tm)

png(filename = "plot4.png",width = 480,height = 480,units = "px")
#par 
par(mfrow=c(2,2),cex=0.65)
#plot 1
#time series plot of active power
sample_house$Global_active_power<-as.numeric(as.character(sample_house$Global_active_power))
power_kilo<-as.numeric(as.character(sample_house$Global_active_power))
plot(x=dt_tm,y=power_kilo,type = 'l',
     xlab = "",ylab="Global Active Power")

#plot 2
#Plot of voltage
voltage<-as.numeric(as.character(sample_house$Voltage))
plot(x=dt_tm,y=voltage,type = 'l',xlab="datetime",ylab="Voltage")

#plot 3
#plot of energy sub metering
#change sub metering from factor to numeric
sample_house$Sub_metering_1<-as.numeric(as.character(sample_house$Sub_metering_1))
sample_house$Sub_metering_2<-as.numeric(as.character(sample_house$Sub_metering_2))
sample_house$Sub_metering_3<-as.numeric(as.character(sample_house$Sub_metering_3))
#black line, sub_metering_1
plot(x=dt_tm,y=sample_house$Sub_metering_1,col="black",type = 'l',
     xlab = "",ylab = "Energy sub metering")
#red line, sub_metering_2
lines(x=dt_tm,y=sample_house$Sub_metering_2,col="red")
#blue line, sub_metering_3
lines(x=dt_tm,y=sample_house$Sub_metering_3,col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),bty="n",lty = 1,cex = 0.8)

#plot 4
#plot of global reactive power 
reactive_power<-as.numeric(as.character(sample_house$Global_reactive_power))
plot(x=dt_tm,y=reactive_power,
     ylab = "Global_reative_power",xlab="datetime",type='l',yaxt='n')
axis(side = 2,at=seq(0,0.5,0.1),labels=seq(0,0.5,0.1))

dev.off()
