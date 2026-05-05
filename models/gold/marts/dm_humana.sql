select *
from {{ ref('fact_procedures') }}
where lower(payer_name) like '%humana%'
