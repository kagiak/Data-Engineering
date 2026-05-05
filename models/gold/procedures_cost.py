def model(dbt, session):

    df = dbt.ref("stg_procedures").to_pandas()
    SECONDS_PER_DAY = 86400
    df["cost_per_day"] = df["base_cost"] * (SECONDS_PER_DAY / df["duration_seconds"])

    return df
