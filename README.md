E-Commerce Sales & Profitability Analysis

About the project

I am working on this project to practise data analysis using a small e-commerce sales dataset. I want to understand how sales and profit change across products, categories, and regions, and turn the results into useful business findings.

I am starting with Excel because the dataset and project scope are manageable. After finishing and checking the Excel analysis, I plan to build a Power BI dashboard and then repeat selected analysis in Python.

Business problem

The business has sales records, but it needs a clearer view of its performance. Total sales alone do not explain whether the business is making enough profit.

This project will help answer questions such as:

How much sales revenue and profit did the business generate?

Which product categories contribute most to sales and profit?

Which region performs best?

Which products have stronger or weaker profit margins?

Does the product with the highest sales also generate the highest profit?

What should the business investigate to improve profitability?

The dataset is described in the project plan as simulated historical e-commerce sales data. The findings should therefore be treated as analysis of this dataset, not as claims about a real company's performance.

Main objectives

Calculate overall sales, profit, quantity sold, and profit margin.

Compare performance by category, region, and product.

Study monthly sales and profit trends.

Find products with high sales but comparatively low profit margins.

Present findings clearly and suggest areas that may need further investigation.

Tools and workflow

I am following this order:

Excel — check the data, calculate KPIs, compare products/categories/regions, create charts, and build an initial dashboard.

Power BI — prepare the model, create measures, and build an interactive dashboard.

Python — clean and explore the data and repeat selected calculations to cross-check results.

Git and GitHub — keep track of project changes and share the work.

I will update this README as the project progresses. I am not treating later stages as completed until I have done and checked them.

Excel work completed so far

Work log — 28 October 2026

Today, I worked on the main KPI summary tables in Excel:

Overall performance: total sales, total profit, total quantity, profit margin, revenue per unit, and profit per unit.

Category performance: sales, profit, profit margin, and contribution to total sales and profit.

Regional performance: sales, profit, profit margin, and contribution percentages.

Product performance: sales, profit, profit margin, and contribution percentages.

The current summary shows approximately:

KPI

Current result

Total Sales

₹1,06,67,881

Total Profit

₹18,44,665

Total Quantity Sold

17,261

Overall Profit Margin

17.29%

Revenue per Unit

₹618

Profit per Unit

₹107

These are working figures from my current Excel analysis. I still need to verify the workbook formulas and check that all summary tables reconcile with the source data before treating the results as final.

Next tasks in Excel

Check formulas and calculation ranges in all KPI tables.

Reconcile totals in the overall, category, regional, and product summaries.

Check percentage calculations and rounding.

Analyse monthly sales and monthly profit.

Identify the highest and lowest months for sales and profit.

Compare product sales with product profit and profit margin.

Identify products with high sales but comparatively low profit margin.

Create suitable charts for the main findings.

Build and format an Excel dashboard.

Write a few business insights based on the checked results.

Save screenshots of the final Excel analysis for this repository.

Business questions I want to answer

Overall performance

What are the total sales and total profit?

How many units were sold?

What is the overall profit margin?

How much sales revenue and profit are generated per unit?

Category performance

Which category generates the highest sales?

Which category generates the highest profit?

Which category has the highest profit margin?

Does the category with the highest sales also contribute the most profit?

Regional performance

Which region generates the highest sales?

Which region generates the highest profit?

Which region has the highest profit margin?

Are there regions that may need a closer look at profitability?

Product performance

Which products generate the highest sales and profit?

Which products sell the most units?

Which products have the strongest and weakest profit margins?

Are any products generating high sales but comparatively low profit?

Monthly trends

Which month has the highest and lowest sales?

Which month has the highest and lowest profit?

Do sales and profit follow the same pattern over time?

How I will use GitHub

I will keep the project files organised and commit work as I complete each stage. The commit history will show how the project develops over time.

Example commit messages:

docs: add project overview and business questions

excel: add overall KPI analysis

excel: add category and regional summaries

excel: validate KPI calculations

excel: add monthly trend analysis

excel: add dashboard

I will only use a commit message for work that has actually been completed.

Project status

Current stage: Excel analysis

The overall, category, regional, and product KPI summary tables have been prepared. Formula validation, monthly trend analysis, product profitability investigation, charts, and the Excel dashboard are still on the to-do list.

Note on interpretation

High sales do not always mean high profit. Profit margin is calculated as:

Profit Margin = Total Profit / Total Sales × 100

For overall or grouped results, I will calculate the margin using the sum of profit divided by the sum of sales, rather than taking a simple average of row-level margins. I will only suggest possible causes such as pricing or costs when the available data supports further investigation.