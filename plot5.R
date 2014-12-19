# Question 5:
# Across the United States, 
# how have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City? 


# ========== Load data ==========
source('getDataset.R')


# ========== Load library ==========
library(ggplot2)


# ========== Prep Data ==========
# Extract motor related data from Baltimore
NEI_Baltimore <- NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD", ]
# Sum the data according to the year
motorNEI_Bal <- aggregate(Emissions ~ year, data = NEI_Baltimore, sum)


# ========== Plot figure ==========
# Plot the figure as plot5.png
png(filename = "plot5.png")

# Plot
g <- ggplot(motorNEI_Bal, aes(year, Emissions))
p <- g + geom_point(size = 3) + geom_path() +
     scale_x_continuous(breaks=c(1999, 2002, 2005, 2008)) +
     theme(axis.text.y = element_text(colour = 'black'), 
           axis.text.x = element_text(colour = 'black')) +
     labs(title = "Total PM2.5 Emission (Motor Sources) in the Baltimore City") +
     labs(x = expression("Year"), y = expression("Total PM2.5 Emission")) 
print(p)

# Turn off the device
dev.off()