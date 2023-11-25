ui <- fluidPage(
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
                      ), # this close fluidRow
                      
                      # separator
                      hr(),
                      # Stacked Bar Chart
                      plotlyOutput("barChart_vrel", height = "70vh"),
                      # set interactive boxes
                      fluidRow(
                        column(3,
                               selectizeInput(
                                 inputId = "pers_cat_vrel_bar",
                                 label = "Person Category",
                                 choices = crim_hom_vrel$pers_cat %>% str_unique(),
                                 multiple = TRUE,
                                 selected = c("Intimate partner", "Family member")
                               )
                        ),
                        column(3,
                               selectizeInput(
                                 inputId = "sex_vrel_bar",
                                 label = "Sex",
                                 choices = crim_hom_vrel$sex %>% str_unique(),
                                 multiple = TRUE,
                                 selected = c("Females", "Males")
                               )
                        ),
                        column(3,
                               selectizeInput(
                                 inputId = "unit_vrel_bar",
                                 label = "Unit",
                                 choices = crim_hom_vrel$unit %>% str_unique(),
                                 multiple = FALSE,
                                 selected = "Number"
                               )
                        ),
                        column(3,
                               selectizeInput(
                                 inputId = "geo_vrel_bar",
                                 label = "Country",
                                 choices = crim_hom_vrel$geo %>% str_unique(),
                                 multiple = FALSE,
                                 selected = "Italy"
                               )
                        ),
                        column(3,
                               selectizeInput(
                                 inputId = "time_vrel_bar",
                                 label = "Year",
                                 choices = crim_hom_vrel$time %>% str_unique(),
                                 multiple = FALSE,
                                 selected = "2021-01-01"
                               )
                        )
                      ), # this close fluidRow
                      
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
                                 inputId = "age_vage",
                                 label = "Age",
                                 choices = crim_hom_vage$age %>% str_unique(),
                                 multiple = TRUE,
                                 selected = "Total"
                               )
                        ),
                        column(3,
                               selectizeInput(
                                 inputId = "sex_vage",
                                 label = "Sex",
                                 choices = crim_hom_vage$sex %>% str_unique(),
                                 multiple = TRUE,
                                 selected = c("Females", "Males")
                               )
                        ),
                        column(3,
                               selectizeInput(
                                 inputId = "unit_vage",
                                 label = "Unit",
                                 choices = crim_hom_vage$unit %>% str_unique(),
                                 multiple = FALSE,
                                 selected = "Number"
                               )
                        ),
                        column(3,
                               selectizeInput(
                                 inputId = "geo_vage",
                                 label = "Country",
                                 choices = crim_hom_vage$geo %>% str_unique(),
                                 multiple = TRUE,
                                 selected = "Italy"
                               )
                        )
                      ), # this close fluidRow
                      
                      # Stacked Bar Chart
                      plotlyOutput("barChart_vage", height = "70vh"),
                      # set interactive boxes
                      fluidRow(
                        column(3,
                               selectizeInput(
                                 inputId = "age_vage_bar",
                                 label = "Age",
                                 choices = crim_hom_vage$age %>% str_unique(),
                                 multiple = TRUE,
                                 selected = c("Less than 15 years",
                                              "From 15 to 29 years",
                                              "From 30 to 44 years",
                                              "From 45 to 59 years",
                                              "60 years or over"
                                              )
                               )
                        ),
                        column(3,
                               selectizeInput(
                                 inputId = "sex_vage_bar",
                                 label = "Sex",
                                 choices = crim_hom_vage$sex %>% str_unique(),
                                 multiple = TRUE,
                                 selected = c("Females", "Males")
                               )
                        ),
                        column(3,
                               selectizeInput(
                                 inputId = "unit_vage_bar",
                                 label = "Unit",
                                 choices = crim_hom_vage$unit %>% str_unique(),
                                 multiple = FALSE,
                                 selected = "Number"
                               )
                        ),
                        column(3,
                               selectizeInput(
                                 inputId = "geo_vage_bar",
                                 label = "Country",
                                 choices = crim_hom_vage$geo %>% str_unique(),
                                 multiple = FALSE,
                                 selected = "Italy"
                               )
                        ),
                        column(3,
                               selectizeInput(
                                 inputId = "time_vage_bar",
                                 label = "Year",
                                 choices = crim_hom_vage$time %>% str_unique(),
                                 multiple = TRUE,
                                 selected = "2021-01-01"
                               )
                        )
                      ) # close fluidRow
             ), # this close tabPanel
             
             # crim_hom_soff
             tabPanel("Homicide and Sexual Offences by Legal Status",
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
                                 inputId = "iccs_soff",
                                 label = "ICCS",
                                 choices = crim_hom_soff$iccs %>% str_unique(),
                                 multiple = TRUE,
                                 selected = "Intentional homicide"
                               )
                        ),
                        column(3,
                               selectizeInput(
                                 inputId = "leg_stat_soff",
                                 label = "Legal Status",
                                 choices = crim_hom_soff$leg_stat %>% str_unique(),
                                 multiple = FALSE,
                                 selected = "Victim"
                               )
                        ),
                        column(3,
                               selectizeInput(
                                 inputId = "sex_soff",
                                 label = "Sex",
                                 choices = crim_hom_soff$sex %>% str_unique(),
                                 multiple = TRUE,
                                 selected = c("Females", "Males")
                               )
                        ),
                        column(3,
                               selectizeInput(
                                 inputId = "unit_soff",
                                 label = "Unit",
                                 choices = crim_hom_soff$unit %>% str_unique(),
                                 multiple = FALSE,
                                 selected = "Number"
                               )
                        ),
                        column(3,
                               selectizeInput(
                                 inputId = "geo_soff",
                                 label = "Country",
                                 choices = crim_hom_soff$geo %>% str_unique(),
                                 multiple = TRUE,
                                 selected = "Italy"
                               )
                        )
                      ), # this close fluidRow
                      
                      # Stacked Bar Chart soff
                      plotlyOutput("barChart_soff", height = "70vh"),
                      # set interactive boxes
                      fluidRow(
                        column(3,
                               selectizeInput(
                                 inputId = "iccs_soff_bar",
                                 label = "ICCS",
                                 choices = crim_hom_soff$iccs %>% str_unique(),
                                 multiple = TRUE,
                                 selected = c("Intentional homicide",
                                              "Rape",
                                              "Sexual assault"
                                              )
                                 )
                        ),
                        column(3,
                               selectizeInput(
                                 inputId = "leg_stat_soff_bar",
                                 label = "Legal Status",
                                 choices = crim_hom_soff$leg_stat %>% str_unique(),
                                 multiple = TRUE,
                                 selected = "Victim"
                               )
                        ),
                        column(3,
                               selectizeInput(
                                 inputId = "sex_soff_bar",
                                 label = "Sex",
                                 choices = crim_hom_soff$sex %>% str_unique(),
                                 multiple = TRUE,
                                 selected = c("Females", "Males")
                               )
                        ),
                        column(3,
                               selectizeInput(
                                 inputId = "unit_soff_bar",
                                 label = "Unit",
                                 choices = crim_hom_soff$unit %>% str_unique(),
                                 multiple = FALSE,
                                 selected = "Number"
                               )
                        ),
                        column(3,
                               selectizeInput(
                                 inputId = "geo_soff_bar",
                                 label = "Country",
                                 choices = crim_hom_soff$geo %>% str_unique(),
                                 multiple = FALSE,
                                 selected = "Italy"
                               )
                        ),
                        column(3,
                               selectizeInput(
                                 inputId = "time_soff_bar",
                                 label = "Year",
                                 choices = crim_hom_soff$time %>% str_unique(),
                                 multiple = TRUE,
                                 selected = "2021-01-01"
                               )
                        )
                      ) # close fluidRow
             ) # this close tabPanel
  ) # this close navbarPage
) # this close fluidPage
