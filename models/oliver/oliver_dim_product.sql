{{ config(
    materialized = 'table',
    schema = 'oliver_dw'
    )
}}

SELECT
Product_ID as Product_Key,
Product_ID,
Product_Name,
Description
FROM {{ source('oliver_landing', 'product') }}