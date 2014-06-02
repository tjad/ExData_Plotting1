#Add specific date converter
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )

df <- read.csv2('household_power_consumption.txt', na.strings = '?', colClasses=c('Date'='myDate'))
#Data to be used within these dates
dates <- c(as.Date('2007-02-01'),  as.Date('2007-02-02'))

df <- df[df$Date %in% dates,]

df$DateTime <- as.POSIXct(paste(df$Date,df$Time))

#Allow 4 plots 2 rows, 2 columns
par(mfrow=c(2,2))

#Plot 1 Global Active Power
plot(as.numeric(as.character(Global_active_power)) ~ DateTime, df, col='black', type='l', ylab='Global Active Power')

#Plot 2 Voltage
plot(as.numeric(as.character(Voltage)) ~ DateTime, df, col='black', type='l', ylab='Voltage', xlab='datetime')

#Plot 3 Submetering
plot(as.numeric(as.character(Sub_metering_1)) ~ DateTime, df, col='black', type='n', ylab='Global Active Power(kilowatts)', yaxt='n')

#Add axis
axis(side=2, at=seq(0,30,10))
lines(as.numeric(as.character(Sub_metering_1)) ~ DateTime, df, col='black')
lines(as.numeric(as.character(Sub_metering_2)) ~ DateTime, df, col='red')
lines(as.numeric(as.character(Sub_metering_3)) ~ DateTime, df, col='blue')
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red','blue'), lty=c(1,1,1), cex=0.7, bty='n')

#Plot 4 Global Reactive Power
plot(as.numeric(as.character(Global_reactive_power)) ~ DateTime, df, col='black', type='l', ylab='Global_reactive_power', xlab='datetime')

#Save to 480x480 png called plot4.png
dev.copy(png,'plot4.png')

#close current(png) device
dev.off()