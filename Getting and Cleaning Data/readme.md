# Course Project for Getting and Cleaning Data

Included within this readme file are some details on how the script work
Just download the script into work directory and unpack your data into your work directory as well.

Load the code into RStudio and click the source button at the top-right hand corner of the coding panel, the code should hopefully run fine

## Running the run_analysis.R function

There are plenty of comments within the code which allows you as the reader to easily follow it but can always refer to this readme file to get the sense of what the code is doing.

1. The code will first check the presence of the Samsung data within your workspace. Just unpack the folder into your working directory and the code should work just fine. It is meant to fail if the data is unavailable

2. The second portion of the code would involve the actual reading of all the required datasets which would include
..* features.txt
..* activity_labels.txt
..* X_test.txt
..* y_test.txt
..* subject_test.txt
..* X_train.txt
..* y_train.txt
..* subject_train.txt

3. The third portion of the code involves converting some of the obtained data into vectors for easier processing. Some functions within R would prefer to work with vectors rather than data.frames and this would make it easier to work with

4. Next portion would involve turning the numeric symbols of y_test and y_train to their descriptive versions by using the factor functionality in R

5. The fifth portion of the code would involve combining all of the above partially processed data into one huge data table. It is believed to have 10000+ rows and at least 560+ columns.

6. The sixth portion of the code involves building up the necessary filters for all the features that are requested which are just mean and standard deviation. This is done by regex functions within R, namely the grepl function

7. Finally, the filters are applied and you will obtained your dataset.