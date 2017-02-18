plot4 <- function(){
        summary <- tbl_df(readRDS("summarySCC_PM25.rds"))
        classcodes <- readRDS("Source_Classification_Code.rds")
        
        coal <- classcodes[grep("[Cc]oal", classcodes$Short.Name),]
        SCCs <- unique(coal$SCC)
        SCC_set <- subset(summary, summary$SCC %in% SCCs)
        
        library(dplyr)
        SCC_set <- SCC_set %>%
                group_by(year) %>%
                summarise(totalEmissions = sum(Emissions))
        
        library(ggplot2)
        
        qplot(year, totalEmissions, data = SCC_set,
              main = "US Coal Related Emissions: 1999-2008",
              xlab = "Year", ylab = "Emissions (Tons)",
              geom = "line")
        ggsave(filename = "plot4.png", device = "png",
               width = 5, height = 5, units = "in")
        
}