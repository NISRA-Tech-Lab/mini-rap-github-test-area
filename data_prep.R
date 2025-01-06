# uncomment these lines if you need to install packages first.



library(plotly)
library(knitr)


years <- c(2018, 2019, 2020, 2021, 2022, 2023, 2024, 2025)
students <- c(145, 157, 161, 157, 163, 401, 240, 462)
diff <- c(7, 12, 4, -4, 6, 238, -161, 33)

df_fig1 <- data.frame(years, students, diff)
