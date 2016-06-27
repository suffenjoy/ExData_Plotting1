#read the data set 
setwd("~/Box Sync/2016 Spring/Data Science/Exploratory Data Analysis/week 1")
house<-read.table("household_power_consumption.txt",header = TRUE,sep = ";")
house$Date<-as.Date(house$Date,"%d/%m/%Y")
sample_house<-subset(house,house$Date== "2007-02-02" | house$Date=="2007-02-01" )

sample_house$Global_active_power<-as.numeric(as.character(sample_house$Global_active_power))
power_kilo<-as.numeric(as.character(sample_house$Global_active_power))
png(filename = "plot1.png",width = 480,height = 480,units = "px")
#histogram
par(mfrow=c(1,1),cex=0.75)
hist(power_kilo,main = "Global Active Power",freq = TRUE,
     breaks=12,
     xlab = "Global Active Power (kilowatts)",ylab = "Frequency",
     ylim = c(0,1200),
     col = 'red')
dev.off()