plot2 <- function(){
        library(dplyr)
        summary <- tbl_df(readRDS("summarySCC_PM25.rds"))
        classcodes <- readRDS("Source_Classification_Code.rds")
        
        summary <- summary %>%
                group_by(year) %>%
                filter(fips == "24510") %>%
                summarise(totalEmissions = sum(Emissions))
                
        png("plot2.png",
            width = 480,
            height = 480,
            units = "px")

        plot(x = summary$year, y = summary$totalEmissions, 
             main = "Baltimore City Emisisons: 1999-2008",
             xlab = "Year", ylab = "Total Emissions (Tons)",
             pch = 19, col = "red",
             xlim = c(1999, 2008)
        )
        lines(x = summary$year, y = summary$totalEmissions, type = 'l')
        
        dev.off()

}