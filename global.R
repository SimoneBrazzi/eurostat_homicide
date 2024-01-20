# wrangling
library("tidyverse")
library("readr")
library("stringr")
library("dplyr")
library("magrittr")
library("forcats")
library("lubridate")
library("writexl")
library("eurostat")
# plotting and dashboarding
library("shiny")
library("shinythemes")
library("ggplot2")
library("plotly")
library("scales")
library("RColorBrewer")
library("waiter")
# connecting and other
library("rsconnect")
library("markdown")


# search in eurostat db
homicide <- search_eurostat("homicide")

# import data to variable
crim_hom_vrel <- get_eurostat("crim_hom_vrel", time_format = "date")
crim_hom_vage <- get_eurostat("crim_hom_vage", time_format = "date")
crim_hom_soff <- get_eurostat("crim_hom_soff", time_format = "date")

# convert all observations to understandable data
crim_hom_vrel <- label_eurostat(crim_hom_vrel)
crim_hom_vage <- label_eurostat(crim_hom_vage)
crim_hom_soff <- label_eurostat(crim_hom_soff)

# label_eurostat_vars(crim_hom_vrel)
# label_eurostat_vars(crim_hom_vage)
# label_eurostat_vars(crim_hom_soff)
crim_hom_vrel <- crim_hom_vrel %>% rename(time = TIME_PERIOD)
crim_hom_vage <- crim_hom_vage %>% rename(time = TIME_PERIOD)
crim_hom_soff <- crim_hom_soff%>% rename(time = TIME_PERIOD)


# order data by country and date for time series purpose
crim_hom_vrel <- crim_hom_vrel %>% 
  arrange(geo, time)
crim_hom_vage <- crim_hom_vage %>% 
  arrange(geo, time)
crim_hom_soff <- crim_hom_soff %>% 
  arrange(geo, time)


crim_hom_vrel_grouped <- crim_hom_vrel %>% 
  dplyr::group_by(geo, time, sex, pers_cat, unit) %>% 
  dplyr::summarise(values_grouped = sum(values), .groups = "drop") %>% 
  filter(unit == "Number") %>% 
  arrange(geo, time, sex)

crim_hom_vage_grouped <- crim_hom_vage %>% 
  dplyr::group_by(geo, time, unit, sex, age) %>% 
  dplyr::summarise(values_grouped = sum(values), .groups = "drop") %>% 
  filter(unit == "Number") %>% 
  arrange(geo, time, sex)

crim_hom_soff_grouped <- crim_hom_soff %>% 
  dplyr::group_by(geo, time, unit, iccs, leg_stat, sex) %>%
  dplyr::summarise(values_grouped = sum(values), .groups = "drop") %>% 
  filter(unit == "Number") %>% 
  arrange(geo, time, sex)

# brewer.pal(11, "RdYlBu")
palette <- c("#A50026", "#D73027", "#F46D43", "#FDAE61", "#FEE090", "#FFFFBF", "#E0F3F8", "#ABD9E9", "#74ADD1", "#4575B4", "#313695")

palette_crim_hom_vrel_grouped <- rep(
  palette,
  length.out = crim_hom_vrel_grouped$geo %>% str_unique() %>% length()
  )

palette_crim_hom_vage_grouped <- rep(
  palette,
  length.out = crim_hom_vage_grouped$geo %>% str_unique() %>% length()
)

palette_crim_hom_soff_grouped <- rep(
  palette,
  length.out = crim_hom_soff_grouped$geo %>% str_unique() %>% length()
)





# crim_hom_vage stackedBarchart

#scale_fill_manual(
#  values = c("Less than 15 years" = "#1F78B4",
#             "From 15 to 29 years" = "#B2DF8A",
#             "From 30 to 44 years" = "#33A02C",
#             "From 45 to 59 years" = "#FB9A99",
#             "60 years or over" = "#E31A1C",
#             "Total" = "#A6CEE3")
#)

#        scale_fill_manual(
# values = c("Intentional homicide" = "#A6CEE3",
#           "Rape" = "#1F78B4",
#           "Sexual assault" = "#B2DF8A")
#)

