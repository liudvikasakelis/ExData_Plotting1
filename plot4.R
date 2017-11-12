### import the data 

edata <- read.csv('household_power_consumption.txt', sep=';', header=T, 
                  stringsAsFactors = F)
edata <- edata[edata$Date %in% c('1/2/2007', '2/2/2007'),]

edata$Global_active_power <- as.numeric(edata$Global_active_power)

edata$Sub_metering_1 <- as.numeric(edata$Sub_metering_1)
edata$Sub_metering_2 <- as.numeric(edata$Sub_metering_2)
edata$Sub_metering_3 <- as.numeric(edata$Sub_metering_3)

edata$Voltage <- as.numeric(edata$Voltage)

edata$Global_reactive_power <- as.numeric(edata$Global_reactive_power)

edata$DateTime <- as.POSIXct(paste(edata$Date, edata$Time), 
                             format='%d/%m/%Y %H:%M:%S')

### plot

png('plot4.png', width=480, height=480, bg='transparent')
par(mfrow=c(2,2))

with(edata, {
    plot(DateTime, Global_active_power, type='l', 
         ylab='Global active power (kilowatts)', xlab='')
    
    plot(DateTime, Voltage, type='l', ylab='Voltage')
    
    plot(DateTime, Sub_metering_1, type='n', 
                     ylab='Energy sub metering', xlab='')
    lines(DateTime, Sub_metering_1, type='l', col='black')
    lines(DateTime, Sub_metering_2, type='l', col='red')
    lines(DateTime, Sub_metering_3, type='l', col='blue')
    legend(legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
           col = c('black', 'red', 'blue'), x='topright', lty=c(1,1))
    
    plot(DateTime, Global_reactive_power, type='l')
})

dev.off()
