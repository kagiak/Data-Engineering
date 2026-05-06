from pyspark.sql import functions as F

def model(dbt, session):
    
    # configure table
    dbt.config(materialized="table", alias="procedures_cost")
    # load input table
    df = dbt.ref("stg_procedures")
    
    # Compute cost per day 
    # df = df.withColumn(
    #     "COST_PER_DAY",
    #     F.col("BASE_COST") * (F.lit(86400) / F.col("DURATION_SECONDS"))
    # )
    
    # filter table
    filtered_df = df.filter(df.COST_PER_DAY <= 30000)

    return filtered_df
