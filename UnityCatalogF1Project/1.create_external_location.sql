-- Databricks notebook source
CREATE EXTERNAL LOCATION IF NOT EXISTS formulaoneextdl_bronze
  URL 'abfss://bronze@dlformula1ext.dfs.core.windows.net/'
  WITH (STORAGE CREDENTIAL formulaoneext_storage_credential);

-- COMMAND ----------

DESCRIBE EXTERNAL LOCATION formulaoneextdl_bronze

-- COMMAND ----------

-- MAGIC %fs
-- MAGIC ls "abfss://bronze@dlformula1ext.dfs.core.windows.net/"

-- COMMAND ----------

CREATE EXTERNAL LOCATION IF NOT EXISTS formulaoneextdl_silver
  URL 'abfss://silver@dlformula1ext.dfs.core.windows.net/'
  WITH (STORAGE CREDENTIAL formulaoneext_storage_credential);

-- COMMAND ----------

CREATE EXTERNAL LOCATION IF NOT EXISTS formulaoneextdl_gold
  URL 'abfss://gold@dlformula1ext.dfs.core.windows.net/'
  WITH (STORAGE CREDENTIAL formulaoneext_storage_credential);