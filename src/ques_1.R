# loading cleaned data
data <- read.csv("diabetes.csv")

#setting seed to 5432
set.seed(5432)

#select 25 observations of the population
sample_data <- head(data,25)
attach(sample_data)

#calculating sample mean of Glucose
sample_mean<-mean(Glucose, data=sample_data)

#calculating sample max of Glucose
sample_max<-max(Glucose)

attach(data)

#calculating population max of Glucose
pop_mean<-mean(Glucose, data=data)

#calculating population max of Glucose
pop_max<-max(Glucose)

#creating matrix vector for mean and max
mean_compare <- c(Population_mean=pop_mean,Sample_mean=sample_mean)
max_compare <- c(Population_max=pop_max,Sample_max=sample_max)

#plotting for mean between population and sample
barplot(mean_compare, 
        col = c("skyblue","pink"), space=1,
        main="Comparision of mean of population`s and sample`s Glucose",xlab="Group",ylab="mean value")

#plotting for mean between population and sample
barplot(max_compare, 
        col = c("green","gold"), space=1,
        main="Comparision of mean of population`s and sample`s Glucose",xlab="Group",ylab="max value")