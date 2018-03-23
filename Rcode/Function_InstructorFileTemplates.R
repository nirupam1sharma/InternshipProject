#################################################################################################################
### Purpose: R program to build the instructors import file
### Author: Nirupam Sharma
### Date: 03/15/2018
### Version: v01
#################################################################################################################
InstructorTemplate <- function(input_data)
{
  # The input in the function is the instructor file
  # We begin with changing the names of the columns
  colnames(input_data)[colnames(input_data)=="Username Instructor"] <- "UsernameInstructor"
  colnames(input_data)[colnames(input_data)=="Instructor First Name"] <- "FirstName"
  colnames(input_data)[colnames(input_data)=="Instructor Last Name"] <- "LastName"
  colnames(input_data)[colnames(input_data)=="Subject Code"] <- "SubjectCode"
  colnames(input_data)[colnames(input_data)=="Catalog Number"] <- "CatalogNumber"
  colnames(input_data)[colnames(input_data)=="Class Section Code"] <- "ClassSectionCode"
  colnames(input_data)[colnames(input_data)=="Term Code"] <- "TermCode"
  colnames(input_data)[colnames(input_data)=="Business Email"] <- "Email"
  # we append @uc.edu to the UsernameInstructor column
  output_data <- within(input_data, PersonIdentifier <- paste(UsernameInstructor,
                                                              "@uc.edu",sep = ""))
  # we combine ClassSectionCode and termcode with sep as _
  output_data <- within(output_data, temp <- paste(ClassSectionCode,
                                                                TermCode,sep = "_"))
  # in the next code we combine Subjectcode, Catalog number and above output inference
  output_data <- within(output_data, SectionIdentifier <- paste(SubjectCode,CatalogNumber
                                                   ,temp,sep = ""))
  # assign new variable role as primary
  output_data$Role="Primary"
  # return all the needed columns
  return(output_data[,c("PersonIdentifier","SectionIdentifier","FirstName","LastName","Email","Role")])
}