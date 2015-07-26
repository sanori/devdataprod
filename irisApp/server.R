library(ggplot2)
data(iris)
# Pre-calculate the center(=mean)s of each variable
centers <- aggregate(. ~ Species, data= iris, mean)

shinyServer(function(input, output) {
    output$graph <- renderPlot({
        q <- qplot(iris[,input$x], iris[,input$y], data=iris, col=Species,
              xlab = input$x, ylab = input$y)
        if (input$showCenter) {
            q <- q + geom_point(aes(centers[,input$x], centers[,input$y],
                                col=centers$Species),
                       shape=4, size=4)
        }
        q
    })
})