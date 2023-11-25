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
                        )
                      ) # close fluidRow
             ) # this close tabPanel
  ) # this close navbarPage
) # this close fluidPage
