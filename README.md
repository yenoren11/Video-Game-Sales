# Video Game Sales Data Analysis and Report

This project provides a comprehensive analysis of global video game sales performance across different platforms, genres, and regions. It covers the full data analysis workflow—from SQL-based querying and Python-based data cleaning to exploratory data analysis (EDA) and interactive Power BI dashboarding.

## 1. Project Overview
The primary objective is to support data-driven insights into the video game industry by:
* **Analyzing Sales Trends:** Identifying peak years and overall market growth/decline patterns.
* **Platform Performance:** Determining which gaming platforms generate the highest sales.
* **Genre Analysis:** Understanding which game genres are most popular globally.
* **Regional Insights:** Comparing sales across North America, Europe, Japan, and other regions.
* **Data-Driven Insights:** Providing actionable observations about market behavior and industry trends.

## 2. Dataset Summary
Source: [Kaggle](https://www.kaggle.com/code/youssefabdella/video-games-sales-analysis)

The dataset contains historical video game sales records across multiple platforms and regions.

**Key Variables:**
* `Name`: Title of the video game
* `Platform`: Gaming platform (e.g., PS2, Wii, Xbox)
* `Year`: Release year
* `Genre`: Game category (Action, Sports, RPG, etc.)
* `Publisher`: Company that published the game
* `NA_Sales`, `EU_Sales`, `JP_Sales`, `Other_Sales`: Regional sales (in millions)
* `Global_Sales`: Total worldwide sales

## 3. Methodology
The project follows a structured data analytics workflow:

### **Data Preparation & Cleaning**
* Used SQL to query and explore the dataset.
* Cleaned data using Python (Pandas):
  * Handled missing values (e.g., Year)
  * Removed duplicates
  * Ensured correct data types
* Exported cleaned dataset (`vgsales_cleaned.csv`) for analysis.

### **Exploratory Data Analysis (EDA)**
* Analyzed top-selling games, platforms, and genres.
* Visualized trends using Matplotlib and Seaborn.
* Conducted time-series analysis to observe market growth over years.
* Explored relationships such as multi-platform releases vs sales performance.

### **Interactive Dashboarding**
* Built a **Power BI** dashboard for interactive analysis.
* Included KPI cards (Total Sales, Total Games, Top Platform, Top Genre).
* Developed visualizations for:
  * Sales over time
  * Sales by genre and platform
  * Regional distribution
* Added slicers for filtering by Genre and other attributes.

## 4. Dashboard Proposal: Revenue & Inventory Efficiency
Key Insights:
* **Overall Performance:** Total global sales exceed 8 billion units, indicating a large and mature market.
* **Top Platform:** PS2 is the best-performing platform with the highest total sales.
* **Genre Dominance:** Action and Sports genres dominate global sales.
* **Regional Analysis:** North America leads the market, followed by Europe, while Japan shows a smaller but distinct trend.
* **Market Trends:** Sales peaked around 2008–2010 and declined afterward, reflecting industry shifts.
* **Multi-platform Effect:** Games released on multiple platforms tend to achieve higher total sales.

---
**Developed by:** Nguyen Pham Hoang Yen
