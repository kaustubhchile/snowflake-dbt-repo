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
    c.FIRST_NAME,
    c.LAST_NAME,
    c.CUSTOMER_ID,
    min(o.ORDER_DATE) as first_order,
    max(o.ORDER_DATE) as most_recent_order
    from customers c
    left join orders o
    on c.CUSTOMER_ID=o.CUSTOMER_ID
    group by c.FIRST_NAME, c.LAST_NAME, c.CUSTOMER_ID
),
payment_details as (
    select o.Customer_ID,
    sum(p.Sales_Amount) as Total_Amount
    from payments p 
    left join orders o 
    on p.ORDER_ID=o.ORDER_ID
    group by o.Customer_ID
)

select * from payment_details