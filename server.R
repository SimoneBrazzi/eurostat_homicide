# Define server logic required to draw a histogram
server <- function(input, output, session) {
  
  Sys.sleep(4) # do something that takes time
  waiter_hide()
  
  # set dark theme for all plots
  thematic::thematic_shiny()
  
  # VREL LINEPLOT
  data_crim_hom_vrel_linePlot <- reactive(crim_hom_vrel %>% 
                                   filter(
                                     pers_cat %in% input$pers_cat_vrel_linePlot & 
                                       sex %in% input$sex_vrel_linePlot & 
                                       unit %in% input$unit_vrel_linePlot & 
                                       geo %in% input$geo_vrel_linePlot
                                   ) # closing filter
                                 ) # closing reactive
  
  # VREL GROUPED
  data_crim_hom_vrel_grouped_barChart <- reactive(crim_hom_vrel_grouped %>% 
                                          filter(
                                            sex %in% input$sex_vrel_groupedBarchart & 
                                              pers_cat %in% input$pers_cat_vrel_groupedBarchart
                                                 )
                                          )
  
  # VAGE LINEPLOT
  data_crim_hom_vage_linePlot <- reactive(crim_hom_vage %>% 
                                   filter(
                                     age %in% input$age_vage_linePlot & 
                                       sex %in% input$sex_vage_linePlot & 
                                       unit %in% input$unit_vage_linePlot & 
                                       geo %in% input$geo_vage_linePlot
                                   ) # closing filter
  ) # closing reactive

  # VAGE GROUPED
  data_crim_hom_vage_grouped_barChart <- reactive(crim_hom_vage_grouped %>% 
                                                    filter(
                                                      sex %in% input$sex_vage_groupedBarchart & 
                                                        age %in% input$age_groupedBarchart
                                                    )
  )
  
  
  # SOFF LINEPLOT
  data_crim_hom_soff_linePlot <- reactive(crim_hom_soff %>% 
                                   filter(
                                     iccs %in% input$iccs_soff_linePlot & 
                                       leg_stat %in% input$leg_stat_soff_linePlot & 
                                       unit %in% input$unit_soff_linePlot &
                                       sex %in% input$sex_soff_linePlot & 
                                       geo %in% input$geo_soff_linePlot
                                   ) # closing filter
  ) # closing reactive
  
  # SOFF GROUPED
  data_crim_hom_soff_grouped_barChart <- reactive(crim_hom_soff_grouped %>% 
                                                    filter(
                                                      sex %in% input$sex_soff_groupedBarchart & 
                                                        iccs %in% input$iccs_soff_groupedBarchart &
                                                        leg_stat %in% input$leg_stat_soff_groupedBarchart
                                                        
                                                    )
                                                  )

  # VREL LINEPLOT
  output$linePlot_vrel <- renderPlotly({
    
    
    
    g <- ggplot(data= data_crim_hom_vrel_linePlot(),
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
      labs(title = "Time Series by Relationship of the Victim to the Perpetrator",
           subtitle = "By Sex and Country",
           x = "Time",
           y = input$unit_vrel_linePlot,
           color = "Sex",
           linetype = "Country",
           shape = "",
           caption = "Source: Eurostat"
      )+
      scale_y_continuous(breaks = scales::breaks_pretty(n = 10))
    ggplotly(g) %>% 
      layout(hovermode = "x")
  
  })

  # VREL GROUPED BARCHART
  output$groupedBarchart_vrel <- renderPlotly({
    
    
    
  g <- ggplot(data_crim_hom_vrel_grouped_barChart(),
              aes(x = time, y = values_grouped, fill = geo)
              )+
    geom_bar(stat = "identity")+
    labs(title = "Homicide victims by relationship to perpetrator",
         subtitle = "Grouped by country",
         x = "Years",
         y = "Values",
         fill = "Country",
         caption = "Source: Eurostat"
         )+
    scale_fill_manual(values = palette_crim_hom_vrel_grouped)+
    # scale integers from 0 to max value with tick every 100
    scale_y_continuous(breaks = scales::breaks_pretty(n = 10))+
    facet_grid(pers_cat ~ sex)
  ggplotly(g)
  })


  # VAGE LINEPLOT
  output$linePlot_vage <- renderPlotly({
    
    
    
    g <- ggplot(data= data_crim_hom_vage_linePlot(),
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
      labs(title = "Time Series by Age of the Victim",
           subtitle = "By Sex and Country",
           x = "Time",
           y = input$unit_vage_linePlot,
           color = "Sex",
           linetype = "Country",
           shape = "",
           caption = "Source: Eurostat"
      )+
      scale_y_continuous(breaks = scales::breaks_pretty(n = 10))
    ggplotly(g) %>% 
      layout(hovermode = "x")
  }) # close renderPlotly
 
  # VAGE GROUPED BARCHART
  output$groupedBarchart_vage <- renderPlotly({
    
    
    g <- ggplot(data_crim_hom_vage_grouped_barChart(),
                aes(x = time, y = values_grouped, fill = geo)
    )+
      geom_bar(stat = "identity")+
      labs(title = "Victims of Homicide by Age and Country",
           subtitle = "Grouped by country",
           x = "Years",
           y = "Values",
           fill = "Country",
           caption = "Source: Eurostat"
      )+
      scale_fill_manual(values = palette_crim_hom_vage_grouped)+
      # scale integers from 0 to max value with tick every 100
      scale_y_continuous(breaks = scales::breaks_pretty(n = 10))+
      facet_grid(age ~ sex)
    ggplotly(g)
  })
  
    
    # SOFF LINEPLOT
    output$linePlot_soff <- renderPlotly({
      
      
      
      g <- ggplot(data= data_crim_hom_soff_linePlot(),
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
        labs(title = "Time Series by Crime Classification and Legal Status",
             subtitle = "By Sex and Country",
             x = "Time",
             y = input$unit_soff_linePlot,
             color = "Sex",
             linetype = "Country",
             shape = "",
             caption = "Source: Eurostat"
             )+
        scale_y_continuous(breaks = scales::breaks_pretty(n = 10))
      ggplotly(g) %>% 
        layout(hovermode = "x")
        
    
  }) # close renderPlotly
    

    # SOFF GROUPED BARCHART
    output$groupedBarchart_soff <- renderPlotly({
      
      
      
      g <- ggplot(data_crim_hom_soff_grouped_barChart(),
                  aes(x = time, y = values_grouped, fill = geo)
      )+
        geom_bar(stat = "identity")+
        labs(title = "Crime classification by Country and Legal Status",
             subtitle = "Grouped by country",
             x = "Years",
             y = "Values",
             fill = "Country",
             caption = "Source: Eurostat"
        )+
        scale_fill_manual(values = palette_crim_hom_soff_grouped)+
        scale_y_continuous(breaks = scales::breaks_pretty(n = 10))+
        facet_grid(iccs ~ sex)
      ggplotly(g)
    })
    
 
} # close server function

