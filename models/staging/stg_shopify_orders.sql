with
    source as (select * from {{ source("shopify", "shopify_orders") }}),

    orders as (
        select
            -- ids
            order_id,
            customer_id,

            -- Extract each line item as JSON
            regexp_extract_all(line_items, '\{[^}]+\}') as items,

            -- dates
            order_date,
        from source
    )

select *
from orders
