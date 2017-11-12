### import the data 

edata <- read.csv('household_power_consumption.txt', sep=';', header=T, 
                  stringsAsFactors = F)
edata <- edata[edata$Date %in% c('1/2/2007', '2/2/2007'),]
edata$Global_active_power <- as.numeric(edata$Global_active_power)

edata$DateTime <- as.POSIXct(paste(edata$Date, edata$Time), 
                             format='%d/%m/%Y %H:%M:%S')

### plot 

png('plot2.png', width=480, height=480, bg='transparent')

with(edata, plot(DateTime, Global_active_power, type='l', ))

dev.off()