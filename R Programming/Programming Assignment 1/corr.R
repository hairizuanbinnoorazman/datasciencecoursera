corr <- function(directory, threshold=0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  correlation<-numeric(0)
  for(loop in 1:332){
    n<-formatC(loop,width=3, flag=0)
    tempFile<-read.csv(paste(getwd(), "/", directory, "/", n,".csv", sep=""))
    complete.tempFile<-complete.cases(tempFile)
    complete.count<-sum(complete.tempFile)

    if(complete.count>threshold){
      tempFile2<-tempFile[complete.tempFile,]
      current.correlation<-cor(tempFile2$sulfate, tempFile2$nitrate)
      correlation<-c(correlation, current.correlation )
    }
  }
  
  correlation
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
}