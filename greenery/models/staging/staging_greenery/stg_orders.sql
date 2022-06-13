with raw as (
    select * from {{ source('project1','orders') }}
    ),
    final as (
        select order_id,
        promo_id,
        user_id,
        address_id,
        tracking_id,
        order_cost,
        shipping_cost,
        shipping_service,
        order_total,
        created_at,
        estimated_delivery_at,
        delivered_at,
        status
        from raw
    )
select *
from final