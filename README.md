# Walmart-Data-Analysis-End-To-End-Data-Analysis-Project-Using-Python-SQL

## Project Overview

This project builds a complete data pipeline for analyzing Walmart sales data. The workflow covers dataset acquisition through the Kaggle API, data cleaning and preparation with Python, loading processed data into a relational database, and performing analysis using PostgreSQL. It is designed for analysts who want hands-on experience with data pipelines, SQL operations, and real-world business analysis.

---

## Project Steps

### 1. Environment Setup
Tools used: VS Code, Python and PostgreSQL.  
A consistent folder structure is used to keep scripts, data, and queries organized.

### 2. Kaggle API Configuration
Download the Kaggle API token from your Kaggle account settings.  
Place the `kaggle.json` file in your local `.kaggle` directory.  
Use the command: `kaggle datasets download -d <dataset-name>` to pull data directly into the project.

### 3. Downloading Walmart Sales Data
The Walmart dataset is downloaded through the Kaggle API and stored in the `data/` directory for processing.

### 4. Install Dependencies and Load Data
Install the required Python libraries: `pip install pandas numpy sqlalchemy mysql-connector-python psycopg2`. Load the raw dataset into a Pandas DataFrame for inspection and transformation.

### 5. Initial Data Exploration
Inspected the dataset using basic exploratory functions such as:

- `.info()` for column data types  
- `.describe()` for summary statistics  
- `.head()` for a quick preview  

This helps identify irregularities, data types, and potential issues.

### 6. Data Cleaning
The cleaning phase included:

- Removing duplicate records  
- Handling missing values appropriately  
- Standardizing data types (dates, numeric columns, currency fields)  
- Fixing formatting issues using `.replace()` and other DataFrame operations  

This created a clean, consistent dataset ready for analysis.

### 7. Feature Engineering
A new column, `Total_Amount`, was created by multiplying `unit_price` and `quantity`.  
This added field simplified aggregation and improved query performance during analysis.

### 8. Loading Data into PostgreSQL
Using SQLAlchemy, connections were created for PostgreSQL.  
The cleaned DataFrame wass exported into database tables using `pd.to_sql`.  
Basic queries were run to confirm data integrity after loading.

### 9. SQL Analysis and Business Insights
PostgreSQL was used to answer the following business questions:

- Different types of payment methods and the number of transactions made using each of them  
- Highest rated product category at each Walmart branch  
- Identifying the busiest day for each branch  
- Which product category brings the most sales  
- What time of day and which day of week produces most sales
- Which branches produce more revenue than the company's average revenue accross all branches
- Second highest revenue day for each branch
- Most common payment methods for each branch  

Each SQL query is documented with its purpose and output summary.

### 10. Documentation and Publishing
All steps are documented in Markdown and Python notebooks.  
The final repository includes:

- A clear `README.md`  
- SQL scripts for analysis  
- Jupyter notebook 
- Steps to obtain the dataset, instead of bundling raw data directly  

---

## Requirements

- Python 3.12.7  
- MySQL or PostgreSQL  
- Python Libraries: `pandas`, `numpy`, `sqlalchemy`, `mysql-connector-python`, `psycopg2`  
- Kaggle API key  






