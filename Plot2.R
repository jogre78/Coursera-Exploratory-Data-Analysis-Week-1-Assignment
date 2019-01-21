# Plot1.R Source code
install.packages("data.table")
library(data.table)


#1. Read Data from Zip File
power_data <- "./household_power_consumption.txt"

# It contains 2075259 observations and 9 variables
All_Data <- read.table(power_data,header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")

# Only keep 1st & 2nd of February 2007 using subset
# It contains 2880 observations and 9 variables - str(Sub_Data) 
Sub_Data <- subset(All_Data, Date %in% c("1/2/2007","2/2/2007"))
# Format Date & Datetime Variables
Datetime <- strptime(paste(Sub_Data$Date, Sub_Data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
# Transform GAP Variable to numeric for Plot
Global_active_power <- as.numeric(Sub_Data$Global_active_power)

#2. Construct Plot
png("Plot2.png", width=480, height=480)
plot(Sub_Data$Datetime,Sub_Data$Global_active_power, type="l",xlab="", ylab="Global Active Power (kilowatts)")
dev.off()