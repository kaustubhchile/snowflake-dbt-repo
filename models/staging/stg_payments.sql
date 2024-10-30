with raw as (
    select * from {{source("Snowflake_Source","raw_payments")}}
),

final as(
    select ID as Payment_ID,
    ORDER_ID,
    PAYMENT_METHOD as Payment_Mode,
    AMOUNT/100 as SALES_AMOUNT
    from raw
)

select * from final