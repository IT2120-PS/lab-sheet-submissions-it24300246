setwd("C:\\Users\\mashi\\OneDrive\\Desktop\\IT24300246")

data <- read.table("Exercise - LaptopsWeights.txt", header = TRUE)
# R converts "Weight(kg)" to "Weight.kg."
laptop_weights <- data$Weight.kg.

n_population <- length(laptop_weights)
population_mean <- mean(laptop_weights)
# Adjust R's sample sd to get the population sd
population_sd <- sd(laptop_weights) * sqrt((n_population - 1) / n_population)

print(paste("Population Mean:", population_mean))
print(paste("Population Standard Deviation:", population_sd))

samples <- c()
number_of_samples <- 25
sample_size <- 6

for (i in 1:number_of_samples) {
  s <- sample(laptop_weights, sample_size, replace = TRUE)
  samples <- cbind(samples, s)
}
colnames(samples) <- paste("Sample", 1:number_of_samples)

sample_means <- apply(samples, 2, mean)
sample_sds <- apply(samples, 2, sd)

print(sample_means)
print(sample_sds)

mean_of_sample_means <- mean(sample_means)
sd_of_sample_means <- sd(sample_means) # This is the Standard Error

print(paste("Mean of the 25 Sample Means:", mean_of_sample_means))
print(paste("Standard Deviation of the 25 Sample Means (Standard Error):", sd_of_sample_means))

# Compare with population parameters
theoretical_standard_error <- population_sd / sqrt(sample_size)

print(paste("Population Mean:", population_mean))
print(paste("Theoretical Standard Error (Population SD / sqrt(n)):", theoretical_standard_error))


