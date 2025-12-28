SELECT * 

FROM {{ ref('int_orderdetails') }}
JOIN {{ ref('int_customer') }}

USING (CustID)

ORDER BY CustID asc