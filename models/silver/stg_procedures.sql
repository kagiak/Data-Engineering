with cleaned as (
    select
        cast(START as timestamp) as START,                   -- Standardize timestamps
        cast(STOP as timestamp) as STOP,                     -- Standardize timestamps
        try_cast(PATIENT as string) as PATIENT,              -- Ensure IDs are strings
        try_cast(ENCOUNTER as string) as ENCOUNTER,          -- Ensure IDs are strings
        try_cast(CODE as integer) as CODE,                   -- Convert numeric columns
        initcap(trim(DESCRIPTION)) as DESCRIPTION,           -- Trim whitespace and standardize casing
        try_cast(BASE_COST as integer) as BASE_COST,          -- Convert numeric columns
        try_cast(REASONCODE as integer) as REASONCODE,        -- Convert numeric columns
        initcap(trim(REASONDESCRIPTION)) as REASONDESCRIPTION -- Trim whitespace and standardize casing
    from {{ ref('procedures') }}
),

with_duration as (
    select
        *,
        unix_timestamp(stop) - unix_timestamp(start) as DURATION_SECONDS  -- Find duration in seconds
    from cleaned
),

with_date_parts as (
    select
        *,
        year(start) as YEAR,
        month(start) as MONTH_NUMBER,
        date_format(start, 'MMMM') as MONTH_NAME,
        weekofyear(start) as WEEK_NUMBER,
        date_format(start, 'EEEE') as DAY_NAME
    from with_duration
)

select distinct * from with_date_parts
