getMonitors <- function(directory, id) {
  
  paths <- list()
  for (i in id) {
    path <- paste(directory, "/", sprintf("%03d.csv", i), sep="")
    
    temp <- read.csv(path)
    if (!exists("data")) {
      data <- temp
    } else {
      data <- rbind(temp)
    }
    rm(temp)
  }
  
  data
}

pollutantmean <- function(directory, pollutant, id=1:332) {
  data<-getMonitors(directory, id)
  mean(data[,pollutant], na.rm=TRUE)
}

dir <- "C:/Users/Dorrene/code/coursera/rprogramming/proj1/specdata"
x <- pollutantmean(dir, "nitrate", 23)
y <- getMonitors(dir, 23)
