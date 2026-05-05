select 
  Id,
  NAME,
  ADDRESS,
  CITY,
  STATE,
  ZIP,
  LAT,
  LON
from {{ ref('organizations') }}
