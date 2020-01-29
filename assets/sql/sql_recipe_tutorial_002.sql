/*************************************
 *
 * SQL Recipe for Analysis Tutorial #2
 * 
 *************************************
 * @version	1.0.0	2020-01-27 17:37:10	dorbae	Initialize
 * @author dorbae(dorbae.io@gmail.com)
 */
-- DROP TABLE IF EXISTS mst_users;

-- Create user master table
CREATE TABLE mst_users(
    user_id         varchar(255)
  , register_date   varchar(255)
  , register_device integer
);

-- Insert sample data
INSERT INTO mst_users
VALUES
    ('U001', '2020-08-26', 1)
  , ('U002', '2016-08-26', 2)
  , ('U003', '2016-08-27', 3)
;

-- Select sample data
SELECT *
  FROM mst_users
;

-- Query for replacing code with label
SELECT user_id
     , CASE WHEN register_device = 1 THEN 'Desktop'
            WHEN register_device = 2 THEN 'Smartphone'
            WHEN register_device = 3 THEN 'Application'
            -- ELSE (Default)
            END AS device_name
  FROM mst_users
;


-- DROP TABLE IF EXISTS access_log ;
-- Create access log table
CREATE TABLE access_log (
    stamp    varchar(255)
  , referrer text
  , url      text
);

-- Insert sample data
INSERT INTO access_log 
VALUES
    ('2020-01-27 12:02:00', 'https://www.other.com/path1/index.php?k1=v1&k2=v2#Ref1', 'http://www.example.com/video/detail?id=001')
  , ('2020-01-27 12:02:01', 'https://www.other.net/path1/index.php?k1=v1&k2=v2#Ref1', 'http://www.example.com/video#ref'          )
  , ('2020-01-27 12:02:01', 'https://www.other.com/'                                , 'http://www.example.com/book/detail?id=002' )
;

-- Select sample data
SELECT *
  FROM access_log
;

-- Extract the domain of referrer
SELECT stamp
     , substring(referrer from 'https?://([^/]*)') AS referrer_domain
     -- if Redshift
     -- , regexp_replace(regexp_substr(referrer, 'https?://[^/]*'), (https?://', '') AS referrer_domain
     -- if Hive or SparkSQL
     -- , parse_url(refferer, 'HOST') AS referrer_domain
     -- if BigQuery
     -- , host(referrer) AS referrer_domain
  FROM access_log 
;


-- Extract the path and query parameters from URL
SELECT stamp
     , url
     , substring(url from '//[^/]+([^?#]+)') AS path 
     , substring(url from 'id=([^%]*)') AS id
     -- if Redshift
     -- , regexp_replace(regexp_substr(referrer, '//[^/]+([^?#]+)'), '//[^/]+', '') AS path
     -- , regexp_replace(regexp_substr(referrer, 'id=([^%]*)', 'id=', '') AS id
     -- if Hive or SparkSQL
     -- , parse_url(refferer, 'PATH') AS path
     -- , parse_url(refferer, 'QUERY') AS id
     -- if BigQuery
     -- , parse_url(url, '//[^/]+([^?#]+)') AS path 
     -- , parse_url(url, 'id=([^%]*)') AS id
  FROM access_log 
;

-- Extract path hierarchy
SELECT stamp
     , url
     , split_part(substring(url from '//[^/]+([^?#]+)'), '/', 2) AS path1
     , split_part(substring(url from '//[^/]+([^?#]+)'), '/', 3) AS path2
     -- if Redshift
     -- , split_part(regexp_replace(regexp_substr(url, '//[^/]+([^?#]+'), '//[^/]+([^?#]+', ''), '/' 2) AS path1
     -- , split_part(regexp_replace(regexp_substr(url, '//[^/]+([^?#]+'), '//[^/]+([^?#]+', ''), '/' 3) AS path2
     -- if Hive or SparkSQL (Index number starts from 0)
     -- , split(parse_url(url, 'PATH'), '/')[1] AS path1
     -- , split(parse_url(url, 'PATH'), '/')[2] AS path2
     -- if BigQuery
     -- , split(regexp_extract(url, '//[^/]+([^?#]+)'), '/')[SAFE_ORDINAL(2)] AS path1
     -- , split(regexp_extract(url, '//[^/]+([^?#]+)'), '/')[SAFE_ORDINAL(3)] AS path2
  FROM access_log 
;


-- Extract current date and current timestamp
SELECT 
     -- if PostgreSQL, Hive, BigQuery
       CURRENT_DATE as dt
     , CURRENT_TIMESTAMP as stamp
     -- if Hive, SparkSQL, BigQuery
     --   CURRENT_DATE() as dt
     -- , CURRENT_TIMESTAMP() as stamp
     -- if Redshift
     --   CURRENT_DATE as dt
     -- , GETDATE() as stamp
     -- if PostgreSQL, timestamp without timezone
     , LOCALTIMESTAMP as local_stamp
;
     

-- Convert string data type into date/timestamp
SELECT 
     -- if PostgreSQL, Hive, SparkSQL, Redshift, BigQuery
       CAST('2020-01-27' AS date) AS dt
     , CAST('2020-01-27 23:15:10' AS timestamp) AS stamp
     -- if Hive, BigQuery
     --   date('2020-01-27') AS dt
     -- , timestamp('2020-01-27 23:15:10') AS stamp
     -- if PostgreSQL, Hive, SparkSQL, Redshift, BigQuery. * Value must be not column name but constant value
     --   date('2020-01-27') AS dt
     -- , timestamp('2020-01-27 23:15:10') AS stamp
     -- if PostgreSQL, Redshift
     , '2020-01-27'::date AS dt2
     , '2020-01-27 23:15:10'::timestamp AS stamp2
;

-- Extract a specific field from date/timestamp
SELECT stamp
     -- if PostgreSQL, Redshift, BigQuery
     , EXTRACT(YEAR from stamp) AS year
     , EXTRACT(MONTH from stamp) AS month
     , EXTRACT(DAY from stamp) AS day
     , EXTRACT(HOUR from stamp) AS hour
     -- if Hive, SparkSQL
     -- , YEAR(stamp) AS year
     -- , MONTH(stamp) AS month
     -- , DAY(stamp) AS day
     -- , HOUR(stamp) AS hour
  FROM (SELECT CAST('2020-01-27 23:26:39' AS timestamp) AS stamp) AS t
;


-- DROP TABLE IF EXISTS purchase_log_with_coupon;
-- Create purchage log table
CREATE TABLE purchase_log_with_coupon (
    purchase_id varchar(255)
  , amount      integer
  , coupon      integer
);

-- Insert sample data
INSERT INTO purchase_log_with_coupon
VALUES
    ('10001', 3280, NULL)
  , ('10002', 4650,  500)
  , ('10003', 3870, NULL)
;

-- Select sample data
SELECT *
  FROM purchase_log_with_coupon 
;

-- Calculate the total sales except for coupon
SELECT purchase_id
     , amount
     , coupon
     , amount - coupon AS discount_amount_invalid
     , amount - COALESCE(coupon, 0) AS discount_amount_valid
  FROM purchase_log_with_coupon 
;
