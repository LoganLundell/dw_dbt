{{ config(
    materialized = 'table',
    schema = 'oliver_dw'
    )
}}

SELECT
Store_ID as Store_Key,
Store_ID,
Store_Name,
Street,
City,
State
FROM {{ source('oliver_landing', 'store') }}