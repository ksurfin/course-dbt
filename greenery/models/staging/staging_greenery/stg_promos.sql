with raw as (
    select * from {{ source('project1','promos') }}
    ),
    final as (
        select promo_id,
        discount,
        status
        from raw
    )
select *
from final