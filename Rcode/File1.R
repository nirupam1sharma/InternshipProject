#################################################################################
### Purpose: R code for data tranformation. This is the file to be called first
### Author: Nirupam Sharma
### Date: 03/16/2018
### Version: v01
#################################################################################

# clear environment
# the following lines of code will clear the memory
rm(list=ls())

# The system.time() function has been called to check how long the program takes
system.time({
  # set work directory to location that contains Data, Rcode and output folder
  Working_Directory <- choose.dir(caption = "Choose the 
                                  location that contains the project")   
  setwd(Working_Directory)   
  
  # loading functions 
  # The first file is used to install all the packages required for the project
  source(paste0(Working_Directory,"\\Rcode\\", "installPackages.R"))
  
  # The next file will load the function to transform the course query file
  source(paste0(Working_Directory,"\\Rcode\\", "Function_CourseFileTemplates.R"))
  
  # The next file will load the function to transform the section query file
  source(paste0(Working_Directory,"\\Rcode\\", "Function_SectionFileTemplates.R"))
  
  # The next file will load the function to transform the Instructor query file
  source(paste0(Working_Directory,"\\Rcode\\", "Function_InstructorFileTemplates.R"))
  
  # The next file will load the function to transform the Enrollments query file
  source(paste0(Working_Directory,"\\Rcode\\", "Function_EnrollmentsTemplates.R"))
  
  # We set the working directory to the outputs folder to save converted files
  outputDirectory <- paste0(Working_Directory,"\\Output\\")
  
  # User will be asked to choose which file is to converted next
  print("Choice determination process begins")
  userchoice <- readline("Choose which file do you want to transform:
                         1. Course File
                         2. Section File
                         3. Instructor File
                         4. Enrollments File")
  print(userchoice)# Enrollments
  #### The following section defines the calling of 
  #### functions based on user choices
  # Course Import
  if(userchoice=="1"){# This statement compares our choice we entered with 1
    # If the condition is true then these statements are executed
    # input file
    print("Performing conversion for Course imports")
    print("Kindly select the course import file to process")
    Sys.sleep(5)# next Command is used to store the location of the input file 
    data_location <- file.choose(new = T)
    # Next statement reads the excel file stored in data_location
    inputfile <- read_excel(data_location) 
    # performing manipulation
    system.time({
    # Now we call the transform function courseTemplate to convert the input file
    # and then stores the result in output file
      outputfile <- courseTemplate(inputfile)
    })
    # Now we create the name of the file using todays date with proper extension
    # output folder
    outputFilename <- paste("2175 Courses Import ",today(),".csv",sep="")
    # We store the current working directory in temporary variable to come back
    tempchange <- getwd()
    setwd(outputDirectory)  # set the output folder as current working space
    outputfile <- unique(outputfile)
    ##     The above command gets the unique rows from the data
    # We store the resultant file in csv in the output position
    write.csv(outputfile,file = outputFilename,row.names = F)
    setwd(tempchange)
    #come back to the previously working project folder location
  }
  # Sections file
  else if(userchoice=="2"){# This statement compares our choice we entered with 2
    # If the condition is true then these statements are executed
    # input file
    print("Performing conversion for Section imports")
    print("Kindly select the section import file to process")
    Sys.sleep(5)# next Command is used to store the location of the input file
    data_location <- file.choose(new = T)
    # Next statement reads the excel file stored in data_location
    inputfile <- read_excel(data_location)
    # performing manipulation
    system.time({
      # Now we call the transform function courseTemplate to convert the input file
      # and then stores the result in output file
      outputfile <- SectionTemplate(inputfile)
    })
    # Now we create the name of the file using todays date with proper extension
    # output folder
    outputFilename <- paste("2175 Sections Import ",today(),".csv",sep="")
    # We store the current working directory in temporary variable to come back
    tempchange <- getwd()
    setwd(outputDirectory)
    outputfile <- unique(outputfile)
    ##     The above command gets the unique rows from the data
    # We store the resultant file in csv in the output position
    write.csv(outputfile,file = outputFilename,row.names = F)
    setwd(tempchange)
    #come back to the previously working project folder location
  }
  # Instructor file
  else if(userchoice=="3"){# This statement compares our choice we entered with 3
    # If the condition is true then these statements are executed
    # input file
    print("Performing conversion for Instructor imports")
    print("Kindly select the instructor import file to process")
    Sys.sleep(5)# next Command is used to store the location of the input file
    data_location <- file.choose(new = T)
    # Next statement reads the excel file stored in data_location
    inputfile <- read_excel(data_location)
    # performing manipulation
    system.time({
      # Now we call the transform function courseTemplate to convert the input file
      # and then stores the result in output file
      outputfile <- InstructorTemplate(inputfile)
    })
    # Now we create the name of the file using todays date with proper extension
    # output folder
    outputFilename <- paste("2175 Instructor Import ",today(),".csv",sep="")
    # We store the current working directory in temporary variable to come back
    tempchange <- getwd()
    setwd(outputDirectory)
    ##     The above command gets the unique rows from the data
    # We store the resultant file in csv in the output position
    outputfile <- unique(outputfile)
    write.csv(outputfile,file = outputFilename,row.names = F)
    setwd(tempchange)
    #come back to the previously working project folder location
  }
  # Enrollments File
  else if(userchoice=="4"){# This statement compares our choice we entered with 4
    # If the condition is true these statements are executed
    # input file
    print("Performing conversion for Enrollments imports")
    print("Kindly select the enrollment import file to process")
    Sys.sleep(5)# next Command is used to store the location of the input file
    data_location <- file.choose(new = T)
    # Next statement reads the excel file stored in data_location
    inputfile <- read_excel(data_location)
    # performing manipulation
    system.time({
      # Now we call the transform function courseTemplate to convert the input file
      # and then stores the result in output file
      outputfile <- EnrollmentsTemplate(inputfile)
    })
    # Now we create the name of the file using todays date with proper extension
    # output folder
    outputFilename <- paste("2175 Enrollments Import ",today(),".csv",sep="")
    # We store the current working directory in temporary variable to come back
    tempchange <- getwd()
    setwd(outputDirectory)
    ##     The above command gets the unique rows from the data
    # We store the resultant file in csv in the output position
    outputfile <- unique(outputfile)
    write.csv(outputfile,file = outputFilename,row.names = F)
    setwd(tempchange)
    #come back to the previously working project folder location
  }
})