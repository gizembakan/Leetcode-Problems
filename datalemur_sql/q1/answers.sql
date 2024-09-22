--1th Method/CASE
SELECT 
  SUM --COUNT also can be used throught the code.
  (
    CASE 
      WHEN device_type = 'laptop' THEN 1
    END
  ) AS laptop_views,
  SUM
  (
    CASE
      WHEN device_type IN ('tablet', 'phone') THEN 1
    END
  ) AS mobile_views
FROM viewership;

--2nd Method/SUBQUERY
SELECT 
  (
    SELECT 
      COUNT(*) 
    FROM viewership 
      WHERE device_type = 'laptop'
  ) AS laptop_views,
  (
    SELECT 
      COUNT(*) 
    FROM viewership 
      WHERE device_type IN ('phone', 'tablet')
  ) AS mobile_views

--3rd Method/CASE & UNION ALL
SELECT 
  SUM
  (
    CASE 
      WHEN device_type = 'laptop' THEN 1
    END
  ) AS laptop_views,
  0 AS mobile_views
FROM viewership;

UNION ALL

SELECT
  0 as laptop_views,
  SUM
  (
    CASE
      WHEN device_type IN ('tablet', 'phone') THEN 1
    END
  ) AS mobile_views
FROM viewership;

--4th Method/COUNT & GROUP BY
-- These query will not give the same exact columns as a result set.
SELECT
  device_type,
  COUNT(*) AS view_count_by_device_type
FROM viewership
GROUP BY device_type;
