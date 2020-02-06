---
layout: post
title: "[Data Analysis] SQL Recipe for Data Analysis Tutorial #6 - Aggregating data based on the time series"
comments: true
author: dorbae
date: 2020-02-06 +0900
categories : [BigData,DataAnalysis]
tags: [bigdata,sql,analyze,data,tutorial]
sitemap :
  changefreq : weekly
---

# Goal
* Studying SQL for data analysis
* Practicing chapter 4th in the book
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
| Chapter | 4 |
| Lesson | 9 |

<br >

* I'm gonna study basic SQL syntax and functions for data analysis
* I'm gonna study how to extract data for sales
* I'm gonna study how to aggregate data based on the time series
* I'm gonna try to load test data on PostgreSQL and execute queries in the book

<br />

## 4.9. Aggregating data based on the time series
* [Download tutorial SQL file](/assets/sql/sql_recipe_tutorial_006.sql)

<br />

### 4.9.1. Aggregate sales amount by date
#### Create purchase log table

```sql
-- DROP TABLE IF EXISTS purchase_log;
-- Create purchase log table
CREATE TABLE purchase_log3 (
    dt              varchar(255)
  , order_id        integer
  , user_id         varchar(255)
  , purchase_amount integer
);

-- Insert sample data
INSERT INTO purchase_log3
VALUES
    ('2020-01-01',  1, 'rhwpvvitou', 13900)
  , ('2020-01-01',  2, 'hqnwoamzic', 10616)
  , ('2020-01-02',  3, 'tzlmqryunr', 21156)
  , ('2020-01-02',  4, 'wkmqqwbyai', 14893)
  , ('2020-01-03',  5, 'ciecbedwbq', 13054)
  , ('2020-01-03',  6, 'svgnbqsagx', 24384)
  , ('2020-01-03',  7, 'dfgqftdocu', 15591)
  , ('2020-01-04',  8, 'sbgqlzkvyn',  3025)
  , ('2020-01-04',  9, 'lbedmngbol', 24215)
  , ('2020-01-04', 10, 'itlvssbsgx',  2059)
  , ('2020-01-05', 11, 'jqcmmguhik',  4235)
  , ('2020-01-05', 12, 'jgotcrfeyn', 28013)
  , ('2020-01-05', 13, 'pgeojzoshx', 16008)
  , ('2020-01-06', 14, 'msjberhxnx',  1980)
  , ('2020-01-06', 15, 'tlhbolohte', 23494)
  , ('2020-01-06', 16, 'gbchhkcotf',  3966)
  , ('2020-01-07', 17, 'zfmbpvpzvu', 28159)
  , ('2020-01-07', 18, 'yauwzpaxtx',  8715)
  , ('2020-01-07', 19, 'uyqboqfgex', 10805)
  , ('2020-01-08', 20, 'hiqdkrzcpq',  3462)
  , ('2020-01-08', 21, 'zosbvlylpv', 13999)
  , ('2020-01-08', 22, 'bwfbchzgnl',  2299)
  , ('2020-01-09', 23, 'zzgauelgrt', 16475)
  , ('2020-01-09', 24, 'qrzfcwecge',  6469)
  , ('2020-01-10', 25, 'njbpsrvvcq', 16584)
  , ('2020-01-10', 26, 'cyxfgumkst', 11339)
;

commit;

-- Select sample data
SELECT * FROM purchase_log3;
```

![screenshot001](/assets/images/posts/2020/02/2020-02-06-bigdata-sql-sqlrecipeforanalysis-006-001.png)

<br />

#### Aggregate sales amount and the average purchase amount per day
* Imagine that you have to make the below chart

![screenshot002](/assets/images/posts/2020/02/2020-02-06-bigdata-sql-sqlrecipeforanalysis-006-002.png)

<br />

```sql
-- Aggregate sales amount and the average purchase amount per day
SELECT dt
     , COUNT(*) AS purchase_count
     , SUM(purchase_amount) AS total_amount
     , AVG(purchase_amount) AS avg_amount
  FROM purchase_log3
 GROUP BY dt
 ORDER BY dt ASC
;
```

![screenshot003](/assets/images/posts/2020/02/2020-02-06-bigdata-sql-sqlrecipeforanalysis-006-003.png)

<br />

### 4.9.2. Extract the change followed by date through a moving average
* You can easily recognize the increase and decrease chage through the moving average 
* Image that you have to make the below chart

![screenshot004](/assets/images/posts/2020/02/2020-02-06-bigdata-sql-sqlrecipeforanalysis-006-004.png)

<br />

```sql
-- Extract the change followed by date through a moving average
SELECT dt 
     , SUM(purchase_amount) AS total_amount
     -- Caculate the recent average amount for 7 days
     -- Get the average amount even if there are less 7 days
     , AVG(SUM(purchase_amount))
         OVER(ORDER BY dt ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)
         AS seven_day_avg
     -- Calculate the recent average amount for 7 days exactly
     -- Ignore the average amount which has less 7 days
     , CASE WHEN 7 = COUNT(*)
                      OVER(ORDER BY dt ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)
              THEN AVG(SUM(purchase_amount))
                    OVER(ORDER BY dt ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)
            END AS seven_day_avg_strict
  FROM purchase_log3
 GROUP BY dt 
 ORDER BY dt ASC
;
```

![screenshot005](/assets/images/posts/2020/02/2020-02-06-bigdata-sql-sqlrecipeforanalysis-006-005.png)

<br />

### 4.9.3. Calculate the accumulated sales amount of this month
* Image that you have to make the below chart

![screenshot006](/assets/images/posts/2020/02/2020-02-06-bigdata-sql-sqlrecipeforanalysis-006-006.png)

<br />

```sql
-- Calculate the accumulated sales amount of this month
SELECT dt
     -- Extract year-month
     -- if PostgreSQL, Hive, SparkSQL, Redshift
     , substring(dt, 1, 7) AS year_month
     -- if PostgreSQL, Hive, SparkSQL, BigQuery
     -- , substr(dt, 1, 7) AS year_month
     , SUM(purchase_amount) AS total_amount
     , SUM(SUM(purchase_amount))
         OVER(PARTITION BY substring(dt, 1, 7) 
              ORDER BY dt 
              ROWS UNBOUNDED PRECEDING)
         AS agg_amount
  FROM purchase_log3
 GROUP BY dt
 ORDER BY dt
;
```

![screenshot007](/assets/images/posts/2020/02/2020-02-06-bigdata-sql-sqlrecipeforanalysis-006-007.png)

<br />

#### Enhance the readability of query through WITH clause
* substring functions were used repeatly and it ruined the code readablity
* You can make it better by **WITH**

```sql
-- Make a temporary view indicating daily sales amount
WITH
daily_purchase AS (
  SELECT dt
       -- Extract year, month, date respectively
       -- if PostgreSQL, Hive, SparkSQL, Redshift, use substring
       -- if BigQuery, use substr
       , substring(dt, 1, 4) AS year
       , substring(dt, 6, 2) AS month
       , substring(dt, 9, 2) AS date
       , SUM(purchase_amount) AS purchase_amount
       , COUNT(order_id) AS orders
    FROM purchase_log3
   GROUP BY dt
)
SELECT *
  FROM daily_purchase
 ORDER BY dt 
;
```

![screenshot008](/assets/images/posts/2020/02/2020-02-06-bigdata-sql-sqlrecipeforanalysis-006-008.png)

<br />

```sql
-- Calculate the accumulated sales amount of this month through WITH
WITH
daily_purchase AS (
  SELECT dt
       -- Extract year, month, date respectively
       -- if PostgreSQL, Hive, SparkSQL, Redshift, use substring
       -- if BigQuery, use substr
       , substring(dt, 1, 4) AS year
       , substring(dt, 6, 2) AS month
       , substring(dt, 9, 2) AS date
       , SUM(purchase_amount) AS purchase_amount
       , COUNT(order_id) AS orders
    FROM purchase_log3
   GROUP BY dt
)
SELECT dt
     , concat(year, '-', month) AS year_month
     -- if Redshift, concat or ||
     -- year || '-' || month AS year_month
     , purchase_amount
     , SUM(purchase_amount)
         OVER(PARTITION BY year, month ORDER BY dt ROWS UNBOUNDED PRECEDING)
         AS agg_amount
  FROM daily_purchase 
 ORDER BY dt
;
```

![screenshot009](/assets/images/posts/2020/02/2020-02-06-bigdata-sql-sqlrecipeforanalysis-006-009.png)

<br />

# Continue...

<br />

------------

## References
* 데이터 분석을 위한 SQL 레시피 - 한빛미디어