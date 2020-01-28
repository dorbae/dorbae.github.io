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


# Keep continue...