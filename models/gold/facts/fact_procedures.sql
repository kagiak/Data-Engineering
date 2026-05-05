with proc as (
    select *
    from {{ ref('procedure_cost') }}
),

enc as (
    select
        Id as encounter_id,
        PATIENT as patient_id,
        PAYER as payer_id
    from {{ ref('stg_encounters') }}
),

payers as (
    select
        Id as payer_id,
        NAME as payer_name
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
    e.payer_id,
    pay.payer_name
from proc p
left join enc e
  on p.ENCOUNTER = e.encounter_id
left join payers pay
  on e.payer_id = pay.payer_id
