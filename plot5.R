plot5 <- function(){
        library(dplyr)
        summary <- tbl_df(readRDS("summarySCC_PM25.rds"))
        classcodes <- readRDS("Source_Classification_Code.rds")

        summary <- summary %>%
                group_by(year) %>%
                subset(fips == "24510") %>%
                subset(type == "ON-ROAD") %>%
                summarise(totalEmissions = sum(Emissions)) 
 
        ggplot(data = summary) +
                geom_point(aes(year, totalEmissions), color = "red", size = 5) +
                geom_line(aes(year, totalEmissions)) +
                labs(title = "Baltimore City Motor Vehicle Emissions: 1999-2008",
                     x = "Year", y = "Emissions (Tons)")
        ggsave(filename = "plot5.png", device = "png",
               width = 5, height = 5, units = "in")
        
}
