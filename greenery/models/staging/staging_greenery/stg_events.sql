with raw as (
    select * from {{ source('project1','events') }}
    ),
    final as (
        select event_id,
        session_id,
        user_id,
        event_type,
        page_url,
        created_at,
        order_id,
        product_id
        from raw
    )
select *
from final