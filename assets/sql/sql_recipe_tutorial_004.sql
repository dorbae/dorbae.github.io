/*************************************
 *
 * SQL Recipe for Analysis Tutorial #4
 * 
 *************************************
 * @version	1.0.0	2020-01-31 14:28:10	dorbae	Initialize
 * @author dorbae(dorbae.io@gmail.com)
 */

--DROP TABLE IF EXISTS review;
-- Create review table
CREATE TABLE review (
    user_id    varchar(255)
  , product_id varchar(255)
  , score      numeric
);

-- Insert sample data
INSERT INTO review
VALUES
    ('U001', 'A001', 4.0)
  , ('U001', 'A002', 5.0)
  , ('U001', 'A003', 5.0)
  , ('U002', 'A001', 3.0)
  , ('U002', 'A002', 3.0)
  , ('U002', 'A003', 4.0)
  , ('U003', 'A001', 5.0)
  , ('U003', 'A002', 4.0)
  , ('U003', 'A003', 4.0)
;

-- Select sample data
SELECT *
  FROM review
;


-- Calculate several feature values from all records
SELECT COUNT(*) AS total_count
     , COUNT(DISTINCT user_id) AS user_count
     , COUNT(DISTINCT product_id) AS product_count
     , SUM(score) AS sum
     , AVG(score) AS avg
     , MAX(score) AS max
     , MIN(score) AS min
  FROM review
;

-- Calculate serveral feature values from groups repectively
SELECT user_id
     , COUNT(*) AS total_count
     , COUNT(DISTINCT product_id) AS product_count
     , SUM(score) AS sum
     , AVG(score) AS avg
     , MAX(score) AS max
     , MIN(score) AS min
  FROM review
 GROUP BY user_id 
;

-- Calculate user's private score(score) and the average score by user(user_avg_score)
SELECT user_id
     , product_id
     -- User's private score
     , score 
     -- The total average score 
     , AVG(score) OVER() AS avg_score
     -- User's average score
     , AVG(score) OVER(PARTITION BY user_id) AS user_avg_score
     -- The differnce
     , score - AVG(score) OVER(PARTITION BY user_id) AS user_avg_score_diff
  FROM review
;

-- DROP TABLE IF EXISTS popular_products;
-- Create popular product table
CREATE TABLE popular_products (
    product_id varchar(255)
  , category   varchar(255)
  , score      numeric
);

-- Insert sample data
INSERT INTO popular_products
VALUES
    ('A001', 'action', 94)
  , ('A002', 'action', 81)
  , ('A003', 'action', 78)
  , ('A004', 'action', 64)
  , ('D001', 'drama' , 90)
  , ('D002', 'drama' , 82)
  , ('D003', 'drama' , 78)
  , ('D004', 'drama' , 58)
;

-- Select sample data
SELECT *
  FROM popular_products
;

-- Ordering in a table
SELECT product_id
     , score
     -- Unique rank by score
     , ROW_NUMBER() OVER(ORDER BY score DESC) AS rownum
     -- Skip duplicate rank
     , RANK() OVER(ORDER BY score DESC) AS rank
     -- Don't skip duplicate rank
     , DENSE_RANK() OVER(ORDER BY score DESC) AS dense_rank 
     -- Previous record
     , LAG(product_id) OVER(ORDER BY score DESC) AS lag1
     -- Previous 2nd record
     , LAG(product_id, 2) OVER(ORDER BY score DESC) AS lag2
     -- Next record
     , LEAD(product_id) OVER(ORDER BY score DESC) AS lead1
     -- Next 2nd record
     , LEAD(product_id, 2) OVER(ORDER BY score DESC) AS lead2
  FROM popular_products
 ORDER BY rownum 
;

-- Combine ordering and intensive functions
SELECT product_id
     , score
     , ROW_NUMBER() OVER(ORDER BY score DESC) 
         AS rownum
     -- Cumulative score from the score of a high rank to current in a window
     , SUM(score) 
         OVER(ORDER BY score DESC
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
         AS cum_score
     -- Average score between previous record, current, and next record
     , AVG(score)
         OVER(ORDER BY score DESC
           ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING)
         AS local_avg
     -- Product_id of top ranked record
     , FIRST_VALUE(product_id) 
         OVER(ORDER BY score DESC
           ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
         AS first_value
     -- Product_id of bottom ranked record
     , LAST_VALUE(product_id) 
         OVER(ORDER BY score DESC
           ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
         AS first_value
  FROM popular_products
 ORDER BY rownum 
;
     
                                
-- Integrate product_id by window frames
SELECT product_id
     , ROW_NUMBER() OVER(ORDER BY score DESC) 
         AS rownum
     -- All records
     , array_agg(product_id)	-- collect_list(product_id)
         OVER(ORDER BY score DESC
           ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
         AS whole_agg
     -- From the first record to current record
     , array_agg(product_id)
         OVER(ORDER BY score DESC
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
         AS cum_agg
     -- From previous record to next record
     , array_agg(product_id)
         OVER(ORDER BY score DESC
           ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING)
         AS local_agg
  FROM popular_products
 WHERE category = 'action'
 ORDER BY rownum 
;

-- Combine PARTITION BY and ORDER BY
SELECT category
     , product_id
     , score
     -- Unique rank by category
     , ROW_NUMBER()
         OVER(PARTITION BY category ORDER BY score DESC)
         AS rownum
     -- Rank with duplication by category
     , RANK()
         OVER(PARTITION BY category ORDER BY score DESC)
         AS rank
     -- Rank with duplication and skip duplicate rank
     , DENSE_RANK()
         OVER(PARTITION BY category ORDER BY score DESC)
         AS dense_rank
  FROM popular_products pp 
 ORDER BY category, rownum 
;


-- Extract top 2 products by category
SELECT *
  FROM 
    (SELECT category
          , product_id
          , score
          , ROW_NUMBER()
              OVER(PARTITION BY category ORDER BY score DESC)
              AS rank
      FROM popular_products pp 
   ) AS popular_products_with_rank
 WHERE rank  <= 2
 ORDER BY category, rank 
;

-- Extrat top ranked product by category
SELECT DISTINCT category
    -- the top ranked product_id
    , FIRST_VALUE(product_id)
        OVER(PARTITION BY category ORDER BY score DESC
          ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
        AS product_id
  FROM popular_products pp
;


-- DROP TABLE IF EXISTS daily_kpi;
-- Create KPI(Key Point Indicator) table
CREATE TABLE daily_kpi (
    dt        varchar(255)
  , indicator varchar(255)
  , val       integer
);

-- Insert sample data
INSERT INTO daily_kpi
VALUES
    ('2020-01-01', 'impressions', 1800)
  , ('2020-01-01', 'sessions'   ,  500)
  , ('2020-01-01', 'users'      ,  200)
  , ('2020-01-02', 'impressions', 2000)
  , ('2020-01-02', 'sessions'   ,  700)
  , ('2020-01-02', 'users'      ,  250)
;

-- Select sample data
SELECT *
  FROM daily_kpi
;

-- Convert rows into columns through GROUP_BY and MAX(CASE)
SELECT dt
     , MAX(CASE WHEN indicator = 'impressions' THEN val END)
         AS impressions
     , MAX(CASE WHEN indicator = 'sessions' THEN val END)
         AS sessions
     , MAX(CASE WHEN indicator = 'users' THEN val END)
         AS users
  FROM daily_kpi 
 GROUP BY dt 
 ORDER BY dt 
;


-- DROP TABLE IF EXISTS purchase_detail_log;
-- Create purchase log table
CREATE TABLE purchase_detail_log (
    purchase_id integer
  , product_id  varchar(255)
  , price       integer
);

-- Insert sample data
INSERT INTO purchase_detail_log
VALUES
    (100001, 'A001', 3000)
  , (100001, 'A002', 4000)
  , (100001, 'A003', 2000)
  , (100002, 'D001', 5000)
  , (100002, 'D002', 3000)
  , (100003, 'A001', 3000)
;

-- Select sample data
SELECT *
  FROM purchase_detail_log
;

-- Convert rows into 1 row with comma delimiters
SELECT purchase_id
     -- if PostgresSQL, BigQuery
     , string_agg(product_id, ',') AS product_ids
     -- if Redshift
     -- , listagg(product_id, ',') AS product_ids
     -- if Hive, SparkSQL
     -- , concat_ws(',', collect_list(product_id)) AS product_ids
     , SUM(price) AS amount
  FROM purchase_detail_log 
 GROUP BY purchase_id 
 ORDER BY purchase_id 
;

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

-- CROSS JOIN with a pivot table
SELECT q.year
     -- Print labels from Q1 to Q4
     , CASE WHEN p.idx = 1 THEN 'q1'
            WHEN p.idx = 2 THEN 'q2'
            WHEN p.idx = 3 THEN 'q3'
            WHEN p.idx = 4 THEN 'q4'
            END AS quarters
     -- Print sales from Q1 to Q4
     , CASE WHEN p.idx = 1 THEN q.q1
            WHEN p.idx = 2 THEN q.q2
            WHEN p.idx = 3 THEN q.q3
            WHEN p.idx = 4 THEN q.q4
            END AS sales
  FROM quarterly_sales AS q
    CROSS JOIN
      -- Create sequence table followed columns in quaterly_sales
      (SELECT 1 AS idx
       UNION ALL
       SELECT 2 AS idx
       UNION ALL
       SELECT 3 AS idx
       UNION ALL
       SELECT 4 AS idx
      ) AS p
;       

-- DROP TABLE IF EXISTS purchase_log;
-- Create purchase_log
CREATE TABLE purchase_log (
    purchase_id integer
  , product_ids varchar(255)
);

-- Insert sample data
INSERT INTO purchase_log
VALUES
    (100001, 'A001,A002,A003')
  , (100002, 'D001,D002')
  , (100003, 'A001')
;

-- Select sample data
SELECT *
  FROM purchase_log
;

-- Convert an array into a table
-- if PostgreSQL
SELECT unnest(ARRAY['A001', 'A002', 'A003']) AS product_id;
-- if BigQuery
-- SELECT * FROM unnest(ARRAY['A001', 'A002', 'A003']) AS product_id;
-- if Hive, SparkSQL
-- SELECT explode(ARRAY['A001', 'A002', 'A003']) AS product_id;

-- Convert a stirng with delimiters into a table
SELECT purchase_id
     , product_id
  FROM purchase_log AS p
    -- if PostgreSQL
    CROSS JOIN unnest(pg_catalog.string_to_array(product_ids, ',')) AS product_id
    -- if BigQuery
    -- CROSS JOIN unnest(split(product_ids, ',')) AS prouct_id
    -- if Hive, SparkSQL
    -- LATERAL VIEW explode(split(producT_ids, ',') e AS producT_id
;

-- Convert a stirng with delimiters into a table withtout cross join
SELECT purchase_id
     , regexp_split_to_table(product_ids, ',') AS product_id
  FROM purchase_log
;

-- Calculate the count of products through the count of delimiters in Redshift
SELECT purchase_id
     , product_ids
     -- Remove comman by product_id 
     -- and calculate the count of products through the count of delimiters
     , 1 + char_length(product_ids) - char_length(replace(product_ids, ',', ''))
         AS product_num
  FROM purchase_log
;


-- Convert a string into rows using a pivot table in Redshift
SELECT l.purchase_id
     , l.product_ids
     -- Set a sequence by the count of products
     , p.idx
     , split_part(l.product_ids, ',', p.idx) AS product_id 
  FROM purchase_log AS l
    JOIN
      (SELECT 1 AS idx
       UNION ALL
       SELECT 2 AS idx
       UNION ALL
       SELECT 3 AS idx 
      ) AS p
      -- Join when id of the pivot table is less than the count of products
      ON p.idx <= (1 + char_length(product_ids) - char_length(replace(product_ids, ',', '')))
;
