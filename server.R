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
                                   ) # closing filter
                                 ) # closing reactive
  
  # crim_hom_vage
  data_crim_hom_vage <- reactive(crim_hom_vage %>% 
                                   filter(
                                     age %in% input$age_vage & 
                                       sex %in% input$sex_vage & 
                                       unit %in% input$unit_vage & 
                                       geo %in% input$geo_vage
                                   ) # closing filter
  ) # closing reactive
  
  
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
        ) # close values
        )+ # close scale_color_manual
      scale_x_date(
        date_breaks = "year",
        date_labels = "%Y"
      )
    ggplotly(g) %>% 
      layout(hovermode = "x")
    
  }) # close renderPlotly
  
} # close server function

