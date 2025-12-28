SELECT 
od.ORDER_ITEM_ID,
o.CUSTOMER_ID AS CustID,
o.Order_Date AS DateOfPurchase, 
p.PRODUCT_NAME, 
sum(QUANTITY) as QUANTITY,
SUM(PRICE) as Price,
SUM(QUANTITY * PRICE) AS Total

FROM {{ ref('stg_orderdetails') }} as od
INNER JOIN {{ ref('stg_orders') }} as o
USING (ORDER_ID)
INNER JOIN {{ ref('stg_products') }} as p
USING (PRODUCT_ID)

GROUP BY ORDER_ITEM_ID, CUSTOMER_ID, DATEOFPURCHASE, PRODUCT_NAME

