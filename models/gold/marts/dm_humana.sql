with humana as (
    select payer_id
    from {{ ref('dim_payers') }}
    where lower(payer_name) like '%humana%'
)

select
    fp.*
from {{ ref('fact_procedures') }} fp
join humana h
  on fp.payer_id = h.payer_id
