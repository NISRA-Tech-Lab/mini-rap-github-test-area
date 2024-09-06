# uncomment these lines if you need to install packages first.

install.packages("plotly")
install.packages("knitr")

library(plotly)
library(knitr)

years <- c(2018, 2019, 2020, 2021, 2022, 2023, 2024)

students <- c(100, 100, 161, 157, 163, 451, 800)


df_fig1 <- data.frame(years, students)
