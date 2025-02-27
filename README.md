# A Detailed Analytics Pipeline for Analyzing Shopify Orders and Refunds  
**Final Submission**  

![](https://github.com/ukokobili/data_plumber_modeling/blob/main/images/dbt-dag.png)

## Table of Contents  
1. [Introduction](#introduction)  
2. [Data Pipeline Architecture](#data-pipeline-architecture)  
3. [Data Sources](#data-sources)  
4. [Methodology](#methodology)  
5. [Documentation](#documentation)  
6. [Conclusions](#conclusions)  

---

## Introduction  
This project focuses on analyzing Shopify orders and refunds to provide actionable insights into sales performance, customer behavior, and refund trends. By leveraging modern data tools, the goal is to create a scalable and automated pipeline for transforming raw data into meaningful metrics.  

---

## Data Pipeline Architecture  
The pipeline is designed to extract, transform, and load (ETL) Shopify data into a structured format for analysis. Key components include:  
- **MotherDuck**: Used as the database for storing and querying data.  
- **dbt**: Handles data transformation and modeling, ensuring clean and reliable datasets.  
- **GitHub Actions**: Automates CI/CD workflows, enabling seamless updates and deployments.  
- **GitHub Pages**: Hosts the project documentation for easy access and reference.  

---

## Data Sources  
The datasets used in this analysis include:  
- **Shopify Orders**: Contains order details such as `order_id`, `customer_id`, `order_date`, and `line_items`.  
- **Shopify Refunds**: Includes refund details like `refund_id`, `order_id`, `product_id`, and `refund_amount`.  

---

## Methodology  
### Tools Used  
- **MotherDuck**: Serves as the database for storing and querying data.  
- **dbt**: Used for data transformation, modeling, and ensuring data quality.  
- **GitHub Actions**: Automates CI/CD workflows, ensuring consistent and reliable updates.  
- **GitHub Pages**: Hosts the project documentation for easy access.  

### Applied Techniques  
1. **Data Cleaning**: Used dbt to clean and standardize raw data.  
2. **Data Modeling**: Built a star schema to organize data for efficient querying.  
3. **Automation**: Implemented GitHub Actions to automate testing, deployment, and documentation updates.  
4. **Documentation**: Hosted the project documentation on GitHub Pages for transparency and accessibility.  

---

## Documentation  
The project documentation is hosted on GitHub Pages and provides a detailed overview of the data models, transformations, and tests. You can access it here:  
[Documentation Link](https://ukokobili.github.io/data_plumber_modeling/#!/overview)  

---

## Conclusions  
This project demonstrates how modern data tools like MotherDuck, dbt, and GitHub Actions can be used to build a scalable and automated analytics pipeline. By transforming raw Shopify data into actionable insights, the pipeline provides valuable metrics for understanding sales performance, customer behavior, and refund trends.  

---


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
