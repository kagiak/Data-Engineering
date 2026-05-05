select
  Id as PAYER_Id,
  NAME as PAYER_NAME,
  ADDRESS,
  CITY,
  STATE_HEADQUARTERED,
  ZIP,
  PHONE
from {{ ref('stg_payers') }}
