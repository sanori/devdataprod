columns <- list("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width")
shinyUI(fluidPage(
  titlePanel("Iris Data Explorer"),
  
  sidebarLayout(
    sidebarPanel(
      p("Select variable for X and Y axis"),
      selectInput("x", label = "X", choices = columns, selected = "Sepal.Length"),
      selectInput("y", label = "Y", choices = columns, selected = "Sepal.Width"),
      checkboxInput("showCenter", label = "Show centers of each species", value = FALSE),
      helpText("This app shows the data distribution of iris data set.
               As you choose the variable for x/y axis,
               it will show the graph with species of iris.")
    ),
    mainPanel(
        plotOutput("graph")
    )
  )  
))