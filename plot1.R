plot1 <- function(){
        library(dplyr)
        summary <- tbl_df(readRDS("summarySCC_PM25.rds"))
        classcodes <- readRDS("Source_Classification_Code.rds")
        
        summary <- summary %>%
                group_by(year) %>%
                summarise(totalEmissions = sum(Emissions))
        
        png("plot1.png",
            width = 480,
            height = 480,
            units = "px")
        
        plot(x = summary$year, y = summary$totalEmissions, 
             main = "US Emisisons: 1999-2008",
             xlab = "Year", ylab = "Emissions (Tons)",
             pch = 19, col = "red",
             xlim = c(1999, 2008)
             )
        lines(x = summary$year, y = summary$totalEmissions, type = 'l')
        marks <- c(4,000,000, 5,000,000, 6,000,000, 7,000,000)
axis(2, at = marks, label = marks)        
}