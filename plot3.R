# Question 3:
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) 
# variable, which of these four sources have seen decreases in emissions from 1999-2008 
# for Baltimore City? Which have seen increases in emissions from 1999-2008? Use the 
# ggplot2 plotting system to make a plot answer this question.


# ========== Load data ==========
source('getDataset.R')


# ========== Load library ==========
library(ggplot2)


# ========== Prep Data ==========
# Extract data from Baltimore
NEI_Baltimore <- NEI[NEI$fips == "24510", ]
# Sum the data according to the year and type
NEI_Baltimore <- aggregate(Emissions ~ type + year, data = NEI_Baltimore, sum)


# ========== Plot figure ==========
# Plot the figure as plot3.png
png(filename = "plot3.png")

# Plot
g <- ggplot(NEI_Baltimore, aes(year, Emissions))
p <- g + geom_point(size = 3) + geom_path() +
     facet_grid(. ~ type) + scale_x_continuous(breaks=c(1999, 2002, 2005, 2008)) +
     theme(axis.text.y = element_text(colour = 'black'), 
           axis.text.x = element_text(colour = 'black', angle = 90)) +
     labs(title = "Total PM2.5 Emission in the Baltimore City from 1999-2008") +
     labs(x = expression("Year"), y = expression("Total PM2.5 Emission")) 
print(p)

# Turn off the device
dev.off()