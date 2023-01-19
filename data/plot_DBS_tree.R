
# Load the clean metadata table
metadata <- read.csv("clean_metadata.csv")

metadata$meanDBS <- as.numeric(metadata$meanDBS)
metadata$BAPS.1 <- as.factor(metadata$BAPS.1)
metadata$BAPS.3 <- as.factor(metadata$BAPS.3)

# metadata <- metadata[!is.na(metadata$BAPS.1),]

library(ggtree)
library(phytools)
# library(ape)

in.tree <- read.tree("Typhimurium-tree.tre")
in.tree$tip.label <- gsub("mysnps_", "", in.tree$tip.label)

# Format Tree
# Remove Reference from tree
in.tree <- drop.tip(in.tree, "Reference")
# reroot tree based on Heidelberg as outgroup
in.tree <- reroot(in.tree, 141)

p1 <- ggtree(in.tree, size=1)
p2 <- p1 %<+% metadata + 
  geom_tiplab(aes(label=source, color=BAPS.1), size=2, align =TRUE , show.legend = FALSE)

metadata$DBS_BAPS3 <- ave(metadata$meanDBS, metadata$BAPS.3)
plot.data <- data.frame(metadata[,colnames(metadata) %in% c("BAPS.3")])
colnames(plot.data) <- "BAPS.3"
rownames(plot.data) <- metadata$Sample

# plot.data$DBS_BAPS3 <- round(as.numeric(plot.data$DBS_BAPS3),3)
plot.data$BAPS.3 <- as.factor(plot.data$BAPS.3)

p3 <- gheatmap(p2, plot.data,  offset = 0.02, width=3, colnames = F) 
