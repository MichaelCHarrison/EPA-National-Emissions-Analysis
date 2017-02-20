plot3 <- function(){
        summary <- tbl_df(readRDS("summarySCC_PM25.rds"))
        classcodes <- readRDS("Source_Classification_Code.rds")
        
        library(dplyr)
        summary <- summary %>%
                group_by(year, type) %>%
                filter(fips == "24510") %>%
                summarise(totalEmissions = sum(Emissions))
        
        library(ggplot2)
        ggplot(summary) + 
                geom_point(aes(year, total_Emission), colour = type) +
                geom_line(aes(year, total_Emission), colour = type)
                
        ggsave(filename = "plot3.png", device = "png", 
                       width = 5, height = 5, units = "in")
}