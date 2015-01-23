## Load the ggplot2 library.
library(ggplot2)

## Verify files exist and if so read the data from each.
if(!exists("NEI")){
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}

## Merge the two data sets.
if(!exists("NEISCC")){
  NEISCC <- merge(NEI, SCC, by="SCC")
}

library(ggplot2)

# Show how emissions from motor vehicle sources have changed from 1999-2008 in Baltimore City
# 24510 is code Baltimore.
# NEI Type = ON-ROAD
subsetNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]
aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)

png("plot5.png", width=840, height=480)
g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("Year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Motor Vehicle Emissions in Baltimore City, MD - 1999 to 2008')
print(g)
dev.off()