with proc as (
    select *
    from {{ ref('dim_procedures') }}
),

enc as (
    select
        ENCOUNTER_ID,
        PATIENT_ID,
        PAYER_ID
    from {{ ref('dim_encounters') }}
),

payers as (
    select
        PAYER_ID,
        PAYER_NAME
    from {{ ref('dim_payers') }}
)

select
    p.PATIENT,
    p.ENCOUNTER,
    p.CODE,
    p.BASE_COST,
    p.DURATION_SECONDS,
    p.COST_PER_DAY,
    p.YEAR,
    p.MONTH_NUMBER,
    p.WEEK_NUMBER,
    p.DAY_NAME,
    e.PAYER_ID,
    pay.PAYER_NAME
from proc p
left join enc e
  on p.ENCOUNTER = e.ENCOUNTER_ID
left join payers pay
  on e.PAYER_ID = pay.PAYER_ID
