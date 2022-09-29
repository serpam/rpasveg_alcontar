#------------------------------
# Title: Harmonize taxonomic names
# Date: 2022-09-26
# Author: Pérez-Luque, A.J. 
# version: 0.1
#------------------------------

# Harmonize taxonomic names 
source('scripts/99-pkgs.R')

# read data 
spdata <- read_excel(path=here::here("data/rpasfield_alcontar.xlsx"),
                     sheet = "species_coverage") 

# Generate unique scientific data 
taxon <- spdata %>%
  pull(species_name) %>%
  unique() %>%
  as_tibble() %>%
  rename(scientificName = value)


# Get harmonized names 
taxon_names <- rgbif::name_backbone_checklist(taxon) 

# Join data with normalized names 
spdata_aux <- spdata %>% inner_join(
  (taxon_names %>% dplyr::select(scientificName, verbatim_name, rank)),
  by=c("species_name"="verbatim_name")) %>% 
  relocate(scientificName, .after = species_name)

# Filter data 
## remove 'Unknow data' and 'Family rank' 
spdata_normalized <- spdata_aux %>% 
  filter(!is.na(rank)) %>% 
  filter(rank != "FAMILY") %>% 
  as.tibble()

write_csv(spdata_normalized, 
          here::here("data/rpasfield_alcontar_species_coverage.csv"))

                