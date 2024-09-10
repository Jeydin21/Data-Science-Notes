# Ctrl + L clears console
# Load backpack dataset into R
backpack <- read.csv("../data/backpack.csv", header = TRUE)

# Attach the file so that we can address column names directly
# Without attaching, we would have to type
# something like mean(backpack$BackpackWeight)
attach(backpack)

# Calculate some summary statistics
mean(BackpackWeight)
median(BackpackWeight)

# R is case-sensitive!
var(BackpackWeight)
var(BackpackWeight)
sd(BackpackWeight)
sqrt(var(BackpackWeight))

# 5-number summary
summary(BackpackWeight)

# Visual Summaries
stem(BackpackWeight)
boxplot(BackpackWeight)
hist(BackpackWeight)

# Help function
help(hist)

# Adjust colors
hist(BackpackWeight, col = "deepskyblue")

# Adjust bins
hist(BackpackWeight, breaks = 12)
hist(BackpackWeight, breaks = 6)
hist(BackpackWeight, breaks = c(0, 10, 20, 30, 40))

# Multiple commands
hist(BackpackWeight, col = "blue", breaks = 12)

# Scatterplot of BackpackWeight to BodyWeight
# plot(x, y, main, xlab, ylab, xlim, ylim, axes)
# x is the data set whose values are the horizontal coordinates.
# y is the data set whose values are the vertical coordinates.
# main is the tile of the graph.
# xlab is the label in the horizontal axis.
# ylab is the label in the vertical axis.
plot(BodyWeight, BackpackWeight, main = "BackpackWeight to BodyWeight", xlab = "BodyWeight", ylab = "BackpackWeight", col = ifelse(backpack$Sex == "Female", "Red", "Blue"), pch = 18)

legend("topright", legend = c("Female", "Male"), col = c("red", "blue"), pch = 18)
