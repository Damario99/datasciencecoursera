library(ggplot2)
library(RColorBrewer)

dir.create("./air_pollution")
urlzip <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(urlzip, destfile = "./air_pollution.zip" )
unzip("./air_pollution.zip", exdir = "./air_pollution" )

NEI <- readRDS("./air_pollution/summarySCC_PM25.rds")
SCC <- readRDS("./air_pollution/Source_Classification_Code.rds")

#Checking data
str(NEI)
str(SCC)

totalNEI <- aggregate(Emissions ~ year, NEI, sum)
baltimore <- subset(NEI, NEI$fips == "24510")

totalBaltimore <- aggregate(Emissions ~ year, baltimore, sum)

plot(totalBaltimore$year, totalBaltimore$Emissions, type = "o", main = expression("Total Baltimore" ~ PM[2.5] ~ "Emissions by Year"), xlab = "Year", ylab = expression("Total Baltimore "~ PM[2.5] ~ "Emissions"), col = "steelblue3")
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()
