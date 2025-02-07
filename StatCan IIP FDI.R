#Project using data publicly available from StatCan
#Data set used: International investment position (IIP) FDI
#URL: https://www150.statcan.gc.ca/t1/tbl1/en/cv.action?pid=3610000801

#Import packages
library(tidyverse)
library(readr)
library(ggplot2)

#Read in .csv downloaded from Statistics Canada website using the readr package
FDI_Data <- read_csv("3610000801_databaseLoadingData.csv")

#Select only some columns needed
FDI_Data_clean <- FDI_Data %>% select(REF_DATE, `Canadian and foreign direct investment`, `Countries or regions`, VALUE)

#Transpose the `Canadian and foreign direct investment' column so FDIC (Foreign Direct Investment in Canada) and CDIA (Canadian Direct Investment Abroad) are both columns
FDI_trans_clean <- FDI_Data_clean %>% pivot_wider(names_from = `Canadian and foreign direct investment`, values_from = VALUE)

#Visualize Data using ggplot2 to show the trend of CDIA and FDIC over time


