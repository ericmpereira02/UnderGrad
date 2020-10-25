select videogamestore.individual_product.Product_Id, COUNT(videogamestore.individual_product.Product_Id) AS Amount
FROM videogamestore.individual_product
JOIN videogamestore.products_ordered ON videogamestore.products_ordered.Serial_No = videogamestore.individual_product.Serial_no
JOIN videogamestore.order ON videogamestore.order.tracking_number = videogamestore.products_ordered.Tracking_No
WHERE MONTH(videogamestore.order.date_ordered) = 11 AND YEAR(videogamestore.order.date_ordered) = 2018
GROUP BY videogamestore.individual_product.Product_Id
LIMIT 5