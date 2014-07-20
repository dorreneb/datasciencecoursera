getMonitors <- function(directory, id) {
  loadedData <- list()
  
  #load each desired file (with proper path formatting) into individual dataframes
  for (i in id) {
    path <- paste(directory, "/", sprintf("%03d.csv", i), sep="")
    loadedData[[length(loadedData) + 1L]] <- read.csv(path)
  }  
  
  #rbind all data frames to make analysis easier
  do.call(rbind, loadedData)
}

pollutantmean <- function(directory, pollutant, id=1:332) {
  data<-getMonitors(directory, id)
  round(mean(data[,pollutant], na.rm=TRUE), digits=3)
}