select
    PAYER_NAME,
    sum(BASE_COST) as TOTAL_COST
from {{ ref('fact_procedures') }}
group by PAYER_NAME
order by TOTAL_COST desc
