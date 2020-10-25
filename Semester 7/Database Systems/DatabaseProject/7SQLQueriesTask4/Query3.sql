SELECT videogamestore.order.city, Count(videogamestore.products_ordered.Serial_No) AS totalCount,
SUM(videogamestore.product.Price) AS AmountPerCity
	
    
from videogamestore.order
JOIN videogamestore.products_ordered ON videogamestore.products_ordered.Tracking_No=videogamestore.order.tracking_number
JOIN videogamestore.individual_product ON videogamestore.individual_product.Serial_no=videogamestore.products_ordered.Serial_No
JOIN videogamestore.product ON videogamestore.product.Product_Id=videogamestore.individual_product.Product_Id
GROUP BY city;