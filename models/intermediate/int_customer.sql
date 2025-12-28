SELECT 
CUSTOMER_ID AS  CustID, 
FULL_NAME as CustomerName,
COALESCE(SUM(POINTS_EARNED), 0) as Point_Earned_So_Far

FROM {{ ref('stg_customers') }}
LEFT JOIN {{ ref('stg_loyaltypoint') }}
USING (CUSTOMER_ID)

GROUP BY FULL_NAME, CUSTOMER_ID

ORDER BY CustID asc 