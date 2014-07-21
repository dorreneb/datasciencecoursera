#shamelessly copied from pollutantmean.R but with the rbinding part removed
getMonitors <- function(directory, threshold) {
  loadedData <- list()
  paths <- list.files(directory, full.names = TRUE)
  
  #load each desired file (with proper path formatting) into individual dataframes
  for (file in paths) {
    #read in dir file
    tmp <- na.omit(read.csv(file))
    
    #if meets threshold add to data
    if (nrow(tmp) >= threshold) {
      loadedData[[length(loadedData) + 1L]] <- tmp
    }
    
    #stop storing everything in memory
    rm(tmp)
  }  
  
  loadedData
}

corr <- function(directory, threshold = 0) {
  corrs <- vector('numeric')
  data <- getMonitors(directory, threshold)
  
  for (monitor in data) {
    corrs[length(corrs) + 1L] <- cor(monitor[,"sulfate"], monitor[,"nitrate"], use="everything")
  }
  
  corrs
}
