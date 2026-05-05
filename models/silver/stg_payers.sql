select
  Id,
  NAME,
  ADDRESS,
  CITY,
  STATE_HEADQUARTERED,
  ZIP,
  PHONE
from {{ ref('stg_payers') }}
