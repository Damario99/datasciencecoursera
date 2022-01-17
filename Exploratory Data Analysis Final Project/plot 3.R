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

baltimore <- subset(NEI, NEI$fips == "24510")
baltimoreType <- aggregate(Emissions ~ year + type, baltimore, sum)

ggplot(baltimoreType, aes(year, Emissions, col = type)) +
  geom_line() +
  geom_point() +
  ggtitle(expression("Total Baltimore " ~ PM[2.5] ~ "Emissions by Type and Year")) +
  ylab(expression("Total Baltimore " ~ PM[2.5] ~ "Emissions")) +
  xlab("Year") +
  scale_colour_discrete(name = "Type of sources") +
  theme(legend.title = element_text(face = "bold"))
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()
