Objective
========================================================
This application is used to predict the prestige score of a person using:
- Average Income, in dollar
- Average education, in years

Multivariate linear regression model is used in the apps to perform the prediction. 
The predicted outcome is ploted in the diagram in red.


Data Description
========================================================
The Prestige data is obtain from car package. It has 102 rows and 6 columns.

The columns of interest in this project are as follow: 

- education: Average education in years
- income   : Average income in dollars
- prestige : Pineo-Porter prestige score for occupation

```{r, echo=FALSE}
library(car)
data(Prestige)
Prestige <- Prestige[ , c("education", "income", "prestige")]
row.names(Prestige) <- c(1:nrow(Prestige))
head(Prestige, n = 20)
```

External Directory
========================================================
- The application can be found in the following link:
https://nk5160.shinyapps.io/Prestige/

- All source code for this Course Project locates on the GitHub repo:
https://github.com/kelgin1105/Data-Product
