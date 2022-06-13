with raw as (
    select * from {{ source('project1','order_items') }}
    ),
    final as (
        select order_id,
        product_id,
        quantity
        from raw
    )
select *
from final