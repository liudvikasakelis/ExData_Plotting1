### import the data 

edata <- read.csv('household_power_consumption.txt', sep=';', header=T, 
                  stringsAsFactors = F)
edata <- edata[edata$Date %in% c('1/2/2007', '2/2/2007'),]

edata$Sub_metering_1 <- as.numeric(edata$Sub_metering_1)
edata$Sub_metering_2 <- as.numeric(edata$Sub_metering_2)
edata$Sub_metering_3 <- as.numeric(edata$Sub_metering_3)

edata$DateTime <- as.POSIXct(paste(edata$Date, edata$Time), 
                             format='%d/%m/%Y %H:%M:%S')

### plot

png('plot3.png', width=480, height=480, bg='transparent')

with(edata, plot(DateTime, Sub_metering_1, type='n', 
                 ylab='Energy sub metering', xlab=''))
with(edata, lines(DateTime, Sub_metering_1, type='l', col='black'))
with(edata, lines(DateTime, Sub_metering_2, type='l', col='red'))
with(edata, lines(DateTime, Sub_metering_3, type='l', col='blue'))

legend(legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col = c('black', 'red', 'blue'), x='topright', lty=c(1,1))

dev.off()