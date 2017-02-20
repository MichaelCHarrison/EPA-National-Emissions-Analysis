plot3 <- function(){
        summary <- tbl_df(readRDS("summarySCC_PM25.rds"))
        classcodes <- readRDS("Source_Classification_Code.rds")
        
        library(dplyr)
        summary <- summary %>%
                group_by(year, type) %>%
                filter(fips == "24510") %>%
                summarise(totalEmissions = sum(Emissions))
        
        library(ggplot2)
        ggplot(summary, aes(year, totalEmissions)) + 
                geom_point(aes(colour = type)) +
                geom_line(aes(colour = type)) +
                labs(title = "Baltimore City Emissions by Type: 1999-2008",
                     x = "Year", y = "Emissions (Tons)")
                
        ggsave(filename = "plot3.png", device = "png", 
               width = 5, height = 5, units = "in")
}