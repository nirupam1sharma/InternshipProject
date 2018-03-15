#################################################################################################################
### Purpose: R code to install and load all the required packages
### Author: Nirupam Sharma
### Date: 03/14/2018
### Version: v01
#################################################################################################################

{
  if(!require("plyr")){
    install.packages("tidyverse")
    library(tidyverse)
  }
  detach(package:plyr) #remove it because it yields issues with tidyverse; however, still need to make sure it's installed for rbind.fill
  
  if(!require("tidyverse")){
    install.packages("tidyverse")
    library(tidyverse)
  }
  if(!require("RSQLite")){
    install.packages("RSQLite")
    library(RSQLite)
  }
  if(!require("sqldf")){
    install.packages("sqldf")
    library(sqldf)
  }     
  if(!require("dplyr")){
    install.packages("dplyr")
    library(dplyr)
  }
  if(!require("readxl")){
    install.packages("readxl")
    library(readxl)
  }
  if(!require("lubridate")){
    install.packages("lubridate")
    library(lubridate)
  }
}
