SELECT videogamestore.order.email, COUNT(videogamestore.order.email) AS PurchaseCount, videogamestore.addresses.address, videogamestore.addresses.city
FROM videogamestore.order
JOIN videogamestore.customer on videogamestore.order.email=videogamestore.customer.email
JOIN videogamestore.addresses on videogamestore.addresses.email=videogamestore.customer.email
WHERE YEAR(videogamestore.order.date_ordered) = 2014
GROUP BY videogamestore.order.email
HAVING PurchaseCount > 20;