{{ config(
    materialized = 'table',
    schema = 'oliver_dw'
    )
}}

SELECT
Employee_ID as Employee_Key,
Employee_ID,
First_Name,
Last_Name,
Email,
Phone_Number,
Hire_Date,
Position
FROM {{ source('oliver_landing', 'employee') }}