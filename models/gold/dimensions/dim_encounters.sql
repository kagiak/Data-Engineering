select distinct
    Id as ENCOUNTER_ID,
    PATIENT as PATIENT_ID,
    PAYER as PAYER_ID,
    ENCOUNTERCLASS,
    START,
    STOP,
    BASE_ENCOUNTER_COST,
    TOTAL_CLAIM_COST,
    PAYER_COVERAGE
from {{ ref('stg_encounters') }}
