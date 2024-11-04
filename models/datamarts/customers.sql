{{
    config(
        database='GOLDER_LAYER_DB',
        schema='analytics'
    )
}}

with customers as (
    select * from {{ref('stg_customers')}}
),

orders as (
    select * from {{ref('stg_orders')}}
),

payments as (
    select * from {{ref('stg_payments')}} 
),

customer_level_details as (
    select 
    c.CUSTOMER_ID,
    min(o.ORDER_DATE) as first_order,
    max(o.ORDER_DATE) as most_recent_order
    from customers c
    left join orders o
    on c.CUSTOMER_ID=o.CUSTOMER_ID
    group by c.CUSTOMER_ID
),
payment_details as (
    select o.Customer_ID,
    sum(p.Sales_Amount) as Total_Amount
    from payments p 
    left join orders o 
    on p.ORDER_ID=o.ORDER_ID
    group by o.Customer_ID
),
final as (
    select cl.*,pd.Total_Amount
    from customer_level_details cl
    left join payment_details pd 
    on cl.CUSTOMER_ID=pd.Customer_ID
    order by cl.CUSTOMER_ID
)

select * from final