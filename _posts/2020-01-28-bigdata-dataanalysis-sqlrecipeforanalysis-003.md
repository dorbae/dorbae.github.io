---
layout: post
title: "[Data Analysis] SQL Recipe for Data Analysis Tutorial #3 - Manipulating multiple values"
comments: true
author: dorbae
date: 2020-01-28 +0900
categories : [BigData,DataAnalysis]
tags: [bigdata,sql,analyze,data,tutorial]
sitemap :
  changefreq : weekly
---

# Goal
* Studying SQL for data analysis
* Practicing chapter 3rd in the book
* Studying SQL for Manipulating data

<br />

---------------

# Practice

## Book for studying

| Title | 데이터 분석을 위한 SQL 레시피 | 
| --- | --- |
| Author | Nagato Kasaki, Naoto Tamiya |
| Translator | 윤인성 |
| Publisher | 한빛미디어 |
| Chapter | 3 |
| Lesson | 6 |

<br >

* I'm gonna study basic SQL syntax and functions for data analysis
* I'm gonna study how to manipulate from a multiple values
* I'm gonna try to load test data on PostgreSQL and execute queries in the book

<br />

## 3.6. Manipulating multiple values
### 3.6.1. Concatenate strings
#### Create table and insert sample data

```sql
-- DROP TABLE IF EXISTS mst_user_location;
-- Create user location table
CREATE TABLE mst_user_location (
    user_id   varchar(255)
  , pref_name varchar(255)
  , city_name varchar(255)
);

-- Insert sample data
INSERT INTO mst_user_location
VALUES
    ('U001', 'Seoul-si', 'Seodaemun-gu')
  , ('U002', 'Kyeonki-do Suwon-si', 'Paldal-gu'  )
  , ('U003', 'Jeju-do', 'Seoguipo-si')
;

commit;

-- Select sample data
SELECT *
  FROM mst_user_location 
;
```

![screenshot001](/assets/images/posts/2020/01/2020-01-28-bigdata-sql-sqlrecipeforanalysis-003-001.png)

<br />

#### Concatenate string data type columns

```sql
-- Concatenate pref_name and citiy_name
SELECT user_id
     -- PostgreSQL, Hive, SparkSQL, BigQuery
     , CONCAT(city_name, ', ', pref_name) AS pref_city
     -- PostgreSQL, Redshift
     , city_name || ', ' || pref_name AS pref_city2
  FROM mst_user_location 
;
```

![screenshot002](/assets/images/posts/2020/01/2020-01-28-bigdata-sql-sqlrecipeforanalysis-003-002.png)

<br />

> Redshift also supports **CONCAT** function. However, this function in Redshift allows only 2 arguments.

>> eg. CONCAT('a', 'b') (O) <br /> eg. CONCAT('a', 'b', 'c') (X)

<br />


### 3.6.2. Compare multiple values
#### Create table and insert sample data
* Data in this table illustrates quarterly sales
* Null means that the sales haven't been confirmed yet

```sql
-- DROP TABLE IF EXISTS quarterly_sales;
-- Create quarterly sales table
CREATE TABLE quarterly_sales (
    year integer
  , q1   integer
  , q2   integer
  , q3   integer
  , q4   integer
);

-- Insert sample data
INSERT INTO quarterly_sales
VALUES
    (2017, 82000, 83000, 78000, 83000)
  , (2018, 85000, 85000, 80000, 81000)
  , (2019, 92000, 81000, NULL , NULL )
;

-- Select sample data
SELECT *
  FROM quarterly_sales
;
```

![screenshot003](/assets/images/posts/2020/01/2020-01-28-bigdata-sql-sqlrecipeforanalysis-003-003.png)

<br />

#### Find out whether the sales of a quater increased or decreased
* Print '+' when sales increased and print '-' when sales decreased. And also, if there was no change, print ' '(space)
* You can use CASE and also **SIGN** function is available
* SIGN returns 1 from a positive number argument or -1 from a negative number one or 0 from 0 argument

```sql
-- Find out the fluctuation of sales quaterly
SELECT year 
     , q1
     , q2
     , CASE WHEN q1 < q2 THEN '+'
            WHEN q1 = q2 THEN ' '
            ELSE '-'
            END AS judge_q1_q2
     , q2 - q1 AS diff_q2_q1
     , SIGN(q2 - q1) AS sign_q2_q1
  FROM quarterly_sales
 ORDER BY year
;
```

![screenshot004](/assets/images/posts/2020/01/2020-01-28-bigdata-sql-sqlrecipeforanalysis-003-004.png)

<br />

#### Extract maximum and minimum sales
* You can utilize **greatest**, **least** functions
* These functions are not the standard SQL, but most SQL query engines support them

```sql
-- Find out the max/min sales of a year
SELECT year 
     -- Maximum sales
     , greatest(q1, q2, q3, q4) AS greatest_sales
     -- Minimum sales
     , greatest(q1, q2, q3, q4) AS least_sales
  FROM quarterly_sales
 ORDER BY year
;
```

![screenshot005](/assets/images/posts/2020/01/2020-01-28-bigdata-sql-sqlrecipeforanalysis-003-005.png)

<br />

#### Calculate the average of a year
* You have to consider whether null value is exists or not

```sql
-- Calculate the average of a year
SELECT year 
     -- Invalid: It doesn't replace null to 0. The result of an arithmetic operation with null is null
     , (q1 + q2 + q3 + q4) / 4 AS null_average
     -- Invalid: You have to skip q3, q4 in 2019. But, it always divide total value into 4
     , (COALESCE(q1, 0) + COALESCE(q2, 0) + COALESCE(q3, 0) + COALESCE(q4, 0)) / 4 AS invalid_denominator_average
     -- Valid
     , (COALESCE(q1, 0) + COALESCE(q2, 0) + COALESCE(q3, 0) + COALESCE(q4, 0)) 
       / (SIGN(COALESCE(q1, 0)) + SIGN(COALESCE(q2, 0)) + SIGN(COALESCE(q3, 0)) + SIGN(COALESCE(q4, 0))) AS correct_average
  FROM quarterly_sales
 ORDER BY year 
;
```

![screenshot006](/assets/images/posts/2020/01/2020-01-28-bigdata-sql-sqlrecipeforanalysis-003-006.png)

<br />

------------

## References
* 데이터 분석을 위한 SQL 레시피 - 한빛미디어