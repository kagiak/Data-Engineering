with united as (
    select payer_id
    from {{ ref('dim_payers') }}
    where lower(payer_name) like '%united%'
)

select
    fp.*
from {{ ref('fact_procedures') }} fp
join united u
  on fp.payer_id = u.payer_i
