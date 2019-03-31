library(shiny)
shinyUI(fluidPage(
  titlePanel("Worldwide CO2 Level"),
  
  sidebarLayout(
    sidebarPanel(
      
      sliderInput("years", "Select Year", min = 1979, max = 2017, value = 1979),
      numericInput("year2", "Or Enter Year", min = 1979, max = 2017, value = 1979),
      
      checkboxInput("extra", strong("Add extra plot"), FALSE),
      
      conditionalPanel(
        condition = "input.extra == true",
        radioButtons("dataSource", "Which variable?",
                     c("Uncertainty" = "Uncertainty",
                       "Vancouver Average Snow" = "AllSnow",
                       "Vancouver Average Temperature" = "MeanTemp",
                       "Another Year" = "2year")),
        
        conditionalPanel( # For the second year
          condition = "input.dataSource == '2year'",
          sliderInput("years1", "Select another Year", min = 1979, max = 2017, value = 1979),
          textInput("years2", "Enter another Year", value = 1979)
        ),
        
        helpText(HTML("<h5>You might want to adjust the legend</h5>")),
        checkboxInput("Adjust_axis", strong("Adjust legend position?"), FALSE)
      )
    ),
    
    mainPanel(
       plotOutput("distPlot"),
       h3("Reference"),
       h4("CO2 Data:"),
       h5("Dlugokencky, E.J., K.W. Thoning, P.M. Lang, and P.P. Tans (2017), NOAA Greenhouse Gas Reference from Atmospheric Carbon Dioxide Dry Air Mole Fractions from the NOAA ESRL Carbon Cycle Cooperative Global Air Sampling Network."),
       h5("Data Path: ftp://aftp.cmdl.noaa.gov/data/trace_gases/co2/flask/surface/"),
       h4("Canadian Weather Data:"),
       h5("Data source: http://data.ec.gc.ca/data/ climate/scientificknowledge/adjusted-and-homogenized-canadian-climate-data-ahccd")
    )
  )
))
