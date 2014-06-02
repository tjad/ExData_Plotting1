setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )

df <- read.csv2('household_power_consumption.txt', na.strings = '?', colClasses=c('Date'='myDate'))

fromDate <- as.Date('2007-02-01')
toDate <- as.Date('2007-02-02')

df <- df[df$Date == fromDate | df$Date == toDate,]

plot(as.numeric(Global_active_power)~ Date, df, type="l", col='black', ylab='Global Active Power(kilowatts)', xact='n')

dev.copy(png,'plot2.png')
dev.off()