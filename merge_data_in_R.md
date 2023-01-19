# Merging Metadata Files

In this example you will use RStudio to load some different metadata tables and merge them to form a combined metadata table.

---

### Load master metadata table NOTE: its a [csv file](https://www.howtogeek.com/348960/what-is-a-csv-file-and-how-do-i-open-it/)
`metadata <- read.csv("samples-overview-representative_host.csv")`


`#BAPS <- read.csv("baps_data_3lev.txt")`

### we need to load the BAPS data in a different way
```
BAPS <- read.table("baps_data_3lev.txt", 
                    sep = "\t",
                    header = T)
```

### clean up the identifier to make consistent accross files
`BAPS$SampleID <- gsub("mysnps_", "", BAPS$SampleID)`

### Create a new merged metadata file
```
new.metadata <- merge(metadata, BAPS,   # Files to merge 
                      by.x = "V2",      # column to merge by
                      by.y = "SampleID",# column to merge by
                      all.x = TRUE)     # which data controls shape
```
### Load our deltaBS file
`deltaBS <- read.csv("deltaBS_mean.txt", header = F)`

### Take a look its a bit of a mess

`deltaBS$V1 <- as.character(deltaBS$V1)`

```
deltaBS$split <- strsplit(deltaBS$V1, ":")

deltaBS$name <- sapply(deltaBS$split, '[', 1)
deltaBS$meanDBS <- sapply(deltaBS$split, '[', 3)

deltaBS$meanDBS <- gsub(" SD" , "", deltaBS$meanDBS)
```
### Get rig of messy columns
`deltaBS <- deltaBS[,c(3,4)]`

### Round the data to make it cleaner
`deltaBS$meanDBS <- round(as.numeric(deltaBS$meanDBS), 3)`

`deltaBS$name <- gsub("deltaBS_", "", deltaBS$name)`
`deltaBS$name <- gsub(".dbs", "", deltaBS$name)`

### Add the deltaBS data to the merged metadata
```
new.metadata <- merge(new.metadata, deltaBS,
                      by.x = "V2",
                      by.y = "name",
                      all.x = TRUE)
```

### subset the data as we don't need all the columns
`new.metadata <- new.metadata[, colnames(new.metadata) %in% c("V2","type","source","Year","V1","V3", "meanDBS")]`

### Rename vague column names
`colnames(new.metadata)[c(1,5,6)] <- c("Sample", "BAPS-1", "BAPS-3")`

### save clean data to a new file
```
write.csv(new.metadata, "clean_metadata.csv", 
          quote = FALSE,
          row.names = FALSE)
```
