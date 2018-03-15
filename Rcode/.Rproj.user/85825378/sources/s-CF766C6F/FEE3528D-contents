#################################################################################################################
### Purpose: R program to build the Sections import file
### Author: Nirupam Sharma
### Date: 03/15/2018
### Version: v01
#################################################################################################################
courseTemplate <- function(input_data)
{
  colnames(input_data) <- c("Subject","Number","Title","Credits"
                            ,"Type","Description","CIPCode")
  input_data$OrgUnitIdentifier <- input_data$Subject
  output_data <- within(input_data, CourseIdentifier <- paste(Subject,
                                                              Number,sep = ""))
  return(output_data[,c("CourseIdentifier","Subject","Number","Title","Credits",
                        "OrgUnitIdentifier","Type","Description","CIPCode")])
}
