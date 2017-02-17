plot3 <- function(){
        summary <- tbl_df(readRDS("summarySCC_PM25.rds"))
        classcodes <- readRDS("Source_Classification_Code.rds")
        
        library(dplyr)
        summary <- summary %>%
                group_by(year, type) %>%
                filter(fips == "24510") %>%
                summarise(totalEmissions = sum(Emissions))
        
        library(ggplot2)
        qplot(year, totalEmissions, data = summary, color = type)
}