select
    patient,
    encounter,
    code,
    base_cost,
    duration_seconds,
    cost_per_day,
    year,
    month_number,
    month_name,
    week_number,
    day_name
from {{ ref('procedures_cost') }}
