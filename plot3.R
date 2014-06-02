setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )

df <- read.csv2('household_power_consumption.txt', na.strings = '?', colClasses=c('Date'='myDate'))
#Data to be used within these dates
dates <- c(as.Date('2007-02-01'),  as.Date('2007-02-02'))

df <- df[df$Date %in% dates,]

df$DateTime <- as.POSIXct(paste(df$Date,df$Time))


#Force 1 plot
par(mfrow=c(1,1))

#Initialize plot canvas
plot(as.numeric(as.character(Sub_metering_1)) ~ DateTime, df, col='black', type='n', ylab='Global Active Power(kilowatts)')

#Add submetering 1
lines(as.numeric(as.character(Sub_metering_1)) ~ DateTime, df, col='black')

#Add submetering 2
lines(as.numeric(as.character(Sub_metering_2)) ~ DateTime, df, col='red')

#Add submetering 3
lines(as.numeric(as.character(Sub_metering_3)) ~ DateTime, df, col='blue')

#Add legend to topright
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red','blue'), lty=c(1,1,1), cex=0.7)


#Save to 480x480 png called plot3.png
dev.copy(png,'plot3.png')

#close current(png) device
dev.off()