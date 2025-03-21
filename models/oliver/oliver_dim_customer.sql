{{ config(
    materialized = 'table',
    schema = 'oliver_dw'
    )
}}

SELECT
Customer_ID as Cust_Key,
Customer_ID,
First_Name,
Last_Name,
Email,
Phone_Number,
State
FROM {{ source('oliver_landing', 'customer') }}