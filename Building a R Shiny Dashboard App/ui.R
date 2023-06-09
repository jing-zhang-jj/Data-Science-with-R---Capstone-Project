# Load required libraries
require(leaflet)


# Create a RShiny UI
shinyUI(
  fluidPage(padding=5,
            titlePanel("Bike-sharing demand prediction app"), 
            # Create a side-bar layout
            sidebarLayout(
              # Create a main panel to show cities on a leaflet map
              mainPanel(
                # leaflet output with id = 'city_bike_map', height = 1000
                leafletOutput("city_bike_map", height=1000)
              ),
              # Create a side bar to show detailed plots for a city
              sidebarPanel(
                # select drop down list to select city
                selectInput(inputId="city_dropdown","Cities:", choices = c("All", "Seoul", "Suzhou", "London", "New York", "Paris") ),
                plotOutput(outputId="temp_line", width = "100%", height = "350px"),
                plotOutput(outputId="bike_line", width = "100%", height = "350px", click = "plot_click"),
                verbatimTextOutput("bike_date_output", placeholder = FALSE),
                plotOutput(outputId="humidity_pred_chart", width = "100%", height = "350px")
                
                
              )
            )
  ))