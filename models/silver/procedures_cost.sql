def model(dbt, session):
    
    -- configure table
    dbt.config(materialized="table", alias="procedures_cost")
    -- load input table
    df = dbt.ref("stg_procedures")
    pdf = df.to_pandas()

    -- calculate cost per day
    SECONDS_PER_DAY = 86400
    pdf["COST_PER_DAY"] = pdf["base_cost"] * (SECONDS_PER_DAY / pdf["DURATION_SECONDS"])

    return pdf
