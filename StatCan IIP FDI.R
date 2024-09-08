#Project using data publicly available from StatCan
#Data set used: International investment position (IIP) FDI
#URL: https://www150.statcan.gc.ca/t1/tbl1/en/cv.action?pid=3610000801

#Read in .csv downloaded from StatCan website using the readr package
library(readr)
FDI_Data <- read_csv("R portfolio/R-Projects/3610000801_databaseLoadingData.csv")

#Import tidyverse packages, the main ones used in this program will be dplyr and tidyr
library(tidyverse)

#Select only some columns needed
FDI <- FDI_Data %>% select(REF_DATE, `Canadian and foreign direct investment`, `Countries or regions`, VALUE)

#Transpose the `Canadian and foreign direct investment' column so FDIC (Foreign Direct Investment in Canada) and CDIA (Canadian Direct Investment Abroad) are both columns
FDI_trans <- FDI %>% pivot_wider(names_from = `Canadian and foreign direct investment`, values_from = VALUE)

#At this point the data is very readable and simplified, to do some analysis I will sue ggplot2

library(ggplot2)
