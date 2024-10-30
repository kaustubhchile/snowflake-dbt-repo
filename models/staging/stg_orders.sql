with raw as (
    select * from {{source("Snowflake_Source","raw_orders")}}
),

final as(
    select ID as Order_ID,
    USER_ID as CUSTOMER_ID,
    ORDER_DATE,
    STATUS
    from raw
)

select * from final