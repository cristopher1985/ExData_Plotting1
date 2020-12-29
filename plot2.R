library(lubridate)
setwd("") #set your Working Directory to the one in which the file to be read is located 
datos<-read.table(file="household_power_consumption.txt", header = TRUE, sep = ";")
datos$Date<- as.Date(datos$Date, "%d/%m/%Y")
datos$fechahora<-paste(datos$Date, datos$Time)
datos$fechahora<-ymd_hms(datos$fechahora)
datos$Time<- hms(datos$Time)
datos$Global_active_power<-as.numeric(datos$Global_active_power)
datos$Global_reactive_power<-as.numeric(datos$Global_reactive_power)
datos$Voltage<-as.numeric(datos$Voltage)
datos$Global_intensity<-as.numeric(datos$Global_intensity)
datos$Sub_metering_1<-as.numeric(datos$Sub_metering_1)
datos$Sub_metering_2<-as.numeric(datos$Sub_metering_2)
datos_dates<-subset(datos, Date=="2007-02-01" | Date=="2007-02-02")

png(filename = "plot2.png", width = 480, height = 480)
plot(datos_dates$fechahora, datos_dates$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "" )
dev.off()


