ui <- fluidPage(
  
  useWaiter(), 
  waiterShowOnLoad(html = spin_hexdots()),
  
  # set dark theme
  theme = shinythemes::shinytheme("darkly"),
  
  # UI multi tab
  navbarPage("Eurostat Homicide",
             # crim_hom_vrel
             tabPanel("Victim-Offender Relationship",
                      # set tab title
                      titlePanel("Intentional homicide victims by victim-offender relationship and sex - number and rate for the relevant sex group"),
                      
                      # separator
                      hr(),
                      
                      # set plot name and dimension
                      plotlyOutput("linePlot_vrel", height = "70vh"),
                      
                      # set interactive boxes
                      fluidRow(
                        column(3,
                               selectizeInput(
                                 inputId = "pers_cat_vrel_linePlot",
                                 label = "Person Category",
                                 choices = crim_hom_vrel$pers_cat %>% str_unique(),
                                 multiple = TRUE,
                                 selected = "Intimate partner"
                               )
                        ),
                        column(3,
                               selectizeInput(
                                 inputId = "sex_vrel_linePlot",
                                 label = "Sex",
                                 choices = crim_hom_vrel$sex %>% str_unique(),
                                 multiple = TRUE,
                                 selected = c("Females", "Males")
                               )
                        ),
                        column(3,
                               selectizeInput(
                                 inputId = "geo_vrel_linePlot",
                                 label = "Country",
                                 choices = crim_hom_vrel$geo %>% str_unique(),
                                 multiple = TRUE,
                                 selected = "Italy"
                               )
                        ),
                        column(3,
                               selectizeInput(
                                 inputId = "unit_vrel_linePlot",
                                 label = "Unit",
                                 choices = crim_hom_vrel$unit %>% str_unique(),
                                 multiple = FALSE,
                                 selected = "Number"
                               )
                        )
                      ), # this close fluidRow
                      
                      hr(),
                      plotlyOutput("groupedBarchart_vrel", height = "70vh"),
                      fluidRow(
                        column(3,
                               selectizeInput(
                                 inputId = "pers_cat_vrel_groupedBarchart",
                                 label = "Person Category",
                                 choices = crim_hom_vrel_grouped$pers_cat %>% str_unique(),
                                 multiple = TRUE,
                                 selected = "Intimate partner"
                                 )
                        ),
                        column(3,
                               selectizeInput(
                                 inputId = "sex_vrel_groupedBarchart",
                                 label = "Sex",
                                 choices = crim_hom_vrel_grouped$sex %>% str_unique(),
                                 multiple = TRUE,
                                 selected = c("Females", "Males")
                               )
                        ),
                        column(3,
                               selectizeInput(
                                 inputId = "geo_vrel_groupedBarchart",
                                 label = "Country",
                                 choices = crim_hom_vrel_grouped$geo %>% str_unique(),
                                 multiple = TRUE,
                                 selected = crim_hom_vrel_grouped$geo %>% str_unique()
                               ))
                      )
                      
             ), # this close tabPanel
             
             
             tabPanel("Homicide Victims by Age and Sex",
                      # set tab title
                      titlePanel("Intentional homicide victims by age and sex - number and rate for the relevant sex and age groups"),
                      
                      # separator
                      hr(),
                      # set plot name and dimension
                      plotlyOutput("linePlot_vage", height = "70vh"),
                      
                      # set interactive boxes
                      fluidRow(
                        column(3,
                               selectizeInput(
                                 inputId = "iccs_vage_linePlot",
                                 label = "Crime Classification",
                                 choices = crim_hom_vage$iccs %>% str_unique(),
                                 multiple = FALSE,
                                 selected = "Intentional homicide"
                               )
                        ),
                        column(3,
                               selectizeInput(
                                 inputId = "age_vage_linePlot",
                                 label = "Age",
                                 choices = crim_hom_vage$age %>% str_unique(),
                                 multiple = TRUE,
                                 selected = "Total"
                               )
                        ),
                        column(3,
                               selectizeInput(
                                 inputId = "sex_vage_linePlot",
                                 label = "Sex",
                                 choices = crim_hom_vage$sex %>% str_unique(),
                                 multiple = TRUE,
                                 selected = c("Females", "Males")
                               )
                        ),
                        column(3,
                               selectizeInput(
                                 inputId = "geo_vage_linePlot",
                                 label = "Country",
                                 choices = crim_hom_vage$geo %>% str_unique(),
                                 multiple = TRUE,
                                 selected = "Italy"
                               )
                        ),
                        column(3,
                               selectizeInput(
                                 inputId = "unit_vage_linePlot",
                                 label = "Unit",
                                 choices = crim_hom_vage$unit %>% str_unique(),
                                 multiple = FALSE,
                                 selected = "Number"
                               )
                        )
                      ), # this close fluidRow
                      
                      hr(),
                      # grouped barchart vage
                      plotlyOutput("groupedBarchart_vage", height = "70vh"),
                      fluidRow(
                        column(3,
                               selectizeInput(
                                 inputId = "age_groupedBarchart",
                                 label = "Age",
                                 choices = crim_hom_vage_grouped$age %>% str_unique(),
                                 multiple = TRUE,
                                 selected = "Total"
                               )
                        ),
                        column(3,
                               selectizeInput(
                                 inputId = "sex_vage_groupedBarchart",
                                 label = "Sex",
                                 choices = crim_hom_vage_grouped$sex %>% str_unique(),
                                 multiple = TRUE,
                                 selected = c("Females", "Males")
                               )
                        ),
                        column(3,
                               selectizeInput(
                                 inputId = "geo_vage_groupedBarchart",
                                 label = "Country",
                                 choices = crim_hom_vage_grouped$geo %>% str_unique(),
                                 multiple = TRUE,
                                 selected = crim_hom_vage_grouped$geo %>% str_unique()
                               ))
                      )
             ), # this close tabPanel
             
             # crim_hom_soff
             tabPanel("Homicide and Sexual Offences by Crime Classification and Legal Status",
                      # set tab title
                      titlePanel("Intentional homicide and sexual offences by legal status and sex of the person involved - number and rate for the relevant sex group"),
                      
                      # separator
                      hr(),
                      # set plot name and dimension soff
                      plotlyOutput("linePlot_soff", height = "70vh"),
                      
                      # set interactive boxes
                      fluidRow(
                        column(3,
                               selectizeInput(
                                 inputId = "iccs_soff_linePlot",
                                 label = "Crime Classification",
                                 choices = crim_hom_soff$iccs %>% str_unique(),
                                 multiple = TRUE,
                                 selected = "Intentional homicide"
                               )
                        ),
                        column(3,
                               selectizeInput(
                                 inputId = "leg_stat_soff_linePlot",
                                 label = "Legal Status",
                                 choices = crim_hom_soff$leg_stat %>% str_unique(),
                                 multiple = FALSE,
                                 selected = "Victim"
                               )
                        ),
                        column(3,
                               selectizeInput(
                                 inputId = "sex_soff_linePlot",
                                 label = "Sex",
                                 choices = crim_hom_soff$sex %>% str_unique(),
                                 multiple = TRUE,
                                 selected = c("Females", "Males")
                               )
                        ),
                        column(3,
                               selectizeInput(
                                 inputId = "geo_soff_linePlot",
                                 label = "Country",
                                 choices = crim_hom_soff$geo %>% str_unique(),
                                 multiple = TRUE,
                                 selected = "Italy"
                               )
                        ),
                        column(3,
                               selectizeInput(
                                 inputId = "unit_soff_linePlot",
                                 label = "Unit",
                                 choices = crim_hom_soff$unit %>% str_unique(),
                                 multiple = FALSE,
                                 selected = "Number"
                               )
                        )
                      ), # this close fluidRow
                      
                      hr(),
                      # stacked barchart soff
                      plotlyOutput("groupedBarchart_soff", height = "70vh"),
                      fluidRow(
                        column(3,
                               selectizeInput(
                                 inputId = "iccs_soff_groupedBarchart",
                                 label = "Crime Classification",
                                 choices = crim_hom_soff_grouped$iccs %>% str_unique(),
                                 multiple = TRUE,
                                 selected = "Intentional homicide"
                               )
                        ),
                        column(3,
                               selectizeInput(
                                 inputId = "leg_stat_soff_groupedBarchart",
                                 label = "Legal Status",
                                 choices = crim_hom_soff_grouped$leg_stat %>% str_unique(),
                                 multiple = FALSE,
                                 selected = "Victim"
                               )
                        ),
                        column(3,
                               selectizeInput(
                                 inputId = "sex_soff_groupedBarchart",
                                 label = "Sex",
                                 choices = crim_hom_soff_grouped$sex %>% str_unique(),
                                 multiple = TRUE,
                                 selected = c("Females", "Males")
                               )
                        ),
                        column(3,
                               selectizeInput(
                                 inputId = "geo_soff_groupedBarchart",
                                 label = "Country",
                                 choices = crim_hom_soff_grouped$geo %>% str_unique(),
                                 multiple = TRUE,
                                 selected = crim_hom_soff_grouped$geo %>% str_unique()
                                 )
                               )
                      ) # this close fluidRow
             ), # this close tabPanel
             
             tabPanel("Credits",
                      htmltools::includeMarkdown("credits.Rmd")
                      )
             
             ) # this close tabsetPanel
  ) # this close dashboardBody
