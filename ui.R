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

# search in eurostat db
homicide <- search_eurostat("homicide")

# import data to variable
crim_hom_vrel <- get_eurostat("crim_hom_vrel", time_format = "date")

# convert all observations to understandable data
crim_hom_vrel <- label_eurostat(crim_hom_vrel)
# order data by country and date for time series purpose
crim_hom_vrel <- crim_hom_vrel %>% 
  arrange(geo, time)


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
                                 multiple = FALSE,
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
