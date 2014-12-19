# Question 1:
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.


# ========== Load data ==========
source('~/R/Data Science/getDataset.R')


# ========== Prep Data ==========
# Sum the data according to the year
newNEI <- aggregate(Emissions ~ year, data = NEI, sum)


# ========== Plot figure ==========
# Plot figure plot1.png
png(filename = "plot1.png")
# Change the font size of the title and labels
par(ps = 15, cex = 1, cex.main = 1, cex.lab = 0.85)

# Plot
plot(newNEI$year, newNEI$Emissions, type = "b", pch = 20,
     main = "Total PM2.5 Emission from 1999-2008",
     xlab = "Year", ylab = "Total PM2.5 Emission")

# Turn off the device
dev.off()