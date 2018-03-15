#################################################################################################################
### Purpose: R code for data tranformation. This is the file to be called first
### Author: Nirupam Sharma
### Date: 03/13/2018
### Version: v01
#################################################################################################################

# clear environment
rm(list=ls())
system.time({
  # set work directory
  Working_Directory <- choose.dir(caption = "Choose the 
                                  location that contains the project")   
  setwd(Working_Directory)   
  
  # loading functions 
  source(paste0(Working_Directory,"\\Rcode\\", "installPackages.R"))
  source(paste0(Working_Directory,"\\Rcode\\", "Function_CourseFileTemplates.R"))
  outputDirectory <- paste0(Working_Directory,"\\Output\\")
  print("Choice determination process begins")
  userchoice <- readline("Choose which file do you want to transform:
                         1. Course File
                         2. Section File")
  print(userchoice)
  
  #### The following section defines the calling of 
  #### functions based on user choices
  
  
  # Course Import
  if(userchoice=="1"){
  # input file
  print("Performing conversion for Course imports")
  data_location <- file.choose(new = T)
  df <- read_excel(data_location)
  # performing manipulation
  system.time({
    outputfile <- courseTemplate(df)
  })
  # output folder
  outputFilename <- paste("2175 Courses Import ",today(),".csv",sep="")
  tempchange <- getwd()
  setwd(outputDirectory)
  outputfile <- unique(outputfile)
  write.csv(outputfile,file = outputFilename,row.names = F)
  setwd(tempchange)
  }
  
  # Sections file
  else if(userchoice=="2"){
    # input file
    print("Performing conversion for Section imports")
    data_location <- file.choose(new = T)
    df <- read_excel(data_location)
    # performing manipulation
    system.time({
      outputfile <- courseTemplate(df)
    })
    # output folder
    outputFilename <- paste("2175 Courses Import ",today(),".csv",sep="")
    tempchange <- getwd()
    setwd(outputDirectory)
    outputfile <- unique(outputfile)
    write.csv(outputfile,file = outputFilename,row.names = F)
    setwd(tempchange)
  }
})
