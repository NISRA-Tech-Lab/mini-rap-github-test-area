# uncomment these lines if you need to install packages first.
# install.packages("tidyverse")
# install.packages("plotly")

library(tidyverse)
library(plotly)

years <- c(2018, 2019, 2020, 2021, 2022)
students <- c(145, 157, 161, 126, 163)

df_fig1 <- data.frame(years, students)
