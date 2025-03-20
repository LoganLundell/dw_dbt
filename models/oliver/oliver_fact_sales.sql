{{ config(
    materialized = 'table',
    schema = 'oliver_dw'
) }}

SELECT
    cu.Cust_Key,
    e.Employee_Key,
    d.date_key,
    p.Product_Key,
    s.Store_Key,
    ol.Quantity,
    ol.Unit_Price,
    (ol.Quantity * ol.Unit_Price) AS Total_Sales
FROM {{ source('oliver_landing', 'orderline') }} ol
INNER JOIN {{ source('oliver_landing', 'orders') }} o ON ol.Order_ID = o.Order_ID
INNER JOIN {{ ref('oliver_dim_product') }} p ON p.Product_ID = ol.Product_ID
INNER JOIN {{ ref('oliver_dim_customer') }} cu ON o.Customer_ID = cu.Customer_ID
INNER JOIN {{ ref('oliver_dim_employee') }} e ON o.Employee_ID = e.Employee_ID
INNER JOIN {{ ref('oliver_dim_date') }} d ON d.Date_day = o.Order_Date
INNER JOIN {{ ref('oliver_dim_store') }} s ON o.Store_ID = s.Store_ID

