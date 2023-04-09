/*

Sakila for Microsoft SQL Server is a port of the Sakila example database available for MySQL, which was originally developed by Mike Hillyer of the MySQL AB documentation team. 
This project is designed to help database administrators to decide which database to use for development of new products
The user can run the same SQL against different kind of databases and compare the performance

License: BSD
Copyright DB Software Laboratory
http://www.etl-tools.com

*/

-- Respostas das Perguntas de Negócios

-- Quais foram os 5 gêneros mais alugados?
SELECT TOP 5 c.name film_category, COUNT(r.rental_id) rentals
FROM [dbo].[category] c
INNER JOIN [dbo].[film_category] fc ON c.category_id = fc.category_id
INNER JOIN [dbo].[film] f ON fc.film_id = f.film_id
INNER JOIN [dbo].[inventory] i ON f.film_id = i.film_id
INNER JOIN [dbo].[rental] r ON i.inventory_id = r.inventory_id
GROUP BY c.name
ORDER BY rentals DESC














