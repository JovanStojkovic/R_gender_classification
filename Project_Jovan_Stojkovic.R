### Created by Jovan Stojkovic on September 07, 2023

install.packages(c('neuralnet','keras','tensorflow'),dependencies = T)

install.packages("readxl")

library(dplyr)
library(neuralnet)
library(readxl)

# Path to the dataset
file_path <- "/Users/jovanstojkovic/Desktop/Masinsko ucenje Kupusinac/Projekat/gender_classification.xlsx"

# Loading the data
my_data <- read_excel("/Users/jovanstojkovic/Desktop/ADA master/Masinsko ucenje Kupusinac/Projekat/gender_classification.xlsx")

# Basic statistics of the dataset
summary(my_data)

# Checking the class of the 'gender' column before conversion
class(my_data$gender)

# Converting 'gender' to a factor
my_data <- my_data %>%
  mutate(gender = as.factor(gender))

# Checking the class of 'gender' after conversion
class(my_data$gender)

# Splitting the data into training and test sets
set.seed(113)
data_rows <- floor(0.80 * nrow(my_data))
train_indices <- sample(c(1:nrow(my_data)), data_rows)
train_data <- my_data[train_indices,]
test_data <- my_data[-train_indices,]

# Training the neural network
model <- neuralnet(
  gender ~ long_hair + forehead_width_cm + forehead_height_cm + nose_wide + nose_long + lips_thin + distance_nose_to_lip_long,
  data = train_data,
  hidden = c(4, 2),
  linear.output = FALSE
)

# Visual representation / Architecture of the neural network
plot(model,rep = "best")

# Model evaluation
pred <- predict(model, test_data)
labels <- c("Male", "Female")
prediction_label <- data.frame(max.col(pred)) %>%
  mutate(pred=labels[max.col.pred.]) %>%
  select(2) %>%
  unlist()
table(test_data$gender, prediction_label)

# Calculating model accuracy
check = as.numeric(test_data$gender) == max.col(pred)
accuracy = (sum(check)/nrow(test_data))*100
print(accuracy)

