#################################################################################################################
### Purpose: R program to build the Sections import file
### Author: Nirupam Sharma
### Date: 03/15/2018
### Version: v01
#################################################################################################################
SectionTemplate <- function(input_data)
{
  # Rename the columns as per the requirement
  colnames(input_data)[colnames(input_data)=="Term Code"] <- "TermIdentifier"
  colnames(input_data)[colnames(input_data)=="Subject Code"] <- "Subject"
  colnames(input_data)[colnames(input_data)=="Catalog Number"] <- "CourseNumber"
  colnames(input_data)[colnames(input_data)=="Class Section Code"] <- "Number"
  colnames(input_data)[colnames(input_data)=="Session Begin Date"] <- "BeginDate"
  colnames(input_data)[colnames(input_data)=="Session End Date"] <- "EndDate"  
  colnames(input_data)[colnames(input_data)=="Course"] <- "Title"
  colnames(input_data)[colnames(input_data)=="Academic Progress Units"] <- "Credits"
  colnames(input_data)[colnames(input_data)=="Instruction Mode"] <- "DeliveryMode"
  input_data$BeginDate <- format_iso_8601(ymd(input_data$BeginDate))
  input_data$EndDate <- format_iso_8601(ymd(input_data$EndDate))
  
  # create a new column as Org unit identifier from column subject 
  input_data$OrgUnitIdentifier <- input_data$Subject
  # combine subject and coursenumber to form another column course identifier
  output_data <- within(input_data, CourseIdentifier <- paste(Subject,
                                                              CourseNumber,sep = ""))
  # we create new variable known as temp col to be used as combination
  # of subject and course number
  output_data <- within(output_data, tempcol <- paste(Subject,
                                                      CourseNumber,Number,sep = ""))
  # create a new column section identifier from temp col and term identifier
  output_data <- within(output_data, SectionIdentifier <- paste(tempcol,
                                                                TermIdentifier,sep = "_"))
  # define colnm description with none value followed by returning final variables
  output_data$Description <- ""
  output_data$DeliveryMode <- ifelse(output_data$DeliveryMode=="Partially DL 26-74%",
         "Hybrid",ifelse(output_data$DeliveryMode=="In Person","Face2Face","Online"))
  colnn <- c("SectionIdentifier","TermIdentifier","CourseIdentifier","Subject"  
             ,"CourseNumber","Number","BeginDate","EndDate"  
             ,"OrgUnitIdentifier","Title","Credits","DeliveryMode","Location","Description") 
  return(output_data[,colnn])
}