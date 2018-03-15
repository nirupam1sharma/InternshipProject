#################################################################################################################
### Purpose: R program to build the instructors import file
### Author: Nirupam Sharma
### Date: 03/15/2018
### Version: v01
#################################################################################################################
InstructorTemplate <- function(input_data)
{
  colnames(input_data)[colnames(input_data)=="Username Instructor"] <- "UsernameInstructor"
  colnames(input_data)[colnames(input_data)=="Instructor First Name"] <- "FirstName"
  colnames(input_data)[colnames(input_data)=="Instructor Last Name"] <- "LastName"
  colnames(input_data)[colnames(input_data)=="Subject Code"] <- "SubjectCode"
  colnames(input_data)[colnames(input_data)=="Catalog Number"] <- "CatalogNumber"
  colnames(input_data)[colnames(input_data)=="Class Section Code"] <- "ClassSectionCode"
  colnames(input_data)[colnames(input_data)=="Term Code"] <- "TermCode"
  colnames(input_data)[colnames(input_data)=="Business Email"] <- "Email"
  output_data <- within(input_data, PersonIdentifier <- paste(UsernameInstructor,
                                                              "@uc.edu",sep = ""))
  output_data <- within(output_data, temp <- paste(ClassSectionCode,
                                                                TermCode,sep = "_"))
  output_data <- within(output_data, SectionIdentifier <- paste(SubjectCode,CatalogNumber
                                                   ,temp,sep = ""))
  output_data$Role="Primary"
  return(output_data[,c("PersonIdentifier","SectionIdentifier","FirstName","LastName","Email","Role")])
}