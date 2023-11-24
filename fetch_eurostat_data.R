# search in eurostat db
homicide <- search_eurostat("homicide")
# check title and code
homicide$title
homicide$code

# import data to variable
crim_hom_vrel <- get_eurostat("crim_hom_vrel", time_format = "date")
# column explaination
label_eurostat_vars(crim_hom_vrel)

# convert all observations to understandable data
crim_hom_vrel <- label_eurostat(crim_hom_vrel)

crim_hom_vrel <- crim_hom_vrel %>% 
  arrange(geo, time)


# check unique values for all columns
# map(crim_hom_vrel, ~ .x %>% str_unique())

# check column type
# glimpse(crim_hom_vrel)
