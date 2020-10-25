SELECT email, end_date FROM videogamestore.members
WHERE end_date <= (date_add(current_date, INTERVAL 7 DAY)); 
