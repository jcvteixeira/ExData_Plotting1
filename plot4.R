## Load data
if (!exists("xsub")) {
  x=read.csv("data/household_power_consumption.txt",sep=";",na.strings="?",stringsAsFactors = F)
  temp=paste(x[,1],x[,2])
  xDateTime=strptime(temp,"%d/%m/%Y %H:%M:%S")
  xDate=as.Date(xDateTime)
  x=cbind(Date=xDate,DateTime=xDateTime,x[,3:9])
  ## subset
  xsub=x[x$Date=="2007-02-01" | x$Date=="2007-02-02",]
  ## delete temp variables
  rm(x,temp,xDateTime,xDate)
}

# set locale to English in order to get x-axis labels in English in the time-series plots
Sys.setlocale("LC_TIME","English")

## Plot 4
par(mfrow = c(2, 2))
with(xsub, plot(DateTime,Global_active_power,type="l",xlab="",ylab="Global Active Power"))
with(xsub, plot(DateTime,Voltage,type="l",xlab="datetime"))
plot(xsub$DateTime,xsub$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(xsub$DateTime,xsub$Sub_metering_2,type="l",col="red")
lines(xsub$DateTime,xsub$Sub_metering_3,type="l",col="blue")
legend("topright", bty="n", lty=1, col = c("black","red","blue"), c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
with(xsub,plot(DateTime,Global_reactive_power,type="l",xlab="datetime"))
dev.copy(png, file = "plot4.png")
dev.off()
