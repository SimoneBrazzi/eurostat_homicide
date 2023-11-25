# Define server logic required to draw a histogram
server <- function(input, output, session) {
  
  # set dark theme for all plots
  thematic::thematic_shiny()
  
  # crim_hom_vrel lineplot
  data_crim_hom_vrel <- reactive(crim_hom_vrel %>% 
                                   filter(
                                     pers_cat %in% input$pers_cat_vrel & 
                                       sex %in% input$sex_vrel & 
                                       unit %in% input$unit_vrel & 
                                       geo %in% input$geo_vrel
                                   ) # closing filter
                                 ) # closing reactive
  
  # crim_hom_vrel stacked barchart
  data_crim_hom_vrel_bar <- reactive(crim_hom_vrel %>% 
                                   filter(
                                     pers_cat %in% input$pers_cat_vrel_bar & 
                                       sex %in% input$sex_vrel_bar & 
                                       unit %in% input$unit_vrel_bar & 
                                       geo %in% input$geo_vrel_bar
                                   ) # closing filter
  ) # closing reactive
  
  # crim_hom_vage lineplot
  data_crim_hom_vage <- reactive(crim_hom_vage %>% 
                                   filter(
                                     age %in% input$age_vage & 
                                       sex %in% input$sex_vage & 
                                       unit %in% input$unit_vage & 
                                       geo %in% input$geo_vage
                                   ) # closing filter
  ) # closing reactive
  # crim_hom_vage stacked barchart
  data_crim_hom_vage_bar <- reactive(crim_hom_vage %>% 
                                   filter(
                                     age %in% input$age_vage_bar & 
                                       sex %in% input$sex_vage_bar & 
                                       unit %in% input$unit_vage_bar & 
                                       geo %in% input$geo_vage_bar
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
      )+
      labs(x = "Time",
           y = input$unit_vrel
      )
    ggplotly(g) %>% 
      layout(hovermode = "x")
  })
  
  # crim_hom_vrel stackedBarchart
  output$barChart_vrel <- renderPlotly({
    g <- ggplot(data = data_crim_hom_vrel_bar(),
                aes(x = sex, y = values, fill = pers_cat)
                )+
      geom_bar(stat = "identity")
    ggplotly(g) %>% 
      layout(hovermode = "x")
  })
    
    # linePlot for crim_hom_vage
    output$linePlot_vage <- renderPlotly({
      
      # crim_hom_vage
      g <- ggplot(data= data_crim_hom_vage(),
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
        )+
        labs(x = "Time",
             y = input$unit_vage
             )
      ggplotly(g) %>% 
        layout(hovermode = "x")
        
    
  }) # close renderPlotly
    
    
    # crim_hom_vrel stackedBarchart
    output$barChart_vage <- renderPlotly({
      g <- ggplot(data = data_crim_hom_vage_bar(),
                  aes(x = sex, y = values, fill = age)
      )+
        geom_bar(stat = "identity")
      ggplotly(g) %>% 
        layout(hovermode = "x")
    })
  
  
} # close server function

