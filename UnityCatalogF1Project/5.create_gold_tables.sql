-- Databricks notebook source
-- MAGIC %md
-- MAGIC ###Create Managed Table in Gold Schema

-- COMMAND ----------

DROP TABLE IF EXISTS formula_dev.gold.driver_wins;

CREATE TABLE IF NOT EXISTS formula_dev.gold.driver_wins
AS
SELECT d.name, count(1) AS number_of_wins
  FROM formula_dev.silver.drivers d
  JOIN formula_dev.silver.results r
    ON (d.driver_id = r.driver_id)
WHERE r.position = 1
GROUP BY d.name;

-- COMMAND ----------

SELECT * FROM formula_dev.gold.driver_wins ORDER BY number_of_wins DESC;  