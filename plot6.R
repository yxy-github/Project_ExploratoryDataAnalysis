# Question 6:
# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor 
# vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions? 


# ========== Load data ==========
source('~/R/Data Science/getDataset.R')


# ========== Load library ==========
library(ggplot2)


# ========== Prep Data ==========
# Extract motor related data from Baltimore and LA
motorNEI <- NEI[(NEI$fips == "24510" | NEI$fips == "06037") & NEI$type == "ON-ROAD", ]
motorNEI <- aggregate(Emissions ~ year + fips, data = motorNEI, sum)


# ========== Plot figure ==========
# Plot the figure as plot6.png
png(filename = "plot6.png")

# Change the fips labels to city's names
city_names <- list("06037" = "Los Angeles City", "24510" = "Baltimore City")
city_labeller <- function(variable, value){
     return(city_names[value])
}

# Plot
g <- ggplot(motorNEI, aes(year, Emissions))
p <- g + geom_point(size = 3) + geom_path() +
     facet_grid(. ~ fips, labeller = city_labeller) + 
     scale_x_continuous(breaks=c(1999, 2002, 2005, 2008)) +
     theme(axis.text.y = element_text(colour = 'black'), 
           axis.text.x = element_text(colour = 'black', angle = 90)) +
     labs(title = "Total PM2.5 Emission (Motor Sources) from 1999-2008") +
     labs(x = expression("Year"), y = expression("Total PM2.5 Emission")) 
print(p)

# Turn off the device
dev.off()