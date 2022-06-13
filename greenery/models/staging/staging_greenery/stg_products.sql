with raw as (
    select * from {{ source('project1','products') }}
    ),
    final as (
        select product_id,
        name,
        price,
        inventory
        from raw
    )
select *
from final