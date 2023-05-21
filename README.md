# Optiver-1
Data3888 group project --- Optiver1

We have two different innovations in this project and we create one shiny app for each innovation.
In the "Optiver1 copy.rmd" file, we write the code to create some graphs and tables.
We store the necessary graphs from innovation 1 into the file named "my_save1.rds" and store graphs and table values from innovation 2 into file named "my_save2.rds".

In the file "inno1.R", we recall the file "my_save1.rds" and the shiny app contains two select buttons and two corresponding generated graphs. In the file "inno2.R", we recall the file "my_save2.rds" and the shiny app contains one select button with a corresponding generated graph, a fixed graph and two numeric inputs and outputs.

To compile two shiny apps, we need to firstly run "Optiver1 copy.rmd" to generate "my_save1.rds" and "my_save2.rds". Base on these two files, we will be able to generate out shiny apps.

## Packages needed in file "Optiver1 copy.rmd": 
library(dplyr)
library(tidyr)
library(zoo)
library(e1071)
library(rugarch)
library(ggplot2)
library(randomForest)
library(Metricsreshape2)
## Packages needed in shiny apps
library(shiny)
library(shinythemes)
