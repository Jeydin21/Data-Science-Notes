# Backpack 1
backpack <- read.csv("data/backpack.csv", header = TRUE)

# At this point, you should see a flashing icon on your taskbar.
# Select the icon and go to the file that you wish to upload
# Once loaded, you will see the backpack dataframe listed in your Environment.
# attach() makes it such that you don’t have to reference that dataset
# everytime you want to reference a column.
attach(backpack)

# Remove "Ratio" column
backpack <- subset(backpack, select = -Ratio)

# Remember that R is case sensitive!
View(backpack)

# You may have to click the tab back to your Interface code
# Let’s run through a handful of useful functions
# Take note of what each does
print(backpack)
force(backpack)
head(backpack)

# Look up a value by [row, column]
backpack[4, 2]

# See values for an entire column
backpack[, 2]

# Divide all values by 2.2
backpack[, 2] / 2.2

# See bodyweight as bodymass, measured in kg
backpack$BodyMass <- BodyWeight / 2.2

# Rearrange dataset so theat BodyMass is 3rd column
backpack <- backpack[, c(1, 2, 9, 3, 4, 5, 6, 7, 8)]

# You could also accomplish this with column names instead of numbers
# Make a new column: BackpackMass
# Make BackpackMass the 2nd column

# Rename column
names(backpack)[9] <- "Credits"

# Arrange dataset according to ascending BackpackWeight
# First, look at sort
sort(BackpackWeight, decreasing = TRUE)

# Find row rank according to Backpackweight, then Bodyweight
rank <- order(BackpackWeight, BodyWeight)
backpack <- backpack[rank, rank]
