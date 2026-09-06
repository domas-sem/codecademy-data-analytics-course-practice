# Python Tasks and Practice Projects

This folder contains Python exercises and small projects completed as part of my Codecademy data analytics and data science coursework. The projects focus on developing core Python skills used in data analysis: data structures, data cleaning, file handling, iteration, basic statistical summaries, and introductory modeling logic.

> These are learning projects designed to demonstrate foundational programming concepts. Each project includes practical tasks that build toward common data-analysis workflows.

## Projects

| File | Topic | Key skills practiced |
|---|---|---|
| `medical_insurance_dictionary_project.py` | Working with structured medical-insurance records | Dictionaries, nested dictionaries, loops, `zip()`, comprehensions, summary metrics |
| `medical_insurance_strings_project.py` | Cleaning and restructuring raw medical-insurance text | String methods, splitting, formatting, list operations, record counts, average BMI |
| `python_files_project_task.py` | Reading and writing data files | CSV/text file handling, writing output files, JSON serialization |
| `reggies_linear_regression.py` | From-scratch linear regression | Functions, list comprehensions, nested loops, absolute error, brute-force parameter search |

---

## Featured Project: Reggie's Linear Regression

### Overview

This project implements a simple linear regression search from scratch in Python. It uses bouncy-ball observations—ball width and bounce height—to find a best-fit line in the form:

```text
y = mx + b
```

Rather than using a machine-learning library, the script tests many combinations of slope (`m`) and intercept (`b`) values. It calculates the total absolute error for every candidate line and keeps the combination with the smallest error.

### Dataset

The project uses the following observed data points, where each tuple represents:

```text
(ball width, bounce height)
```

| Ball width | Bounce height |
|---:|---:|
| 1 | 2 |
| 2 | 0 |
| 3 | 4 |
| 4 | 4 |
| 5 | 3 |

### Methodology

1. Calculate predicted values using the equation `y = m * x + b`.
2. Measure the absolute error between a predicted value and an actual observed value.
3. Sum the error across all observations for a candidate line.
4. Generate slope candidates from `-10.0` to `10.0` in increments of `0.1`.
5. Generate intercept candidates from `-20.0` to `20.0` in increments of `0.1`.
6. Test every slope/intercept combination.
7. Select the line that produces the lowest total absolute error.
8. Use the best-fit line to predict bounce height for a new ball width.

### Result

The model finds the following line of best fit:

```text
y = 0.4x + 1.6
```

| Metric | Result |
|---|---:|
| Best slope (`m`) | 0.4 |
| Best intercept (`b`) | 1.6 |
| Minimum total absolute error | 5.0 |
| Predicted bounce height for width `6` | 4.0 meters |

### Skills Demonstrated

- Defining and using Python functions
- Representing observations as tuples and lists
- Applying the slope-intercept equation
- Calculating absolute prediction error
- Iterating through datasets with `for` loops
- Creating numeric ranges with list comprehensions
- Using nested loops to evaluate model parameters
- Applying a brute-force optimization approach
- Interpreting a simple predictive model

### Portfolio Note

This is an educational, from-scratch implementation intended to demonstrate the mechanics behind regression modeling. In a production analysis workflow, I would typically use tools such as pandas for data preparation and scikit-learn for model fitting and model evaluation.

---

## Medical Insurance Dictionary Project

### Overview

This project uses a small medical-insurance dataset to practice creating, updating, and analyzing structured records with Python dictionaries.

### Focus Areas

- Creating and updating dictionaries
- Retrieving values with `get()`
- Updating records with `update()`
- Combining related lists with `zip()`
- Creating dictionaries with dictionary comprehensions
- Building and navigating nested dictionaries
- Iterating through structured records with `for` loops
- Calculating summary metrics, including average insurance cost
- Printing readable record summaries

### Project Workflow

The script works with patient names, ages, insurance costs, and related attributes. It progressively organizes the data into more useful forms:

1. Create a dictionary of patient insurance costs.
2. Update and retrieve individual dictionary values.
3. Calculate an average cost across patients.
4. Create a name-to-age mapping.
5. Combine multiple lists into structured patient records.
6. Build a nested dictionary containing full medical records.
7. Iterate through records and print formatted summaries.

### Skills Demonstrated

- Modeling real-world records with dictionaries
- Organizing related data into nested structures
- Using loops and comprehensions to transform data
- Calculating basic descriptive metrics
- Producing readable output from structured data

---

## Medical Insurance Strings Project

### Overview

This project practices cleaning and restructuring raw text from a medical-insurance dataset. It demonstrates how string operations can turn inconsistent or unstructured information into data that is easier to analyze.

### Focus Areas

- Cleaning text values
- String slicing and formatting
- Splitting text into individual records
- Transforming raw strings into structured lists
- Counting records
- Calculating basic summaries, including average BMI

### Skills Demonstrated

- Data-cleaning fundamentals
- Text processing with Python string methods
- Preparing raw information for later analysis
- Basic aggregation and summary calculations

---

## Python Files Project

### Overview

This file I/O project demonstrates how Python can read source data and create output files in several formats.

### Focus Areas

- Reading data from a CSV file
- Extracting relevant information from file contents
- Writing values to a text file
- Creating a JSON-formatted message
- Generating a new output file

### Skills Demonstrated

- File paths and file handling
- Using `open()` with appropriate read/write modes
- Processing file contents with loops
- Writing text output
- Working with JSON data structures

---

## Tools and Technologies

- Python 3
- Core Python standard library
- Codecademy learning environment and coursework

No external Python packages are required for the current projects.

---

## Next Steps

As I progress through data analytics and data science coursework, I plan to extend this folder with projects involving:

- pandas and NumPy for data cleaning and analysis
- Matplotlib and Seaborn for visualization
- CSV and Excel data workflows
- SQL-connected analysis workflows
- Exploratory data analysis
- Statistical testing and regression evaluation
- Machine-learning workflows using scikit-learn
