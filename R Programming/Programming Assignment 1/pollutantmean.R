pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  combined_read<-data.frame()
  for(n in 1:length(id)){
    n<-formatC(id[n],width=3, flag=0)
    combined_read<-rbind(combined_read,read.csv(paste(getwd(), "/", directory, "/", n,".csv", sep="")))
  }
  
  meanPollutant<-mean(combined_read[[pollutant]], na.rm=TRUE)
  meanPollutant
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
}