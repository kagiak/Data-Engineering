select distinct
    CODE,
    DESCRIPTION,
    REASONDESCRIPTION
from {{ ref('stg_procedures') }}
