select 
  try_cast(Id as string) as Id,
  cast(START as timestamp) as START,
  cast(STOP as timestamp) as STOP,
  try_cast(PATIENT as string) as PATIENT,
  ORGANIZATION,
  PAYER,
  ENCOUNTERCLASS,
  try_cast(CODE as integer) as CODE, 
  initcap(trim(DESCRIPTION)) as DESCRIPTION,
  BASE_ENCOUNTER_COST,
  TOTAL_CLAIM_COST,
  PAYER_COVERAGE,
  try_cast(REASONCODE as integer) as REASONCODE,
  nitcap(trim(REASONDESCRIPTION)) as REASONDESCRIPTION
from {{ ref('encounters_raw') }} 
