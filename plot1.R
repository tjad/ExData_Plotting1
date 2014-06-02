setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )

df <- read.csv2('household_power_consumption.txt', na.strings = '?', colClasses=c('Date'='myDate'))

#Data to be used within these dates
dates <- c(as.Date('2007-02-01'),  as.Date('2007-02-02'))

df <- df[df$Date %in% dates,]

#Force 1 plot
par(mfrow=c(1,1))

#Create histogram of global active power
hist(as.numeric(as.character(df$Global_active_power)), col='red', xlab='Global Active Power(kilowatts)', main='Global Active Power')

#Save to 480x480 png called plot1.png
dev.copy(png,'plot1.png')

#close current(png) device
dev.off()