library(shiny)
library(ggplot2)

shinyServer(function(input, output) {

    output$histogram <- renderPlot({
        
        # Define which data will be used for making the histogram
        
        if(input$quebecBox & input$mississippiBox) {
            uptake<-CO2$uptake
        } else if(input$quebecBox) {
            uptake<-CO2$uptake[CO2$Type=="Quebec"]
        } else if(input$mississippiBox) {
            uptake<-CO2$uptake[CO2$Type=="Mississippi"]
        } else {
            uptake<-numeric(length=0)
        }
        
        # Define which color the histogram will be made in
        
        if(input$colorBox=="Blue") {
            fillColor<-"cornflowerblue"
        } else if(input$colorBox=="Green") {
            fillColor<-"seagreen"
        } else if(input$colorBox=="Purple") {
            fillColor<-"mediumpurple"
        } else if(input$colorBox=="Orange") {
            fillColor<-"orange"
        } else if(input$colorBox=="Cyan") {
            fillColor<-"cyan"
        } else {
            fillColor<-"maroon"
        }

        # Make the histogram
        
        g<-ggplot(data=data.frame(uptake=uptake), mapping=aes(x=uptake))
        g+geom_histogram(fill=fillColor)+labs(x="Carbon dioxide uptake rate (umol/m^2 sec)", 
                                               y="Frequency",
                                               title="Histogram of carbon dioxide uptake rates in grass plants")

    })

})
