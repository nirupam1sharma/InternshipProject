#################################################################################################################
### Purpose: R program to build the core Data import file
### Author: Nirupam Sharma
### Date: 03/15/2018
### Version: v01
#################################################################################################################
EnrollmentsTemplate <- function(input_data)
{
  colnames(input_data)[colnames(input_data)=="Enrollment Status"] <- "Status"
  colnames(input_data)[colnames(input_data)=="First Name"] <- "FirstName"
  colnames(input_data)[colnames(input_data)=="Last Name"] <- "LastName"
  colnames(input_data)[colnames(input_data)=="Subject Code"] <- "SubjectCode"
  colnames(input_data)[colnames(input_data)=="Catalog Number"] <- "CatalogNumber"
  colnames(input_data)[colnames(input_data)=="Class Section Code"] <- "ClassSectionCode"
  colnames(input_data)[colnames(input_data)=="Term Code"] <- "TermCode"
  colnames(input_data)[colnames(input_data)=="Academic Progress Units"] <- "Credits"
  colnames(input_data)[colnames(input_data)=="Best Available Student Email Address"] <- "Email"
  colnames(input_data)[colnames(input_data)=="Session Begin Date"] <- "BeginDate"
  colnames(input_data)[colnames(input_data)=="Session End Date"] <- "EndDate"
  colnames(input_data)[colnames(input_data)=="Enrollment Status Date"] <- "RegisteredDate"
  colnames(input_data)[colnames(input_data)=="Enrollment Status Description"] <- "Status"
  output_data <- within(input_data, PersonIdentifier <- paste(Username,
                                                              "@uc.edu",sep = ""))
  output_data <- within(output_data, temp <- paste(ClassSectionCode,
                                                   TermCode,sep = "_"))
  output_data <- within(output_data, SectionIdentifier <- paste(SubjectCode,CatalogNumber
                                                                ,temp,sep = ""))
  output_data$GradeOption=""
  output_data$InitialCourseGrade=""
  output_data$FinalCourseGrade=""
  output_data$StatusChangeDate=""
  return(output_data[,c("PersonIdentifier","SectionIdentifier","Status","FirstName","LastName","Email"
                        ,"Credits","GradeOption","BeginDate","RegisteredDate","EndDate","InitialCourseGrade","StatusChangeDate","FinalCourseGrade")])
}