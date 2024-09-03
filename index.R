backpack <- read.csv("backpack.csv", header = TRUE)
attach(backpack)

# Remove ratio column
back <- subset(backpack, select = -Ratio)
View(back)
head(backpack)
attach(back)
back[4, 2]
back[, 2]
back[2, ]
back[, 2] / 2.2
back$BodyMass <- BodyWeight / 2.2
View(back)