setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )

df <- read.csv2('household_power_consumption.txt', na.strings = '?', colClasses=c('Date'='myDate'))
#Data to be used within these dates
dates <- c(as.Date('2007-02-01'),  as.Date('2007-02-02'))

df <- df[df$Date %in% dates,]

df$DateTime <- as.POSIXct(paste(df$Date,df$Time))

#Force 1 plot
par(mfrow=c(1,1))

#Create global active power line plot by datetime
plot(as.numeric(as.character(Global_active_power)) ~ DateTime, df, col='black', type='l', ylab='Global Active Power(kilowatts)')


#Save to 480x480 png called plot2.png
dev.copy(png,'plot2.png')

#close current(png) device
dev.off()