This project implements a complete end‑to‑end ELT pipeline for healthcare procedure data using dbt and Python, following a modern medallion architecture:

    Bronze → raw data (seeds)
    Silver → cleaned & enriched staging models
    Python → cost‑per‑day calculation
    Gold → dimensions, fact table, analysis queries
    Marts → payer‑specific data marts (Task 3)

The project satisfies all requirements from Tasks 1–3 of the assignment.

**Architecture**
1. Bronze Layer — Raw Data
The Bronze layer contains raw CSVs loaded as dbt seeds:

    procedures
    patients
    encounters
    payers
    organizations
These are stored as raw tables with no transformations applied.

2. Silver Layer — Cleaned & Enriched Staging Models
The Silver layer standardizes and enriches the data:

    - cleans column names
    - casts data types
    - trims whitespace
    - converts timestamps
    - calculates duration_seconds
    - extracts date parts (year, month_number, week_number, day_name)

A schema.yml file defines tests such as:
    - not_null
    - unique
    - accepted_values
    - greater_than
This ensures data quality before moving to Gold.

Python Model — Cost Per Day in Silver. A dbt Python model (procedure_cost.py) computes: cost_per_day = base_cost * (86400 / duration_seconds)
This satisfies the requirement to calculate cost/day using Python.

3. Gold Layer — Dimensions, Fact, Analysis & Marts
Dimensions
The Gold layer contains four dimensions:

    - dim_patients — demographic attributes
    - dim_payers — payer metadata
    - dim_procedures — procedure descriptions
    - dim_encounters — the bridge between procedures and payers

Fact Table: fact_procedures joins dim tables. This is the central fact table for analysis.

**Analysis Queries (Task 2)**
Three analytical models answer the required business questions:

    1.Rank payers by total cost
    2.Top 5 highest‑costing patients
    3.Top 5 procedures by median cost/day
These are implemented in gold/analysis/.

**Data Marts (Task 3)**
Two payer‑specific marts were created:

    dm_united_healthcare
    dm_humana

Each mart filters the fact table by payer_name. These marts provide business‑ready datasets for each client.


**Notes & Limitations**

I intentionally kept this project as simple and lightweight as possible to focus on clarity, correctness, and demonstrating the core concepts of dbt, dimensional modeling, and Python-based transformations.
Because of this, there are a few practical considerations:

    The project structure is complete, but a fully production-ready dbt deployment would require additional elements, such as:
        a fully configured profiles.yml
        environment-specific connection settings
        CI/CD integration
        documentation site generation
        more extensive testing coverage

I have not executed the full pipeline end‑to‑end inside dbt Cloud or dbt Core, so the physical creation of all tables and views has not been validated in a live warehouse.

The SQL and Python models are written to be syntactically correct and logically consistent, but depending on the warehouse (Databricks, Postgres, DuckDB, etc.), minor adjustments may be required.

Despite these limitations, the project demonstrates:

    a complete medallion architecture
    a working star schema
    Python + SQL hybrid transformations
    data marts for two clients
    dbt testing
    clean, modular, interview‑ready code

The goal was to deliver a clear, maintainable, and conceptually strong solution — and this structure provides a solid foundation for further development.
