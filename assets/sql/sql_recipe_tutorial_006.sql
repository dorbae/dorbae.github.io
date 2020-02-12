/*************************************
 *
 * SQL Recipe for Analysis Tutorial #6
 * 
 *************************************
 * @version	1.0.0	2020-02-06 17:33:10	dorbae	Initialize
 * @author dorbae(dorbae.io@gmail.com)
 */

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

-- Aggregate sales amount and the average purchase amount per day
SELECT dt
     , COUNT(*) AS purchase_count
     , SUM(purchase_amount) AS total_amount
     , AVG(purchase_amount) AS avg_amount
  FROM purchase_log3
 GROUP BY dt
 ORDER BY dt ASC
;

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


-- DROP TABLE IF EXISTS purchase_log4;
CREATE TABLE purchase_log4 (
    dt              varchar(255)
  , order_id        integer
  , user_id         varchar(255)
  , purchase_amount integer
);

-- Insert sample data
INSERT INTO purchase_log4
VALUES
    ('2018-01-01',    1, 'rhwpvvitou', 13900)
  , ('2018-02-08',   95, 'chtanrqtzj', 28469)
  , ('2018-03-09',  168, 'bcqgtwxdgq', 18899)
  , ('2018-04-11',  250, 'kdjyplrxtk', 12394)
  , ('2018-05-11',  325, 'pgnjnnapsc',  2282)
  , ('2018-06-12',  400, 'iztgctnnlh', 10180)
  , ('2018-07-11',  475, 'eucjmxvjkj',  4027)
  , ('2018-08-10',  550, 'fqwvlvndef',  6243)
  , ('2018-09-10',  625, 'mhwhxfxrxq',  3832)
  , ('2018-10-11',  700, 'wyrgiyvaia',  6716)
  , ('2018-11-10',  775, 'cwpdvmhhwh', 16444)
  , ('2018-12-10',  850, 'eqeaqvixkf', 29199)
  , ('2019-01-09',  925, 'efmclayfnr', 22111)
  , ('2019-02-10', 1000, 'qnebafrkco', 11965)
  , ('2019-03-12', 1075, 'gsvqniykgx', 20215)
  , ('2019-04-12', 1150, 'ayzvjvnocm', 11792)
  , ('2019-05-13', 1225, 'knhevkibbp', 18087)
  , ('2019-06-10', 1291, 'wxhxmzqxuw', 18859)
  , ('2019-07-10', 1366, 'krrcpumtzb', 14919)
  , ('2019-08-08', 1441, 'lpglkecvsl', 12906)
  , ('2019-09-07', 1516, 'mgtlsfgfbj',  5696)
  , ('2019-10-07', 1591, 'trgjscaajt', 13398)
  , ('2019-11-06', 1666, 'ccfbjyeqrb',  6213)
  , ('2019-12-05', 1741, 'onooskbtzp', 26024)
;

commit;

-- Select sample data
SELECT * FROM purchase_log4;

-- Calculate the sales per month and compare to the one of last year
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
    FROM purchase_log4
   GROUP BY dt
)
SELECT month
     , SUM(CASE year WHEN '2018' THEN purchase_amount END) AS amount_2018
     , SUM(CASE year WHEN '2019' THEN purchase_amount END) AS amount_2019
     , 100.0 * SUM(CASE year WHEN '2019' THEN purchase_amount END)
       / SUM(CASE year WHEN '2018' THEN purchase_amount END)
         AS rate
  FROM daily_purchase 
 GROUP BY month 
 ORDER BY month
;



--- Z chart for sales in 2019
WITH
daily_purchase AS (
  SELECT dt
       -- Extract year, month, date respectively
       -- if PostgreSQL, Hive, SparkSQL, Redshift, use substring
       -- if BigQuery, use substr
       , substring(dt, 1, 4) AS year
       , substring(dt, 6, 2) AS month
       , SUM(purchase_amount) AS purchase_amount
       , COUNT(order_id) AS orders
    FROM purchase_log4
   GROUP BY dt
)
, monthly_purchase AS (
  -- Monthly figure
  SELECT year 
       , month
       , SUM(purchase_amount) AS amount
    FROM daily_purchase 
   GROUP BY year, month 
)
, calc_index AS (
  SELECT year 
       , month
       , amount
       -- cumulative total
       , SUM(CASE WHEN year = '2019' THEN amount END)
           OVER(ORDER BY year, month ROWS UNBOUNDED PRECEDING)
           AS agg_amount
       -- Moving total
       , SUM(amount)
           OVER(ORDER BY year, month ROWS BETWEEN 11 PRECEDING AND CURRENT ROW)
           AS year_avg_amount
    FROM monthly_purchase
   ORDER BY year, month 
)
-- Select data for 2019
SELECT concat(year, '-', month) AS year_month
     , amount 
     , agg_amount 
     , year_avg_amount 
  FROM calc_index
 WHERE year = '2019'
 ORDER BY year_month
;

-- Aggregate data related with sales
WITH
daily_purchase AS (
  SELECT dt
       -- Extract year, month, date respectively
       -- if PostgreSQL, Hive, SparkSQL, Redshift, use substring
       -- if BigQuery, use substr
       , substring(dt, 1, 4) AS year
       , substring(dt, 6, 2) AS month
       , SUM(purchase_amount) AS purchase_amount
       , COUNT(order_id) AS orders
    FROM purchase_log4
   GROUP BY dt
)
, monthly_purchase AS (
  -- Monthly figure
  SELECT year 
       , month
       , SUM(orders) AS orders
       , AVG(purchase_amount) AS avg_amount
       , SUM(purchase_amount) AS monthly
    FROM daily_purchase 
   GROUP BY year, month 
)
SELECT concat(year, '-', month) AS year_month
     , orders
     , avg_amount 
     , monthly 
     , SUM(monthly)
         OVER(PARTITION BY year 
              ORDER BY monthly 
              ROWS UNBOUNDED preceding)
         AS agg_amount
     -- sales amount 12 months ago
     , LAG(monthly, 12)
         OVER(ORDER BY year, month)
         -- if SparkSQL
         -- OVER(ORDER BY year, month
         --      ROWS BETWEEN 12 PRECEDING AND 12 PRECEDING)
         AS last_year
     -- The rate compared to sales amount 12m ago
     , 100.0 * monthly / LAG(monthly, 12)
                           OVER(ORDER BY year, month)
         AS rate
  FROM monthly_purchase
 ORDER BY year_month
;
     
         

-- My Test for graph
WITH
daily_purchase AS (
  SELECT dt
       -- Extract year, month, date respectively
       -- if PostgreSQL, Hive, SparkSQL, Redshift, use substring
       -- if BigQuery, use substr
       , substring(dt, 1, 4) AS year
       , substring(dt, 6, 2) AS month
       , SUM(purchase_amount) AS purchase_amount
       , COUNT(order_id) AS orders
    FROM purchase_log4
   GROUP BY dt
)
SELECT CONCAT(year, '-', month) AS year_month 
     , SUM(purchase_amount) OVER(PARTITION BY year, month ORDER BY dt ROWS BETWEEN CURRENT ROW AND CURRENT ROW)
         AS monthly_figure
     , SUM(purchase_amount) OVER(PARTITION BY year ORDER BY dt ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) 
         AS cumulative_total
     , SUM(purchase_amount) OVER(ORDER BY year, month ROWS BETWEEN 11 PRECEDING AND CURRENT ROW) 
         AS moving_total
  FROM daily_purchase
; 
