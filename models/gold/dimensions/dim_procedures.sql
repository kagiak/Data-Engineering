select distinct
  PATIENT,
  ENCOUNTER,
  CODE,
  BASE_COST,
  DURATION_SECONDS,
  COST_PER_DAY,
  YEAR,
  MONTH_NUMBER,
  WEEK_NUMBER,
  DAY_NAME
from {{ ref('stg_procedures') }}
