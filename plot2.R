# Question 2:
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
# (fips == "24510") from 1999 to 2008? Use the base plotting system to make 
# a plot answering this question.


# ========== Load data ==========
source('getDataset.R')


# ========== Prep Data ==========
# Extract data from Baltimore
NEI_Baltimore <- NEI[NEI$fips == "24510", ]
# Sum the data according to the year
NEI_Baltimore <- aggregate(Emissions ~ year, data = NEI_Baltimore, sum)


# ========== Plot figure ==========
# Plot the figure as plot2.png
png(filename = "plot2.png")
# Change the font size of the title and labels
par(ps = 15, cex = 1, cex.main = 1, cex.lab = 0.85)

# Plot
plot(NEI_Baltimore$year, NEI_Baltimore$Emissions, type = "b", pch = 16,
     main = "Total PM2.5 Emission in the Baltimore City from 1999-2008",
     xlab = "Year", ylab = "Total PM2.5 Emission", ylim = c(0, 3500))

# Turn off the device
dev.off()