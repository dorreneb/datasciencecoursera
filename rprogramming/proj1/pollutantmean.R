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
  round(mean(data[,pollutant], na.rm=TRUE), digits=3)
}

#vars to make calling the above functions easier
dir <- "C:/Users/Dorrene/code/coursera/rprogramming/proj1/specdata"
monitors <- 23
pollutants<- c("nitrate", "sulfate")

#actually get the mean (testing)
mean <- pollutantmean(dir, pollutants[1], monitors)
data <- getMonitors(dir, monitors)
