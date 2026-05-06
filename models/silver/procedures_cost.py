def model(dbt, session):
    
    -- configure table
    dbt.config(materialized="table", alias="procedures_cost")
    -- load input table
    df = dbt.ref("stg_procedures")
    -- filter table
    filtered_df = df.filter(df.COST_PER_DAY > 30000)

    return filtered_df
