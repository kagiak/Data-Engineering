select
    code,
    percentile_approx(cost_per_day, 0.5) as median_cost_per_day
from {{ ref('stg_procedures_cost') }}
group by code
order by median_cost_per_day desc
limit 5;
