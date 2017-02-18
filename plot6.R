plot6 <- function(){
        summary <- tbl_df(readRDS("summarySCC_PM25.rds"))
        classcodes <- readRDS("Source_Classification_Code.rds")
        
        library(dplyr)
        cities <- c("24510", "06037")
        summary <- summary %>%
                filter(fips %in% cities & type == "ON-ROAD") %>%
                group_by(fips, year) %>%
                summarise(totalEmissions = sum(Emissions))
                
        ggplot(summary)  +
                geom_point(aes(year, totalEmissions), size = 3) +
                facet_grid(.~fips)
        ggsave(filename = "plot6.png", device = "png",
               width = 5, height = 5, unit = "in")

        
}