with raw as (
    select * from {{ source('project1','users') }}
    ),
    final as (
        select user_id,
        address_id,
        first_name,
        last_name,
        email,
        phone_number,
        created_at,
        updated_at
        from raw
    )
select *
from final