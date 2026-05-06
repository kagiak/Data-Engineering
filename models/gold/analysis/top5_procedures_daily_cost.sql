with procedure_stats as (
    select
        fp.CODE,
        dp.DESCRIPTION,
        percentile_approx(fp.COST_PER_DAY, 0.5) as MEDIAN_COST_PER_DAY
    from {{ ref('fact_procedures') }} as fp
    left join {{ ref('dim_procedures') }} as dp
      on fp.CODE = dp.CODE
    group by fp.CODE, dp.DESCRIPTION
)

select
    CODE,
    DESCRIPTION,
    MEDIAN_COST_PER_DAY
from procedure_stats
order by MEDIAN_COST_PER_DAY desc
limit 5
