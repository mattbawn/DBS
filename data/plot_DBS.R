
# Load the clean metadata table
metadata <- read.csv("clean_metadata.csv")

metadata$meanDBS <- as.numeric(metadata$meanDBS)
metadata$BAPS.1 <- as.factor(metadata$BAPS.1)
metadata$BAPS.3 <- as.factor(metadata$BAPS.3)

metadata <- metadata[!is.na(metadata$BAPS.1),]

# Next we will plot the DBS data using ggplot

library(ggplot2)

#### plot figures ###

p1 <- ggplot(metadata, aes(x=BAPS.1,y=meanDBS,fill=BAPS.1)) + geom_boxplot() 

p2 <- ggplot(metadata, aes(x=BAPS.3,y=meanDBS,fill=BAPS.3)) + geom_boxplot() 


ggsave("Figure_1.pdf",plot = p1,  width = 200, height = 200, units = "mm",
       bg = "transparent")
ggsave("Figure_2.pdf",plot = p2,  width = 400, height = 200, units = "mm",
       bg = "transparent")
