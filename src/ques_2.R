attach(sample_data)

#calculating sample quantile of 98%
sample_quantile<-quantile(BMI,c(.98))

attach(data)

#calculating population quartile of 98%
pop_quantile<-quantile(BMI,c(.98))

#creating matrix vector for population and sample qunatiles
quan_compare <- c(Population_quantile=pop_quantile,Sample_quantile=sample_quantile)

#plotting 
barplot(quan_compare, col = c("skyblue","pink"), space=1,
        main="Comparision of quantile at 98% of population`s and sample`s BMI",xlab="Group",ylab="quantile value")