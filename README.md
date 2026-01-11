# Tracking-User-Engagement
Tracking User Engagement with SQL, Excel, and Python
Comparing and analyzing user engagement between Q2 2021 and Q2 2022.

# Project Overview
* Used SQL to prepare the data.
* Used Python to preprocess the data and make predictions.
* Used Excel for data analysis and hypothesis testing.

# Project Files and Resources
* The database for this project can be found on 365 Data Science at https://learn.365datascience.com/projects/tracking-user-engagement-with-sql-excel-and-python/data-preparation-with-sql-creating-a-view-task/.

# Data Preparation with SQL
* Dropped, if existed, and created the purchases_info view to show purhcase start/end dates and flag whether a student had an active paid subscription in Q2 2021 and/or 2022.
* Created a query to show students who watched videos in Q2 2021 or Q2 2022 and had an active subscription in that time period.
* Showed total certificates issued to each student with the total minutes watched.

# Data Preprocessing with Python
* Read .csv files generated from the SQL queries and plot the distributions.
* Removed outliers (values greater than the 99th percentile of minutes watched) and re-plotted the data.

# Data Anlysis with Excel
* Loaded all 4 .csv files and found the mean and median values.
* Calculated the confidence intervals for Q2 2021 and 2022 non-paying and paying students.
* Performed hypothesis testing with a T-test.
    * For non-paying students, performed a two-sample t-test assuming equal variances.
    * For paying students, performed a two-sample t-test assuming unequal variances.
* Loaded the minutes-and-certificates.csv file and calculated the correlation coefficients.

# Dependencies and Probabilities with Python
* Calculated the probabilities that a student watched a video in Q2 2021, Q2 2022, and both years.
* Tested for independence using P(A union B) = P(A) * P(B)
* Calculated the probability that a student watched a video in Q2 2021, given that they watched a video in Q2 2022.

# Data Prediction with Python
* Created a Linear Regression.
* Found the linear equation that explains the behavior of the relationship.
* Interpretted the R-squared value.
