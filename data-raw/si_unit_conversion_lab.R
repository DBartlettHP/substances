library(writexl)
library(readxl)
library(dplyr)
library(tidyr)
library(readr)
library(janitor)
library(tidyverse)


unclean_data <- read_xlsx("/git/substances/inst/extdata/MainConversions.xlsx", na = "NA")

si_conversions_clean <-
  unclean_data |>
  clean_names() |>
  distinct(analyte, .keep_all = TRUE) |>
  mutate(conv_factor = signif(conv_factor)) |>
  arrange(analyte) |>
  filter(!is.na(conv_factor)) |>
  select(analyte, conv_unit, conv_factor, si_unit, specimen_type) |>
  mutate(
    specimen_type = replace_na(specimen_type, "unspecified")
  )

write.csv(si_conversions_clean, "inst/extdata/laboratory_si_conversions.csv", row.names = FALSE)