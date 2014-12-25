library(tidyr)

## untidy data
## the first problem is when you have column headers that are values, not variable names
grade <- c("A", "B", "C", "D", "E")
male <- c(1, 5, 5, 5, 7)
female <- c(5, 0, 2, 5, 4)
students <- data.frame(grade=grade, male=male, female=female)

## tidy data
## note the minus sign before grade, which says we want to gather all columns EXCEPT grade
gather(students, sex, count, -grade)

## the second messy data case we'll look at is when multiple variables are stored in one column
male_1 <-c(3, 6, 7, 4, 1)
female_1 <- c(4, 4, 4, 0, 1)
male_2 <- c(3, 3, 3, 8, 2)
female2 <- c(4, 5, 8, 1, 7)
students2 <- frame.data(grade=grade, male_1=male_1, female_1=female_1, male_2=male_2, female_2=female_2)

## tidy data
res <- gather(students2, sex_class, count, -grade)
separate(res, sex_class, c("sex", "class"))

## use chain
students2 %>%
  gather(sex_class, count, -grade) %>%
  separate(sex_class, c("sex", "class")) %>%
  print
  
## the third symptom of messy data is when variables are stored in both rows and columns
name <- rep(c("Sally", "Jeff", "Roger", "Karen", "Brian"), each=2)
test <-rep(c("midterm", "final"), 5)
class1 <- c("A", "C", "<NA>", "<NA>", "<NA>", "<NA>", "<NA>", "<NA>", "B", "B")
class2 <- c("<NA>", "<NA>", "D", "E", "C", "A", "<NA>", "<NA>", "<NA>", "<NA>")
class3 <- c("B", "C", "<NA>", "<NA>", "<NA>", "<NA>", "C", "C", "<NA>", "<NA>")
class4 <- c("<NA>", "<NA>", "A", "C", "<NA>", "<NA>", "A", "A", "<NA>", "<NA>")
class5 <- c("<NA>", "<NA>", "<NA>", "<NA>", "B", "A", "<NA>", "<NA>", "A", "C")
students3 <- data.frame(name=name, test=test, class1=class1, class2=class2, class3=class3, class4=class4, class5=class5)

## tidy data
students3 %>%
  gather(class, grade, class1:class5, na.rm = TRUE) %>%
  spread(test, grade) %>%
  ### Call to mutate() goes here %>%
  mutate(class=extract_numeric(class))%>%
  print
  
## The fourth messy data problem we'll look at occurs when multiple observational units are
## stored in the same table. students4 presents an example of this. Take a look at the data now.
id <- rep(c(168, 588, 710, 731, 908), each=2)
name <- rep(c("Brian", "Sally", "Jeff", "Roger", "Karen"), each=2)
sex <- rep(c("F", "M", "M", "F", "M"), each=2)
class <- c(1, 5, 1, 3, 2, 4, 2, 5, 3, 4)
midterm <- c("B", "A", "A", "B", "D", "A", "C", "B", "C", "A")
final <- c("B", "C", "C", "C", "E", "C", "A", "A", "C", "A")
students4 <- data.frame(id=id, name=name, sex=sex, class=class, midterm=midterm, final=final)

student_info <- students4 %>%
  select(id, name, sex) %>%
  ### Your code here %>%
  unique %>%
  print
  
gradebook <- students4 %>%
  ### Your code here %>%
  select(id, class, midterm, final) %>%
  print
  
## The fifth and final messy data scenario that we'll address is when a single observational
## unit is stored in multiple tables. It's the opposite of the fourth problem.
name <- c("Brian", "Roger", "Roger", "Karen")
class <- c(1, 2, 5, 4)
final <- c("B", "A", "A", "A")
passed <- data.frame(name=name, class=class, final=final)

name <- c("Brian", "Sally", "Sally", "Jeff", "Jeff", "Karen")
final <- c("C", "C", "C", "E", "C", "C")
class <- c(5, 1, 3, 2, 4, 3)
failed <- data.frame(name=name, class=class, final=final)

passed <- passed %>% mutate(status = "passed")
failed <- failed %>% mutate(status = "failed")
## join them together into a single unit
rbind_list(passed, failed)
