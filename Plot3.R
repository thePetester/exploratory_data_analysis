## Load the ggplot2 library.
library(ggplot2)

## Verify files exist and if so read the data from each.
if(!exists("NEI")){
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}

#24510 is the code for Baltimore.
subsetNEI  <- NEI[NEI$fips=="24510", ]
aggregatedTotalByYearAndType <- aggregate(Emissions ~ year + type, subsetNEI, sum)

# Plot to determine which of the four sources (point, nonpoint, onroad, nonroad)
# have decreased/increased in emissions from 1999-2008 from Baltimore Ciy, MD.  
# Use the ggplot2 plotting system to make a plot answer this question.
png("plot3.png", width=640, height=480)
g <- ggplot(aggregatedTotalByYearAndType, aes(year, Emissions, color = type))
g <- g + geom_line() +
  xlab("Year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions 1999 to 2008 - Baltimore City, MD')
print(g)
dev.off()