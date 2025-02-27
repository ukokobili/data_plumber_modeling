with
    orders as (select * from {{ ref("int_shopify_orders") }}),

    -- compute for refunds
    refunds as (
        select
            -- ids
            order_id,
            customer_id,

            -- aggregation
            sum(refund_quantity) as refunded_quantity,
            sum(refund_amount) as refunded_amount

        from {{ ref("stg_shopify_refunds") }}
        -- exclude product_id = 2
        where product_id != 2
        group by order_id, customer_id
    ),

    -- compute for first time customers 
    first_time_customer as (
        select
            -- ids
            customer_id,

            -- aggregation
            min(order_date) as first_order_date
        from orders
        group by customer_id
    ),

    -- final aggregation
    final_result as (
        select
            -- ids
            orders.order_id,
            orders.customer_id,

            -- dates
            orders.order_date,

            -- New vs. Returning Customer 
            case
                when
                    datediff(
                        'day', orders.order_date, first_time_customer.first_order_date
                    )
                    <= 30
                then 'New Customer'
                else 'Returning Customer'
            end as customer_type,

            -- aggregation
            orders.total_quantity_sold,
            orders.total_revenue,
            coalesce(refunds.refunded_quantity, 0) as refund_quantity,
            coalesce(refunds.refunded_amount, 0) as refund_amount,
            orders.total_quantity_sold
            - coalesce(refunds.refunded_quantity, 0) as net_quantity_sold,
            orders.total_revenue
            - coalesce(refunds.refunded_amount, 0) as net_revenue

        from orders
        left join refunds on orders.order_id = refunds.order_id
        left join
            first_time_customer on orders.customer_id = first_time_customer.customer_id
    )

select *
from final_result
