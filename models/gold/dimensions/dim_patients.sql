select distinct
    Id as PATIENT_ID,
    FIRST,
    LAST,
    BIRTHDATE,
    GENDER
from {{ ref('stg_patients') }}
