with raw as (
    select * from {{ source('project1','addresses') }}
    ),
    final as (
        select address_id,
        address,
        zipcode,
        state,
        country
        from raw
    )
select *
from final