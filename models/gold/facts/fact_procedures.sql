with proc as (
    select *
    from {{ ref('procedure_cost') }}
),

enc as (
    select encounter_id, patient_id, payer_id
    from {{ ref('stg_encounters') }}
)

select
    p.procedure_id,
    p.patient,
    p.encounter,
    p.code,
    p.base_cost,
    p.duration_seconds,
    p.cost_per_day,
    p.year,
    p.month_number,
    p.week_number,
    p.day_name,
    e.payer_id
from proc p
left join enc e
  on p.encounter = e.encounter_id
