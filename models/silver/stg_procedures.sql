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
    from {{ ref('procedures_raw') }}
),

with_duration as (
    select
        *,
        unix_timestamp(stop) - unix_timestamp(start) as duration_seconds  -- Find duration in seconds
    from cleaned
),

with_date_parts as (
    select
        *,
        year(start) as year,
        month(start) as month_number,
        date_format(start, 'MMMM') as month_name,
        weekofyear(start) as week_number,
        date_format(start, 'EEEE') as day_name
    from with_duration
)

select * from with_date_parts
