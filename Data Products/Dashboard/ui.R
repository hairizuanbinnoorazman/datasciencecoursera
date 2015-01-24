shinyUI(fluidPage(
  
    titlePanel("Estimate amount of fuel required for a trip from New York to Boston"),
    br(),
      sidebarPanel(
       selectInput("cyl", "Choose number of cylinders that your car have", 
                   choices = c("4", "6", "8")),
       numericInput("disp", "Enter the displacement that your car have",120),
       numericInput("hp", "Enter the horsepower that your car have",90),
       selectInput("am", "Choose whether your car is automatic or manual transmission", 
                   choices = c("Automatic", "Manual"))
       ),
     mainPanel(
       h4("This tool allows you as the user to estimate the amount of fuel required in order to travel from
            New York to Boston via car. The inputs required for the estimated can be found on the left."),
       br(),
       h4("Your car's miles per gallon (mpg) is:"),      
       verbatimTextOutput("mpg"),
       br(),
       h4("To get to Boston from New York, you will need:"),
       verbatimTextOutput("gallon")
     )
    )
)