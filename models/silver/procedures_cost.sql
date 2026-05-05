def model(dbt, session):

    df = dbt.ref("stg_procedures").to_pandas()
    SECONDS_PER_DAY = 86400
    df["COST_PER_DAY"] = df["base_cost"] * (SECONDS_PER_DAY / df["DURATION_SECONDS"])

    return df
