# NTI Chinook Music Store Dataset Analysis

## Project Overview
This project involves the analysis of the Chinook Music Store dataset. It covers data exploration, schema analysis, and multiple steps of data processing using SQL, Excel Power Query, Power BI, Tableau, and Python for comprehensive insights.

## Project Steps

### Step 1: Data Exploration
- **Objective**: Analyze the Chinook database schema and identify necessary columns for analysis.
- **Actions**:
  - Explored the database schema to understand table relationships and data points available for analysis.
  - Selected relevant columns from the `Customer`, `Invoice`, `InvoiceLine`, `Track`, `Genre`, `MediaType`, `Album`, `Artist`, `Employee`, and `Playlist` tables.

### Step 2: Creating a Database View
- **Objective**: Simplify data access by creating a consolidated view of relevant information.
- **View Creation**:
  ```sql
  CREATE VIEW V1 AS
  SELECT
      c.CustomerId, c.FirstName AS customer_fname, c.LastName AS customer_lname, c.Country, c.City,
      i.InvoiceId, i.InvoiceDate,
      il.InvoiceLineId, il.UnitPrice, il.Quantity,
      t.TrackId, t.Name AS TrackName, t.Composer, t.Milliseconds AS Duration, t.Bytes AS Size,
      g.Name AS Genre,
      mt.Name AS MediaType,
      a.AlbumId, a.Title AS AlbumTitle,
      ar.ArtistId, ar.Name AS ArtistName,
      e.EmployeeId AS empID, e.FirstName AS emp_fname, e.LastName AS emp_lname, e.Title AS emp_title,
      p.Name AS PlaylistName
  FROM
      Customer c
  JOIN 
      Invoice i ON c.CustomerId = i.CustomerId
  JOIN 
      InvoiceLine il ON i.InvoiceId = il.InvoiceId
  JOIN 
      Track t ON il.TrackId = t.TrackId
  JOIN 
      Genre g ON t.GenreId = g.GenreId
  JOIN 
      MediaType mt ON t.MediaTypeId = mt.MediaTypeId
  JOIN 
      Album a ON t.AlbumId = a.AlbumId
  JOIN 
      Artist ar ON a.ArtistId = ar.ArtistId
  LEFT JOIN 
      Employee e ON c.SupportRepId = e.EmployeeId
  LEFT JOIN 
      PlaylistTrack pt ON t.TrackId = pt.TrackId
  LEFT JOIN 
      Playlist p ON pt.PlaylistId = p.PlaylistId;
  
## Step 3: Data Normalization in Excel Power Query
- **Objective**: Normalize the data to streamline analysis by creating separate tables for each data category.
- **Normalization Actions**:
  - Created the following tables:
    - **Fact Invoice**: Contains invoice details for each purchase.
    - **Dim Date**: Stores date-related information for each transaction.
    - **Dim Customer**: Contains customer details such as name, location, and ID.
    - **Dim Employee**: Stores employee information for support representatives.
    - **Dim Tracks**: Includes details about tracks, such as name, duration, and genre.
    - **Dim Artist**: Contains artist names and IDs.
    - **Dim Album**: Stores album details like title and associated artist.
  - Ensured data integrity by removing duplicates, standardizing data types, and linking relevant fields through IDs.

## Step 4: Analysis Using Excel Pivot Tables
- **Objective**: Generate insights using pivot tables for more detailed data exploration.
- **Pivot Tables Created**:
  - **Totals**: Overall sales totals and quantity sold.
  - **#Customer by Country**: Breakdown of the customer count by country.
  - **T-Sales and T-Quantity by Country**: Total sales and quantities by country.
  - **T-Sales by Genre**: Genre-based sales analysis to determine popularity.
  - **T-Sales by Albums**: Analysis of sales by album to identify top-selling albums.
  - **T-Sales per Year**: Yearly sales performance to identify trends.
  - **T-Sales by Months**: Monthly sales analysis to detect seasonality.
  - **#Albums and #Tracks by Artist**: Number of albums and tracks by artist.
  - **#Media_type per Artist**: Breakdown of media types by artist.
  - **Top 2 Genres for the Top 5 Countries**: Insights into top genres in the five countries with the highest sales.

## Step 5: Power BI Dashboard Creation
- **Objective**: Visualize insights through an interactive Power BI dashboard.
- **Dashboard Pages**:
  - **Sales Overview Page**: Displays key metrics such as total revenue, sales trends, and top genres.
  - **Customer Details Page**: Provides insights into customer demographics and location-based distribution.
  - **Tracks Details Page**: Highlights track popularity, sales by genre, and high-performing albums.

## Step 6: Tableau Dashboard Creation
- **Objective**: Summarize findings on a one-page Tableau dashboard for a concise overview.
- **Dashboard**:
  - Created a single-page Tableau dashboard that encapsulates key metrics and trends, including sales by country, top genres, and total revenue.

## Step 7: Python Analysis
- **Objective**: Reproduce and expand analysis using Python for deeper insights.
- **Actions**:
  - **Exploratory Data Analysis (EDA)**: Conducted a detailed examination of data structure, value distributions, and outlier identification.
  - **Data Cleaning**: Standardized column names, handled null values, and removed duplicates for cleaner analysis.
  - **Visualization and Analysis**:
    - Created visualizations with Matplotlib and Seaborn to analyze sales trends, genre distribution, and customer demographics.
    - Analyzed correlations between variables such as sales and genre, sales per customer, and trends over time.

## Conclusion
This project delivered comprehensive insights into the Chinook Music Store's customer base, sales trends, and track popularity. By leveraging various tools (SQL, Excel Power Query, Power BI, Tableau, and Python), each with unique capabilities, we achieved a well-rounded, in-depth analysis of the data. This multi-tool approach allowed for detailed exploration and interactive visualizations that enhanced understanding of customer preferences and sales patterns.
