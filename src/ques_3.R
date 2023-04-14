# getting required libraries for bootstrapping
library(boot)

#setting seed as 5432
set.seed(5432)

# number of samples to be created
num_samples <- 500

#number of observations considered 
sample_size <- 150

#Function to calculate mean, standard deviation, and percentile of sample
boot_samples <- boot(data$BloodPressure, function(data, idx) {
  mean_boot <- mean(data[idx])
  sd_boot <- sd(data[idx])
  perc_boot <- quantile(data[idx], probs=0.95)
  return(c(mean_boot, sd_boot, perc_boot))
}, R=num_samples, strata=data$Outcome, sim="ordinary")

#extracting bootstrap statistic values of the bootstrap sample
bootmean <- boot_samples$t[,1]
mean_bootmean <- mean(bootmean)

bootstdev <- boot_samples$t[,2]
mean_bootstdev <- mean(bootstdev)

bootquantile <- boot_samples$t[,3]
mean_bootquantile <- mean(bootquantile)

#calculating bootstrap statistic values of the population
mean_of_BPpop <- mean(data$BloodPressure)
sd_of_BPpop <- sd(data$BloodPressure)
quan_of_BPpop <- quantile(data$BloodPressure, probs=0.95)

#plotting barplots to compare
quan_compare1 <- c(Population_quantile=quan_of_BPpop,Sample_quantile=mean_bootquantile)
mean_compare <- c(Population_mean=mean_bp_pop,Sample_mean=mean_bootmean)
stdev_compare <- c(Population_stdev=sd_of_BPpop,Sample_stdev=mean_bootstdev)



barplot(quan_compare1, col = c("skyblue","pink"), space=1,
        main="Comparision of quantile at 95% of population and bootstrap sample of Blood Pressure",xlab="Group",ylab="quantile value")

barplot(mean_compare, col = c("blue","red"), space=1,
        main="Comparision of mean of population and bootstrap sample of Blood Pressure",xlab="Group",ylab="mean value")

barplot(stdev_compare, col = c("green","gold"), space=1,
        main="Comparision of standard deviation of population and bootstrap sample of Blood Pressure",xlab="Group",ylab="standard deviation value")