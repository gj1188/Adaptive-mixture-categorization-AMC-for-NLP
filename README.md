# Adaptive-mixture-categorization-AMC-for-NLP
This R package implements the Adaptive Mixture Categorization (AMC) algorithm, a statistical method for optimally categorizing continuous variables by maximizing between-group variance (F-statistic). Designed for biomedical and clinical data analysis, AMC dynamically determines optimal thresholds to transform continuous data into interpretable categorical groups while preserving statistical significance.

Core Function
amc(data)
Categorizes continuous variables in a data frame into discrete groups using iterative ANOVA-based threshold optimization.

Arguments:

data: A data frame where each column is a continuous variable to categorize.

Returns:
A list containing:

output: Categorized data (factors)

cutoff: Optimal thresholds for each variable

group: Number of categories per variable

F: Maximized F-statistics at each iteration
library(yourpackage)

# Preprocess NLP variables with AMC before regression
nlp_categories <- amc(nlp_data)$output
glm(suicide_risk ~ ., data = nlp_categories)

References

Li S., Levis M., DiMambro M., Wu W., Levy J., Shiner B., Gui J. (2025) Preprocessing of natural language process variables using a data-driven method improves the association with suicide risk in a large veterans affairs population. Computers in Biology and Medicine 189:109939.
