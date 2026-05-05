select
    patient,
    sum(base_cost) as total_cost
from {{ ref('procedures_cost') }}
group by patient
order by total_cost desc
limit 5;
