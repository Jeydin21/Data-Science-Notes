# R Basics Quiz 09/06/24
# Directions: In your R Script window, copy and paste the items below.
# Under each item, write the appropriate code.
# Copy and paste the contents of your script window into a word file.
# Submit.


# Load and attach the BirdNest data
birdnest <- read.csv("BirdNest.csv", header = TRUE)
attach(birdnest)
# Look at the entry in the 28 th row, 4 th column
birdnest[28, 4]
# Look at all entries for the 28 th row
birdnest[28, ]
# Look at all entries for the 4 th column
birdnest[, 4]
# Create a new column called “TotalCare” which adds the entries for Incubate and Nestling # nolint
birdnest$TotalCare <- birdnest$Incubate + birdnest$Nestling
# Sort the dataset according to the TotalCare column in ascending order
birdnest <- birdnest[order(birdnest$TotalCare), ]

# Find the mean of the TotalCare column
mean(birdnest$TotalCare)
# Find the median of the TotalCare column
median(birdnest$TotalCare)
# Find the standard deviation of the TotalCare column
sd(birdnest$TotalCare)
# Find the variance of the TotalCare column
var(birdnest$TotalCare)
# Find the 5-number summary of the TotalCare column
summary(birdnest$TotalCare)
# Create a stemplot for TotalCare
stem(birdnest$TotalCare)
# Create a boxplot for TotalCare
boxplot(birdnest$TotalCare)
# Create a histogram for TotalCare
hist(birdnest$TotalCare)
# Adjust histogram so that there are 5 – 8 bins
hist(birdnest$TotalCare, breaks = 6)
# Create a scatterplot for Length, predicted by NoEggs
plot(NoEggs, Length, xlab = "NoEggs", ylab = "Length", col = ifelse(birdnest$Color == 1, "Red", "Black"), pch = 20)
# Add a title to the scatterplot
title(main = "Scatterplot of Length Predicted by NoEggs")
# Assign different colors in the scatterplot according to the condition of the variable “Color”
# Add a legend to distinguish the colors
legend("topright", legend = c("Colored", "Uncolored"), col = c("red", "black"), pch = 15)