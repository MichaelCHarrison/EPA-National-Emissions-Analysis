plot1 <- function(){
        library(dplyr)
        summary <- tbl_df(readRDS("summarySCC_PM25.rds"))
        classcodes <- readRDS("Source_Classification_Code.rds")
        
        summary <- summary %>%
                group_by(year) %>%
                summarise(totalEmissions = sum(Emissions))
        
        plot(x = summary$year, y = summary$totalEmissions, 
             main = "Total US Emisisons: 1999-2008",
             xlab = "Year", ylab = "Total Emissions (Tons)",
             pch = 19, col = "red",
             xlim = c(1999, 2008)
             )
        lines(x = summary$year, y = summary$totalEmissions, type = 'l')
}