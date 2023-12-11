library(tidyverse)
library(ggplot2)
library(stringr)
library(readxl)

WorldPopulation <- read_excel("World_Population.xlsx", sheet = "World_Population", skip = 16) %>%
  filter(str_detect(Type, "Country/Area")) %>%
  select(`Region, subregion, country or area *`, matches("^\\d{4}$")) %>%
  pivot_longer(cols = -`Region, subregion, country or area *`, names_to = "Year", values_to = "Population") %>%
  filter(between(as.numeric(Year), 1950, 2020)) %>%
  mutate(Year = as.numeric(Year)) %>%
  rename(Country =`Region, subregion, country or area *`)

