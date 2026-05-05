select distinct
    patient_id,
    name,
    birthdate,
    gender
from {{ ref('stg_patients') }}
