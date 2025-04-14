# Gender Classification with Neural Network in R

This project uses a neural network implemented in R to classify gender based on facial features such as hair length, forehead width, and nose shape.

## Files Included
- `gender_classification.R` — R script for model training and evaluation
- `gender_classification_report.pdf` — PDF report with project explanation and results
- `gender_classification.xlsx` — Dataset with facial features and gender labels

## Accuracy
Model accuracy on the test set: **97.5%**

## Requirements
R packages used:
- `neuralnet`
- `keras`
- `tensorflow`
- `dplyr`
- `readxl`

## Important Note on File Paths

The current code assumes that the dataset is stored in the following path on the author's local machine:

/Users/jovanstojkovic/Desktop/Masinsko ucenje Kupusinac/Projekat/gender_classification.xlsx


Since file paths are specific to the local machine, you will need to modify the path in the code to match the location of the dataset on your machine.

To load the dataset, change the following line in the code:

```r
file_path <- "/path/to/your/dataset/gender_classification.xlsx"
my_data <- read_excel("/path/to/your/dataset/gender_classification.xlsx")
```
Make sure the dataset file is located in the specified path, or update the path accordingly.

Alternatively, you can use a relative file path if you want to keep the dataset and the code together in the same directory:
```r
my_data <- read_excel("gender_classification.xlsx")
