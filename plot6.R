plot6 <- function(){
        summary <- tbl_df(readRDS("summarySCC_PM25.rds"))
        classcodes <- readRDS("Source_Classification_Code.rds")
        
        library(dplyr)
        cities <- c("24510", "06037")
        summary <- summary %>%
                filter(fips %in% cities & type == "ON-ROAD") %>%
                group_by(fips, year) %>%
                summarise(totalEmissions = sum(Emissions))
                
        png("plot2.png",
            width = 480,
            height = 480,
            units = "px")


        
}