library(shiny)

shinyUI(fluidPage(
  tags$h2("Building a Shiny App"),
  fluidRow(
      column(3,
             h5("Subsetting the iris data"), 
             p("Slide to select range of values. Default position of sliders cover the entire range of these variables"),
            
              sliderInput("Sepal.Length", label = "Sepal.Length", min = min(iris$Sepal.Length), 
                         max = max(iris$Sepal.Length),value=c(min(iris$Sepal.Length),max(iris$Sepal.Length))),
             
              sliderInput("Sepal.Width", label = "Sepal.Width", min = min(iris$Sepal.Width), 
                         max = max(iris$Sepal.Width), value = c(min(iris$Sepal.Width),max(iris$Sepal.Width))),
             
             
             sliderInput("Petal.Length", label = "Petal.Length", min = min(iris$Petal.Length), 
                         max = max(iris$Petal.Length), value = c(min(iris$Petal.Length),max(iris$Petal.Length))),
             
             
             sliderInput("Petal.Width", label = "Petal.Width", min = min(iris$Petal.Width), 
                         max = max(iris$Petal.Width), value = c(min(iris$Petal.Width),max(iris$Petal.Width))),
             
             h5("Inputs for scatter plot"),
             selectInput("xvar", "x-variable:", choices=names(iris[,-5])),
             selectInput("yvar", "y-variable:", choices=names(iris[,-5]),selected = names(iris[2])),
            
              h5("Input for box plot"),
              selectInput("dvar", "Distribution of which variable for box plot?", choices=names(iris[,-5]),selected = names(iris[3]))#,
             # submitButton("Update View", icon("refresh"))
             
      ),
   
    
    fluidRow(
      column(5, 
             HTML("<h5>Summary of Subsetted Data</h5>"),
             verbatimTextOutput("summary"),
             
             HTML("<br><br><h5>Data</h5>"),
             dataTableOutput(outputId="subsetdata")),
      
      column(4, plotOutput("scatterplot"),
             plotOutput("boxplot"))
    )
    
  )))