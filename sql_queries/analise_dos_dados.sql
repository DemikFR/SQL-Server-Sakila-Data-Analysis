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
SELECT TOP 5 c.name genero_filme, COUNT(r.rental_id) alugueis
FROM [dbo].[category] c
INNER JOIN [dbo].[film_category] fc ON c.category_id = fc.category_id
INNER JOIN [dbo].[film] f ON fc.film_id = f.film_id
INNER JOIN [dbo].[inventory] i ON f.film_id = i.film_id
INNER JOIN [dbo].[rental] r ON i.inventory_id = r.inventory_id
GROUP BY c.name
ORDER BY alugueis DESC



-- Existe alguma possibilidade desses gêneros serem os mais alugados por terem mais filmes?
WITH relatorio_generos(genero_filme, alugueis, filmes)
AS
(
	SELECT c.name genero_filme, COUNT(r.rental_id) alugueis, COUNT(DISTINCT fc.film_id) filmes
	FROM [dbo].[category] c
	INNER JOIN [dbo].[film_category] fc ON c.category_id = fc.category_id
	INNER JOIN [dbo].[film] f ON fc.film_id = f.film_id
	LEFT JOIN [dbo].[inventory] i ON f.film_id = i.film_id
	LEFT JOIN [dbo].[rental] r ON i.inventory_id = r.inventory_id
	GROUP BY c.name
)
SELECT 
  ROUND(
  (
	SUM(alugueis * filmes) - (SUM(alugueis) * SUM(filmes)) / COUNT(*)
  )
  / 
  (
    SQRT(
      SUM(alugueis * alugueis) - (SUM(alugueis) * SUM(alugueis)) / COUNT(*)
    ) * SQRT(
      SUM(filmes * filmes) - (SUM(filmes) * SUM(filmes)) / COUNT(*)
    )
  ), 2) AS correlacao
FROM relatorio_generos



-- Quais foram os 5 filmes mais alugados?
SELECT TOP 7 f.title AS nome_filme, c.name AS genero_filme, COUNT(r.rental_id) alugueis
FROM [dbo].[category] c
INNER JOIN [dbo].[film_category] fc ON c.category_id = fc.category_id
INNER JOIN [dbo].[film] f ON fc.film_id = f.film_id
INNER JOIN [dbo].[inventory] i ON f.film_id = i.film_id
INNER JOIN [dbo].[rental] r ON i.inventory_id = r.inventory_id
GROUP BY f.title, c.name
ORDER BY alugueis DESC

-- Quais foram os 5 filmes menos alugados?
SELECT TOP 17 f.title AS nome_filme, c.name AS genero_filme, COUNT(r.rental_id) alugueis
FROM [dbo].[category] c
INNER JOIN [dbo].[film_category] fc ON c.category_id = fc.category_id
INNER JOIN [dbo].[film] f ON fc.film_id = f.film_id
INNER JOIN [dbo].[inventory] i ON f.film_id = i.film_id
INNER JOIN [dbo].[rental] r ON i.inventory_id = r.inventory_id
GROUP BY f.title, c.name
ORDER BY alugueis ASC


-- Existe algum filme que não foi alugado?
SELECT f.title AS nome_filme, c.name AS genero_filme, COUNT(r.rental_id) alugueis
FROM [dbo].[category] c
INNER JOIN [dbo].[film_category] fc ON c.category_id = fc.category_id
INNER JOIN [dbo].[film] f ON fc.film_id = f.film_id
INNER JOIN [dbo].[inventory] i ON f.film_id = i.film_id
INNER JOIN [dbo].[rental] r ON i.inventory_id = r.inventory_id
GROUP BY f.title, c.name
HAVING COUNT(r.rental_id) = 0
ORDER BY alugueis ASC


-- Quem é o ator que tem mais filmes alugados?
SELECT TOP 1 a.first_name+' '+a.last_name AS nome_ator, COUNT(r.rental_id) alugueis
FROM [dbo].[actor] a
INNER JOIN [dbo].[film_actor] fa ON a.actor_id = fa.actor_id
INNER JOIN [dbo].[film] f ON fa.film_id = f.film_id
INNER JOIN [dbo].[inventory] i ON f.film_id = i.film_id
INNER JOIN [dbo].[rental] r ON i.inventory_id = r.inventory_id
GROUP BY a.first_name+' '+a.last_name
ORDER BY alugueis DESC


-- Quem são os 10 maiores clientes?
SELECT TOP 10 c.first_name+' '+c.last_name AS nome_cliente, COUNT(r.rental_id) alugueis
FROM [dbo].[customer] c
INNER JOIN [dbo].[rental] r ON c.customer_id = r.customer_id
GROUP BY c.first_name+' '+c.last_name
ORDER BY alugueis DESC


-- Quais são as cidades onde residem os 10 maiores clientes?
WITH top_clientes(id_cliente, alugueis)
AS
(
	SELECT TOP 10 c.customer_id AS id_cliente, COUNT(r.rental_id) alugueis
	FROM [dbo].[customer] c
	INNER JOIN [dbo].[rental] r ON c.customer_id = r.customer_id
	GROUP BY c.customer_id
	ORDER BY alugueis DESC
)
SELECT cr.first_name+' '+cr.last_name AS nome_cliente, c.city AS cidade_cliente
FROM [dbo].[city] c
INNER JOIN [dbo].[address] a ON c.city_id = a.city_id
INNER JOIN [dbo].[customer] cr ON a.address_id = cr.address_id
INNER JOIN [top_clientes] tc ON cr.customer_id = tc.id_cliente


-- Quais são as cinco cidades com o maior número de clientes, exceto as que já possuem lojas?
WITH cidades_loja(id_cidade)
AS
(
	SELECT c.city_id
	FROM [dbo].[city] c
	INNER JOIN [dbo].[address] a ON c.city_id = a.city_id
	INNER JOIN  [dbo].[store] s ON a.address_id = s.address_id
)
SELECT TOP 2 c.city AS nome_cidade, COUNT(cr.customer_id) qte_clientes
FROM [dbo].[city] c
INNER JOIN [dbo].[address] a ON c.city_id = a.city_id
INNER JOIN [dbo].[customer] cr ON a.address_id = cr.address_id
LEFT JOIN [cidades_loja] cl ON c.city_id = cl.id_cidade
WHERE cl.id_cidade IS NULL
GROUP BY c.city
ORDER BY qte_clientes DESC

-- Por ordem decrescente, qual foi o lucro que cada loja recebeu?
SELECT s.store_id AS id_loja, sf.first_name+' '+sf.last_name AS nome_gerente, SUM(p.amount) lucro_total
FROM [dbo].[store] s
INNER JOIN [dbo].[staff] sf ON s.store_id = sf.store_id
INNER JOIN [dbo].[inventory] i ON s.store_id = i.store_id
INNER JOIN [dbo].[rental] r ON i.inventory_id = r.inventory_id
INNER JOIN [dbo].[payment] p ON r.rental_id = p.rental_id
GROUP BY s.store_id, sf.first_name+' '+sf.last_name
ORDER BY lucro_total DESC







