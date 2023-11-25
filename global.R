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

