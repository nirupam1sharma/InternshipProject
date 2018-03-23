#################################################################################################################
### Purpose: R program to build the courses import file
### Author: Nirupam Sharma
### Date: 03/14/2018
### Version: v01
#################################################################################################################
courseTemplate <- function(input_data)
{
  # we start by selecting all the necessary columns
  colnames(input_data) <- c("Subject","Number","Title","Credits"
           ,"Type","Description","CIPCode")
  # we define the new column OrgUnitIdentifier from col Subject
  input_data$OrgUnitIdentifier <- input_data$Subject
  # create new column course identifier from subject and number
  output_data <- within(input_data, CourseIdentifier <- paste(Subject,
                                                              Number,sep = ""))
  
  # return the necessary columns
  return(output_data[,c("CourseIdentifier","Subject","Number","Title","Credits",
                        "OrgUnitIdentifier","Type","Description","CIPCode")])
}
