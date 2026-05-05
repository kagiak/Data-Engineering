select
  Id as PAYER_Id,
  NAME,
  ADDRESS,
  CITY,
  STATE_HEADQUARTERED,
  ZIP,
  PHONE
from {{ ref('stg_payers') }}
