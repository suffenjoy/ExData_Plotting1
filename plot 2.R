#read the data set 
setwd("~/Box Sync/2016 Spring/Data Science/Exploratory Data Analysis/week 1")
house<-read.table("household_power_consumption.txt",header = TRUE,sep = ";")
house$Date<-as.Date(house$Date,"%d/%m/%Y")
sample_house<-subset(house,house$Date== "2007-02-02" | house$Date=="2007-02-01" )

#time
library(lubridate)
dt_tm<-paste(sample_house$Date,sample_house$Time,sep = " ")
dt_tm<-ymd_hms(dt_tm)

power_kilo<-as.numeric(as.character(sample_house$Global_active_power))
par(mfrow=c(1,1),cex=0.75)
#time series plot
png(filename = "plot2.png",width = 480,height = 480,units = "px")
plot(x=dt_tm,y=power_kilo,type = 'l',
     xlab = "",ylab="Global Active Power (kilowatts)")
dev.off()