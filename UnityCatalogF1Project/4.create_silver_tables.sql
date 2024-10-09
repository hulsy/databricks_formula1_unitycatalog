-- Databricks notebook source
-- MAGIC %md
-- MAGIC ###Create Managed Tables in the Silver Schema

-- COMMAND ----------

DROP TABLE IF EXISTS formula_dev.silver.drivers;

CREATE TABLE IF NOT EXISTS formula_dev.silver.drivers
AS
SELECT driverId AS driver_id,
        driverRef AS driver_ref,
        number,
        code,
        concat(name.forename, ' ', name.surname) AS name,
        dob,
        nationality,
        current_timestamp() AS ingestion_date
  FROM formula_dev.bronze.drivers;

-- COMMAND ----------

DROP TABLE IF EXISTS formula_dev.silver.results;

CREATE TABLE IF NOT EXISTS formula_dev.silver.results
AS
SELECT  resultId AS result_id,
        raceId AS race_id,
        driverId AS driver_id,
        constructorId AS constructor_id,
        number,
        grid,
        position,
        positionText AS position_text,
        positionOrder AS position_order,
        points,
        laps,
        time,
        milliseconds,
        fastestLap AS fastest_lap,
        rank,
        fastestLapTime AS fastest_lap_time,
        fastestLapSpeed AS fastest_lap_speed,
        statusId,
        current_timestamp() AS ingestion_date
  FROM formula_dev.bronze.results;