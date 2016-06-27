#read the data set 
setwd("~/Box Sync/2016 Spring/Data Science/Exploratory Data Analysis/week 1")
house<-read.table("household_power_consumption.txt",header = TRUE,sep = ";")
house$Date<-as.Date(house$Date,"%d/%m/%Y")
sample_house<-subset(house,house$Date== "2007-02-02" | house$Date=="2007-02-01" )

#change sub metering from factor to numeric
sample_house$Sub_metering_1<-as.numeric(as.character(sample_house$Sub_metering_1))
sample_house$Sub_metering_2<-as.numeric(as.character(sample_house$Sub_metering_2))
sample_house$Sub_metering_3<-as.numeric(as.character(sample_house$Sub_metering_3))

#time
library(lubridate)
dt_tm<-paste(sample_house$Date,sample_house$Time,sep = " ")
dt_tm<-ymd_hms(dt_tm)

#plot
png(filename = "plot3.png",width = 480,height = 480,units = "px")
par(mfrow=c(1,1),cex=0.75)
#black line, sub_metering_1
plot(x=dt_tm,y=sample_house$Sub_metering_1,col="black",type = 'l',
     xlab = "",ylab = "Energy sub metering")
#red line, sub_metering_2
lines(x=dt_tm,y=sample_house$Sub_metering_2,col="red")
#blue line, sub_metering_3
lines(x=dt_tm,y=sample_house$Sub_metering_3,col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty = 1,cex = 1
)
dev.off()
