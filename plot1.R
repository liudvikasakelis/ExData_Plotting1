### import the data 

edata <- read.csv('household_power_consumption.txt', sep=';', header=T, 
                  stringsAsFactors = F)
edata <- edata[edata$Date %in% c('1/2/2007', '2/2/2007'),]
edata$Global_active_power <- as.numeric(edata$Global_active_power)

### Draw the plot

png('plot1.png', width=480, height=480, bg='transparent')

hist(edata$Global_active_power, 
     main="Global Active Power",
     col='red',
     xlab='Global Active Power (kilowatts)')



dev.off()