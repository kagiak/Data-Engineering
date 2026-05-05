select distinct
    PATIENT_Id,
    FIRST,
    LAST,
    BIRTHDATE,
    GENDER
from {{ ref('stg_patients') }}
