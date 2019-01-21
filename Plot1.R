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
# Transform GAP Variable to numeric for Histogram
Global_active_power <- as.numeric(Sub_Data$Global_active_power)

#2. Construct Histogram
png("Plot1.png", width=480, height=480)
hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()