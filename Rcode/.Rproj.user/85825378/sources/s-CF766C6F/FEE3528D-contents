#################################################################################################################
### Purpose: R program to build the Sections import file
### Author: Nirupam Sharma
### Date: 03/15/2018
### Version: v01
#################################################################################################################
SectionTemplate <- function(input_data)
{
  colnames(input_data)[colnames(input_data)=="Term Code"] <- "TermIdentifier"
  colnames(input_data)[colnames(input_data)=="Subject Code"] <- "Subject"
  colnames(input_data)[colnames(input_data)=="Catalog Number"] <- "CourseNumber"
  colnames(input_data)[colnames(input_data)=="Class Section Code"] <- "Number"
  colnames(input_data)[colnames(input_data)=="Session Begin Date"] <- "BeginDate"
  colnames(input_data)[colnames(input_data)=="Session End Date"] <- "EndDate"  
  colnames(input_data)[colnames(input_data)=="Course"] <- "Title"
  colnames(input_data)[colnames(input_data)=="Academic Progress Units"] <- "Credits"
  colnames(input_data)[colnames(input_data)=="Instruction Mode"] <- "DeliveryMode"
  
  
  input_data$OrgUnitIdentifier <- input_data$Subject
  output_data <- within(input_data, CourseIdentifier <- paste(Subject,
                                                              CourseNumber,sep = ""))
  output_data <- within(output_data, tempcol <- paste(Subject,
                                                      CourseNumber,Number,sep = ""))
  output_data <- within(output_data, SectionIdentifier <- paste(tempcol,
                                                                TermIdentifier,sep = "_"))
  output_data$Description <- ""
  return(output_data[,c(16,2,14,3,4,5,6,7,13,8,9,10,11,17)])
}