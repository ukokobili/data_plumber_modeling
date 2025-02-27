{{
    config(
        materialized="ephemeral",
    )
}}

with
    orders as (select * from {{ ref("stg_shopify_orders") }}),

    flattened_items as (
        select
            -- ids
            order_id,
            customer_id,

            -- order details
            unnest(items) as item_json,
            -- dates
            order_date
        from orders
    ),

    parsed_items as (
        select
            -- ids
            order_id,
            customer_id,

            -- order details
            cast(json_extract(item_json, '$.product_id') as integer) as product_id,
            cast(json_extract(item_json, '$.quantity') as integer) as quantity,
            cast(json_extract(item_json, '$.total_price') as decimal(10, 2)) as revenue,

            -- dates
            order_date
        from flattened_items
        -- exclude product_id = 2
        where cast(json_extract(item_json, '$.product_id') as integer) != 2
    ),

    order_metrics as (
        select
            -- ids
            order_id,
            customer_id,

            -- dates
            order_date,

            -- aggregation
            sum(quantity) as total_quantity_sold,
            sum(revenue) as total_revenue
        from parsed_items {{ dbt_utils.group_by(n=3) }}
    )

select *
from order_metrics
