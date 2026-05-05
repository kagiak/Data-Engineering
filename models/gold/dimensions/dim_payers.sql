select distinct
    Id as PAYER_Id,
    NAME as PAYER_NAME,
    payer_type
from {{ ref('stg_payers') }}
