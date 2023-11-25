library("tidyverse")
library("stringr")
library("dplyr")
library("magrittr")
library("lubridate")
library("eurostat")

library("rmarkdown")

library("shiny")
library("shinythemes")
library("ggplot2")
library("plotly")
library("rsconnect")

# Define server logic required to draw a histogram
server <- function(input, output, session) {
  
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

