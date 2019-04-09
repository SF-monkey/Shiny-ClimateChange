library(shiny)

load("C02Worldwide.Rdata")
load("CanadianMeanTemp.Rdata")
load("CanadianAvgSnow.Rdata")
city_data = MeanTemp[order(as.character(MeanTemp$`InfoTemp[3]`),as.character(MeanTemp$`InfoTemp[2]`)),]
city_data <- replace(city_data, city_data=="-9999.9", NA)
city_data$City <- city_data$`InfoTemp[2]`

shinyUI(fluidPage(
  titlePanel("Worldwide CO2 Level"),
  
  sidebarLayout(
    sidebarPanel(
      conditionalPanel(
        condition="input.conditionedPanels == 'Play'",
        
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
      
      conditionalPanel(
        condition="input.conditionedPanels == 'Story'",
        
        selectInput("province", "Select province:", unique(city_data$`InfoTemp[3]`)),
        selectInput("city", "Select city:", unique(city_data$City))
      )
    ),

    
    mainPanel(
      
      style = "overflow-y:scroll; max-height: 600px",
      
       tabsetPanel(type = "tabs",
         tabPanel("Play",
                  plotOutput("distPlot"),
                  h3("Reference"),
                  h4("CO2 Data:"),
                  h5("Dlugokencky, E.J., K.W. Thoning, P.M. Lang, and P.P. Tans (2017), NOAA Greenhouse Gas Reference from Atmospheric Carbon Dioxide Dry Air Mole Fractions from the NOAA ESRL Carbon Cycle Cooperative Global Air Sampling Network."),
                  h5("Data Path: ftp://aftp.cmdl.noaa.gov/data/trace_gases/co2/flask/surface/"),
                  h4("Canadian Weather Data:"),
                  h5("Data source: http://data.ec.gc.ca/data/ climate/scientificknowledge/adjusted-and-homogenized-canadian-climate-data-ahccd")
                  ),
         tabPanel("Story",
                  h2("Climate Change in Canada"),
                  h4("In the past several decades, the worldwide CO2 level raises almost 33%."),
                  h4("In Tab 1, you can play with the data in a specific year. It is clear that the CO2 level increase in a periodic way where the maximum increament of CO2 appears in around August."),
                  h4("This could be a result of people's over-use of air conditioners, producing large amount of CO2 gases."),
                  plotOutput("distplot2"),
                  h4("But how does this affect the globe?"),
                  h4("Recently, scientific measure states that, due to large volumn of CO2 output, Canada has its temperature raise twice as fast as the rest of the area in the world."),
                  h4("Let's see what happenes to some of the Canadian cities over the year."),
                  plotOutput("distplot3"),
                  h4("Notice that many data are missing, thus here I included a super smoother line to indicate the change pattern."),
                  h4("It seems that the increases of CO2 level are correlated to the temperature increase in Canada."),
                  h4("on average, the temperature raises 1-2 degrees in most of the cities.")
                  ),
         tabPanel("About",source("about.R")$value()),
         
         id = 'conditionedPanels'
        
       )
       
    )
  )
))
