setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )

df <- read.csv2('household_power_consumption.txt', na.strings = '?', colClasses=c('Date'='myDate'))

fromDate <- as.Date('2007-02-01')
toDate <- as.Date('2007-02-02')

df <- df[df$Date == fromDate | df$Date == toDate,]

hist(as.numeric(df$Global_active_power)/500, col='red', xlab='Global Active Power(kilowatts)', main='Global Active Power')
dev.copy(png,'plot1.png')