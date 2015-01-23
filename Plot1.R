## Verify files exist and if so read the data from each.
if(!exists("NEI")){
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}

# Using the base plotting system, Create a plot using the base plotting system to show 
# the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
aggregatedTotalByYear <- aggregate(Emissions ~ year, NEI, sum)

png('plot1.png')
barplot(height=aggregatedTotalByYear$Emissions, names.arg=aggregatedTotalByYear$year, xlab="Year", ylab=expression('Total PM'[2.5]*' Emissions'),main=expression('Total PM'[2.5]*' Emissions by Year'))
dev.off()