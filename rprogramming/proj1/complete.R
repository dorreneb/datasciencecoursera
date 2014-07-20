#shamelessly copied from pollutantmean.R but with the rbinding part removed
getMonitors <- function(directory, id) {
  loadedData <- list()
  
  #load each desired file (with proper path formatting) into individual dataframes
  for (i in id) {
    path <- paste(directory, "/", sprintf("%03d.csv", i), sep="")
    loadedData[[length(loadedData) + 1L]] <- read.csv(path)
  }  
  
  loadedData
}

complete <- function(directory, id = 1:332) {
  #set up data frame where data will be processed
  reportNames <- c("id", "nobs")
  report <- data.frame(matrix(ncol = length(reportNames), nrow = length(id)))
  names(report) <- reportNames
  
  #get data
  data <- getMonitors(directory, id)
  
  #fill report with index data
  index <- 1
  for (i in id) {
    test <- data[[index]] 
    report[index,] <- c(i, sum(complete.cases(test)))
    index <- index + 1L
  }
  
  #return report
  report
}
