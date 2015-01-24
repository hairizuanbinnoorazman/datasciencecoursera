shinyServer(function(input, output){  
  output$mpg<-renderText({
    data1<-createDataset(input$cyl, input$disp, input$am, input$hp)
    ans1<-predictMPG(data1)
    ans1<-c(format(round(ans1,2)), "miles per gallon")})
  output$gallon<-renderText({
    data2<-createDataset(input$cyl, input$disp, input$am, input$hp)
    intermediate1<-predictMPG(data2)
    ans2<-215/intermediate1
    ans2<-c(format(round(ans2,2)), "gallons")})
})

predictMPG<-function(dataset){
  ## Create the prediction algo based on the input available
  data<-mtcars
  
  ## prepping dataset for linear regression
  data$cyl<-factor(data$cyl)
  data$am<-factor(data$am)
  model<-lm(mpg ~ cyl + disp + am + hp, data=data)
  
  predict(model,dataset)  
}

createDataset<-function(cyl, disp, am, hp){
  if(am == "Automatic"){
    am<-0
  } else {
    am<-1
  }
  
  a<-data.frame(cyl, disp, am, hp)
  names(a)<-c("cyl", "disp", "am", "hp")
  a$am<-factor(a$am)
  a
}


