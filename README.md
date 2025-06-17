# AI Job Risk Pipeline Project
![SQL](https://img.shields.io/badge/SQL-PostgreSQL-blueviolet)
![Python](https://img.shields.io/badge/Python-3.10-blue)
![Pandas](https://img.shields.io/badge/Pandas-data_manipulation-brightgreen)
![Faker](https://img.shields.io/badge/Faker-synthetic_data-yellowgreen)
![SQLAlchemy](https://img.shields.io/badge/SQLAlchemy-DB_connector-lightgrey)
![psycopg2](https://img.shields.io/badge/psycopg2-PostgreSQL_driver-blue)
![Azure PostgreSQL](https://img.shields.io/badge/Azure-PostgreSQL-blue)
![Jupyter Notebook](https://img.shields.io/badge/Jupyter-Notebook-orange)
![Azure Data Studio](https://img.shields.io/badge/Azure_Data_Studio-IDE-informational)
![Tableau Public](https://img.shields.io/badge/Tableau-Public-orange)

## Project Overview
This project analyzes how artificial intelligence could impact job security across various jobs and industries using an end-to-end ETL (Extract, Transform, Load) pipeline which includes an interactive Tableau dashboard to showcase insights and results.
The pipeline uses synthetic job market data attempting to simulate a group being surveyed, ingesting the data into the pipeline is to analyze their responses to explore how common AI tools like ChatGPT, Claude, and others might affect different professions, industries, and experience levels. The main goals of this project: To gain experience building data pipelines with modern data engineering tools but also to have a pipeline that can understand which job roles, industries, and experience levels are most at risk of AI replacement and generate real and useful insights.

## Pipeline Flow (ETL)
*EXTRACT*

**Step 1: Fake Data Generation and CSV Export**
- Environment: Jupyter Notebook
- Tools: Python, Faker, Pandas
- What I Did:
  - Used Python and the Faker library to generate 1,000 synthetic data entries with information such as name, job title, industry, salary, location, and what "they thought" their risk of replacement by AI was on a scale of 1-5
  - Exported the final product (the dataframe) to a CSV file simulating a dataset of survey responses ready for ingestion into the pipeline

**Step 2: Configure Azure PostgreSQL Flexible Server & Connect to Azure Data Studio**
- Environments: Azure Portal, Azure Data Studio
- What I Did:
  - Provisioned an Azure PostgreSQL Flexible Server with appropriate region, compute, and storage for a free Azure account
  - Set my administrative credentials and enabled public access while also allowing traffic from my IP address using firewall rules.
  - Installed the PostgreSQL extension in Azure Data Studio and connected to my Azure PostgreSQL flexible server using the database connection parameters allowing me to manage the database directly in ADS

*TRANSFORM*

**Step 3: Schema and Table Creation**
- Environment: Azure Data Studio
- Tools: SQL
- What I Did:
  - Created a schema and defined a target table based on the structure of the CSV with the synthesized data.
    - Used the appropriate column data types (VARCHAR, INT, etc.) and added constraints.
    - Ensured table was ready to accept clean, transformed data

**Step 4: Data Cleaning and Transformation**
- Environment: Azure Data Studio
- Tools: Python, Pandas
- What I Did:
  - Used pandas to read the CSV with synthesized data and load the data into a dataframe in Azure Data Studio
  - Cleaned the data:
    - Removed underscores from column names
    - Renamed certain columns to match schema
    - Converted column data types to correct data types matching schema
    - Removed null or duplicate values
  - Enriched the dataset and project as a whole by creating calculated fields (for further insights in the viz step)
    - salary_group, experience_level, work_type 

*LOAD*

**Step 5: Load to Azure PostgreSQL Flexible Server in the Cloud**
- Environment: Azure Data Studio
- Tools: Python, SQLAlchemy, Pandas, SQL
- What I Did:
  - Established a connection from Azure Data Studio using Python and the SQLAlchemy create_engine function
  - Used Python and the 'create_engine' function from the SQLAlchemy library to establish a connection between my local Mac environment (in Azure Data Studio) and my Azure-hosted PostgreSQL database
  - Used the pandas library to upload the dataframe containing the synthesized and now transformed dataset (orignally from the CSV) to the PostgreSQL database hosted on Azure
      - Also verified successful table population and data integrity
      - Queried the cloud-hosted data with SQL in Azure Data Studio to verifiy data integrity

**Step 6: Visualizations and Insights**
- Environment: Tableau Public
- What I Did: 
  - Connected Tableau to Azure PostgreSQL server
  - Published a fully interactive and cohesive dashboard on Tableau Public focusing on AI replacement exposure across jobs and industries
    - Made up of 7 visualizations including 2 KPI-tracking metrics
    - Features bar charts, heat maps, and calculated (KPI) tiles
    - Various filters regarding work-related specifications (experience level, industry, city, etc.)
    
## Tech Stack
- **Languages and Libraries**
  - <img src="https://cdn.simpleicons.org/mysql/4479A1" alt="SQL Logo" height="20"> *SQL*: Schema and Table creation, querying, aggregating
  - <img src="https://cdn.simpleicons.org/python/3776AB" alt="Python Logo" height="20"> *Python*: End-to-end scripting (generation, transformation, loading)
  - <img src="https://cdn.simpleicons.org/pandas/150458" alt="Pandas Logo" height="20"> *Pandas*: Python library for data manipulation and cleaning
  - *Faker*: Python library for synthetic data generation
  - *SQLAlchemy*: Python library used to connect ADS to Azure-hosted database
  - *psycopg2*: Database driver for PostgreSQL 
    
- **Database and Cloud**
  - <img src="https://cdn.simpleicons.org/postgresql/336791" alt="PostgreSQL Logo" height="20"> *Azure PostgreSQL Flexible Server*: Cloud-based relational database service used to host all transformed job data
  - <img src="https://logo.svgcdn.com/l/microsoft-azure.svg" alt="Azure Logo" height="20" style="vertical-align:middle;margin-right:5px;"> *Azure Data Studio*: Database Management with SQL 
    
- **Development and Analysis**
  - <img src="https://cdn.simpleicons.org/jupyter/F37626" alt="Jupyter Logo" height="20"> *Jupyter Notebook*: Used for Python synthetic data generation
  - <img src="https://logo.svgcdn.com/l/microsoft-azure.svg" alt="Azure Logo" height="20" style="vertical-align:middle;margin-right:5px;"> *Azure Data Studio*: For SQL development, schema creation, and Python transformation and loading
  - <img src="https://github.com/kevinprinsloo/data_icons/raw/master/icons/tableau/tableau-logo.svg" alt="Tableau Public Logo" height="20" style="vertical-align:middle;margin-right:5px;"> *Tableau Public*: Visualization and dashboarding 
    
## Links
- **[Explore the Interactive AI Job Risk Dashboard](https://public.tableau.com/app/profile/christopher.kennedy4966/viz/Book1_17491403790390/AIExposureAcrossJobsandIndustries)**
