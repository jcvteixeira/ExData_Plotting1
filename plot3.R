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

## Plot 3
plot(xsub$DateTime,xsub$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(xsub$DateTime,xsub$Sub_metering_2,type="l",col="red")
lines(xsub$DateTime,xsub$Sub_metering_3,type="l",col="blue")
legend("topright", lty=1, col = c("black","red","blue"), c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file = "plot3.png")
dev.off()
