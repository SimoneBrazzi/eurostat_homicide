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
                                       geo %in% input$geo_vrel_bar &
                                       time %in% input$time_vrel_bar
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
                                       geo %in% input$geo_vage_bar &
                                       time %in% input$time_vage_bar
                                   ) # closing filter
  ) # closing reactive
  
  
  # crim_hom_soff lineplot
  data_crim_hom_soff <- reactive(crim_hom_soff %>% 
                                   filter(
                                     iccs %in% input$iccs_soff & 
                                       leg_stat %in% input$leg_stat_soff & 
                                       unit %in% input$unit_soff &
                                       sex %in% input$sex_soff & 
                                       geo %in% input$geo_soff
                                   ) # closing filter
  ) # closing reactive
  # crim_hom_soff stacked barchart
  data_crim_hom_soff_bar <- reactive(crim_hom_soff %>% 
                                       filter(
                                         iccs %in% input$iccs_soff_bar &
                                           leg_stat %in% input$leg_stat_soff_bar &
                                           sex %in% input$sex_soff_bar & 
                                           unit %in% input$unit_soff_bar & 
                                           geo %in% input$geo_soff_bar &
                                           time %in% input$time_soff_bar
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
      geom_bar(stat = "identity")+
      scale_fill_manual(
        values = c("Family member" = "#1F78B4",
                   "Intimate partner" = "#B2DF8A",
                   "Intimate partner or family member" = "#A6CEE3"
                   )
      )
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
  
  
  # crim_hom_vage stackedBarchart
  output$barChart_vage <- renderPlotly({
    g <- ggplot(data = data_crim_hom_vage_bar(),
                aes(x = sex, y = values, fill = age)
    )+
      geom_bar(stat = "identity")+
      scale_fill_manual(
        values = c("Less than 15 years" = "#1F78B4",
                   "From 15 to 29 years" = "#B2DF8A",
                   "From 30 to 44 years" = "#33A02C",
                   "From 45 to 59 years" = "#FB9A99",
                   "60 years or over" = "#E31A1C",
                   "Total" = "#A6CEE3")
      )
    # ggplotly interactivity
    ggplotly(g) %>% 
      layout(hovermode = "x")
  })
  
  
    
    # linePlot for crim_hom_soff
    output$linePlot_soff <- renderPlotly({
      
      # crim_hom_soff
      g <- ggplot(data= data_crim_hom_soff(),
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
             y = input$unit_soff
             )
      ggplotly(g) %>% 
        layout(hovermode = "x")
        
    
  }) # close renderPlotly
    
    
    # crim_hom_soff stackedBarchart
    output$barChart_soff <- renderPlotly({
      g <- ggplot(data = data_crim_hom_soff_bar(),
                  aes(x = sex, y = values, fill = iccs)
      )+
        geom_bar(stat = "identity")+
        scale_fill_manual(
          values = c("Intentional homicide" = "#A6CEE3",
                     "Rape" = "#1F78B4",
                     "Sexual assault" = "#B2DF8A")
        )
      # ggplotly interactivity
      ggplotly(g) %>% 
        layout(hovermode = "x")
    })

  
} # close server function

