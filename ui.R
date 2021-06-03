library(shiny)

shinyUI(fluidPage(

    # Descriptive main title
    titlePanel("Carbon Dioxide Uptake in Grass Plants"),

    sidebarLayout(
        # Ask the user which locations they want data from
        sidebarPanel(
            helpText("This Shiny application uses the CO2 dataset in R to display carbon dioxide uptake data for grass plants. Simply pick which locations you want data from and which color you want the histogram to be created in."),
            checkboxInput(inputId="quebecBox", label="Show Quebec plants data", 
                          value=TRUE),
            checkboxInput(inputId="mississippiBox", label="Show Mississippi 
                          plants data", value=TRUE),
            selectInput(inputId="colorBox", label="What color do you want the plot in?",
                        choices=c("Blue", "Green", "Purple", "Orange", "Cyan", "Maroon"))
        ),

        # Display the histogram of the gas uptake for the selected data
        mainPanel(
            plotOutput("histogram")
        )
    )
))
