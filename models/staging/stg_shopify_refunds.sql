with
    source as (select * from {{ source("shopify", "shopify_refunds") }}),

    refunds as (

        select
            -- ids
            refund_id,
            order_id,
            customer_id,
            product_id,

            -- numerics
            refund_quantity,
            refund_amount,

            -- dates
            refund_date
        from source

    )

select *
from refunds
