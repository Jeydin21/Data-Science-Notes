# load “Amyloid" file
amyloid <- read.csv(file.choose(), header = TRUE)
attach(amyloid)
View(amyloid)

# produce cooperative boxplots which show the Abeta values by Group
boxplot(Abeta ~ Group, data = amyloid, main = "Abeta Values by Group", xlab = "Group", ylab = "Abeta Values", col = "lightblue") # nolint

# produce cooperative dotplots which show the Abeta values by Group
stripchart(Abeta ~ Group, data = amyloid, main = "Abeta Values by Group", xlab = "Group", ylab = "Abeta Values", col = "lightblue") # nolint

# Create a table for the n, mean, and sd for Abeta values by Group
tapply(Abeta, Group, function(x) c(n = length(x), mean = mean(x), sd = sd(x)))

# round table output to 2 decimal places
tapply(Abeta, Group, function(x) c(n = length(x), mean = round(mean(x), 2), sd = round(sd(x), 2))) # nolint

# Run a t-test to see if there is a significant difference in Abeta values by Group # nolint
t.test(Abeta ~ Group, data = amyloid)

# Give a one to two sentence interpretation of the normal probability plots
# Since the p value of 0.017 is less than 0.05, we reject Ho and we have convincing
# evidence that the true difference in means between group mAD and group NCI is not equal to 0

# Create a new column in the dataset for Residuals (Difference from observed values and Group mean) # nolint
amyloid$residuals <- residuals(lm(Abeta ~ Group, data = amyloid))

# Check the Residuals with normal probability plots
qqnorm(amyloid$residuals, ylab = "Amyloid residuals by Group")
qqline(amyloid$residuals)


# Find the Effect Size
# Calculate the mean and standard deviation for each group
mean_nci <- mean(amyloid$Abeta[amyloid$Group == "NCI"])
mean_mad <- mean(amyloid$Abeta[amyloid$Group == "mAD"])
sd_nci <- sd(amyloid$Abeta[amyloid$Group == "NCI"])
sd_mad <- sd(amyloid$Abeta[amyloid$Group == "mAD"])

# Calculate the sample sizes for each group
n_nci <- length(amyloid$Abeta[amyloid$Group == "NCI"])
n_mad <- length(amyloid$Abeta[amyloid$Group == "mAD"])

# Compute the pooled standard deviation
pooled_sd <- sqrt(((n_nci - 1) * sd_nci^2 + (n_mad - 1) * sd_mad^2) / (n_nci + n_mad - 2))

# Calculate Cohen's d
cohen_d <- (mean_nci - mean_mad) / pooled_sd

# Print the effect size
cohen_d
