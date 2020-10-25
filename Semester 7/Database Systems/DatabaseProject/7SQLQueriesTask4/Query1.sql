SELECT videogamestore.order.email, videogamestore.products_ordered.Serial_No, videogamestore.individual_product.Product_Id FROM videogamestore.order
JOIN videogamestore.products_ordered ON videogamestore.order.tracking_number=videogamestore.products_ordered.Tracking_No
JOIN videogamestore.customer ON videogamestore.order.email=videogamestore.customer.email
JOIN videogamestore.individual_product ON videogamestore.individual_product.Serial_no=videogamestore.products_ordered.Serial_No
WHERE videogamestore.order.email = "alyssa95@hess.org"