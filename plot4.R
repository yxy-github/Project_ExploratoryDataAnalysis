# Question 4:
# Across the United States, 
# how have emissions from coal combustion-related sources changed from 1999-2008?


# ========== Load data ==========
source('~/R/Data Science/getDataset.R')


# ========== Load library ==========
library(ggplot2)


# ========== Prep Data ==========
# Extract data related to coal combustion sources
idx_coal <- grep("comb .* coal", SCC$Short.Name, ignore.case = TRUE)
subSCC <- SCC$SCC[idx_coal]
coalNEI <- subset(NEI, SCC %in% subSCC)
# Sum the data according to the year
coalNEI <- aggregate(Emissions ~ year, data = coalNEI, sum)


# ========== Plot figure ==========
# Plot the figure as plot4.png
png(filename = "plot4.png")

# Plot
g <- ggplot(coalNEI, aes(year, Emissions))
p <- g + geom_point(size = 3) + geom_path() +
     scale_x_continuous(breaks=c(1999, 2002, 2005, 2008)) +
     labs(title = "Total PM2.5 Emission from Coal Combustion Sources") +
     labs(x = expression("Year"), y = expression("Total PM2.5 Emission")) +
     theme(axis.text.y = element_text(colour = 'black'), 
           axis.text.x = element_text(colour = 'black'))
print(p)

# Turn off the device
dev.off()