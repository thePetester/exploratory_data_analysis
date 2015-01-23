## Verify files exist and if so read the data from each.
if(!exists("NEI")){
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}

# Use the base plotting system to show if the total emissions from PM2.5 decreased 
# in the Baltimore City, Maryland area (fips == "24510") from 1999 to 2008.
aggregatedTotalByYear <- aggregate(Emissions ~ year, NEI, sum)
subsetNEI  <- NEI[NEI$fips=="24510", ]
aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)

png('plot2.png')
barplot(height=aggregatedTotalByYear$Emissions, names.arg=aggregatedTotalByYear$year, xlab="Year", ylab=expression('Total PM'[2.5]*' Emission'),main=expression('Total PM'[2.5]*' Emissions - Baltimore City, MD'))
dev.off()