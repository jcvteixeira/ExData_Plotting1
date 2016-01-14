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

## Plot 2
plot(xsub$DateTime,xsub$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png")
dev.off()
