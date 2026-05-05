select
    payer,
    sum(base_cost) as total_cost_paid
from {{ ref('stg_procedures_cost') }}
group by payer
order by total_cost_paid desc;
