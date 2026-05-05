with patient_costs as (
    select
        fp.PATIENT as PATIENT_ID,
        dp.FIRST,
        dp.LAST,
        sum(fp.BASE_COST) as TOTAL_COST
    from {{ ref('fact_procedures') }} fp
    left join {{ ref('dim_patients') }} dp
      on fp.PATIENT = dp.PATIENT_ID
    group by fp.PATIENT, dp.FIRST, dp.LAST
)

select
    PATIENT_ID,
    FIRST,
    LAST,
    TOTAL_COST
from patient_costs
order by TOTAL_COST desc
limit 5
