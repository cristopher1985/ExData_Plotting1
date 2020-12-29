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

png(filename = "plot3.png", width = 480, height = 480)
with(datos_dates, plot(fechahora, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
with(datos_dates, points(fechahora, Sub_metering_1, type = "l"))
with(datos_dates, points(fechahora, Sub_metering_2, type = "l", col="red"))
with(datos_dates, points(fechahora, Sub_metering_3, type = "l", col="blue"))
legend("topright", pch = "_", col=c("black","red","blue"), legend=c("Sub metering 1", "Sub metering 2", "Sub metering 3"))
dev.off()


