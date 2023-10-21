## code to prepare `chemical_elements` dataset goes here

library(PeriodicTable)

# define units
chemical_elements <- PeriodicTable:::periodicTable
chemical_elements <- chemical_elements[chemical_elements$symb != "Xx", ]

chemical_elements <-
  data.frame(
    substance_identifier = chemical_elements$symb,
    substance_name = chemical_elements$name,
    substance_mol = 1,
    substance_g = chemical_elements$mass,
    stringsAsFactors = FALSE
  )

write.csv(chemical_elements, "inst/extdata/chemical_elements.csv", row.names = FALSE)

# usethis::use_data(chemical_elements, overwrite = TRUE)
