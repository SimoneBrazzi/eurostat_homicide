#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(tidyverse)
library(shiny)
library(shinythemes)
library(ggplot2)
library(plotly)


# Define UI for application that draws a histogram
ui <- fluidPage(
  # set dark theme
  theme = shinythemes::shinytheme("darkly"),
  
  # UI multi tab
  navbarPage("Eurostat Homicide",
             # crim_hom_vrel
             tabPanel("Victim-Offender Relationship",
                      # set tab title
                      titlePanel("Intentional homicide victims by victim-offender relationship and sex - number and rate for the relevant sex group"),
                      # set plto name and dimension
                      plotlyOutput("linePlot_vrel", height = "70vh"),
                      # separator
                      hr(),
                      # set interactibe boxes
                      fluidRow(
                        column(3,
                               selectizeInput(
                                 inputId = "pers_cat_vrel",
                                 label = "Person Category",
                                 choices = crim_hom_vrel$pers_cat %>% str_unique(),
                                 multiple = TRUE,
                                 selected = "Intimate partner"
                                 )
                               ),
                        column(3,
                               selectizeInput(
                                 inputId = "sex_vrel",
                                 label = "Sex",
                                 choices = crim_hom_vrel$sex %>% str_unique(),
                                 multiple = TRUE,
                                 selected = c("Females", "Males")
                                 )
                               ),
                        column(3,
                               selectizeInput(
                                 inputId = "unit_vrel",
                                 label = "Unit",
                                 choices = crim_hom_vrel$unit %>% str_unique(),
                                 multiple = FALSE,
                                 selected = "Number"
                                 )
                               ),
                        column(3,
                               selectizeInput(
                                 inputId = "geo_vrel",
                                 label = "Country",
                                 choices = crim_hom_vrel$geo %>% str_unique(),
                                 multiple = TRUE,
                                 selected = "Italy"
                                 )
                               )
                        ) # this close fluidRow
                      ) # this close tabPanel
             ) # this close navbarPAge
) # this close fluidPage


# Define server logic required to draw a histogram
server <- function(input, output) {
  
  # set dark theme for all plots
  thematic::thematic_shiny()
  
  # crim_hom_vrel
  data_crim_hom_vrel <- reactive(crim_hom_vrel %>% 
    filter(
      pers_cat %in% input$pers_cat_vrel & 
        sex %in% input$sex_vrel & 
        unit %in% input$unit_vrel & 
        geo %in% input$geo_vrel
    ))
  
  # linePlot for crim_hom_vrel
  output$linePlot_vrel <- renderPlotly({
    
    # crim_hom_vrel
    g <- ggplot(data= data_crim_hom_vrel(),
                aes(x = time, y = values, color = sex)
                )+
      geom_line(aes(linetype = geo))+
      geom_point(aes(shape = geo))+
      scale_color_manual(
        values = c("Males" = "#1B9E77",
                   "Females" = "#D95F02",
                   "Total" = "#7570B3"
                   ))+
      scale_x_date(
        date_breaks = "year",
        date_labels = "%Y"
      )
    ggplotly(g) %>% 
      layout(hovermode = "x")
    
  })
  
}



# Run the application 
shinyApp(ui = ui, server = server)
