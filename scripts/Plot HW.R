# Script to read in and plot Housing Inventory 
# from the city of San Francisco
# Ricardo Gutierrez-Vallejo
# rgutierrezvallejo@dons.usfca.edu
# February 16, 2020

library("dplyr")
library("ggplot2")
library("readr")

#read in housing data sheet
Housing_Inventory <- read_csv(file = "data/Housing_Inventories_2005_to_2018.csv")

#select only Apartments built
Housing_Inventory %>%
  filter(PROP_USE == "APARTMENTS") %>%
  group_by(YEAR) %>%
  count() %>%
  arrange(desc(n))

Housing_Inventory %>%
  ggplot(aes(x = YEAR)) +
  geom_bar() +
  labs(y = "Housing Units") +
  labs(x = "Year") +
  ggtitle("Housing Units Built Per Year in SF")

ggsave("data/documentation/number_of_housing_units_per_year_SF.pdf")
