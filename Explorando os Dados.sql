<<<<<<< HEAD
/*

Sakila for Microsoft SQL Server is a port of the Sakila example database available for MySQL, which was originally developed by Mike Hillyer of the MySQL AB documentation team. 
This project is designed to help database administrators to decide which database to use for development of new products
The user can run the same SQL against different kind of databases and compare the performance

License: BSD
Copyright DB Software Laboratory
http://www.etl-tools.com

*/


=======
>>>>>>> c036f85d1afd4216b9daca1720e0a9f6c26fc6d1
-- Mostrar todas as tabelas da base Sakila
SELECT table_name 
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_TYPE='BASE TABLE'

-- Ter uma visão geral dos dados e estrutura de cada tabela, escrito o que cada tabela representa

-- Tabela actor são os principais atores e atrizes dos filmes
SELECT * FROM [dbo].[actor]

-- Endereço dos clientes
SELECT * FROM [dbo].[address]

-- Categoria/gênero dos filmes
SELECT * FROM [dbo].[category]

-- Cidade para relacionar com o endereço do cliente
SELECT * FROM [dbo].[city]

-- País para relacionar com a cidade e endereço do cliente
SELECT * FROM [dbo].[country]

-- País para relacionar com a cidade e endereço do cliente
SELECT * FROM [dbo].[customer]

-- Tabela com cada filme. Também há as informações comercial dos filmes.
SELECT * FROM [dbo].[film]

-- Tabela que relaciona filmes e atores
SELECT * FROM [dbo].[film_actor]

-- Tabela que relaciona o filme e sua categoria
SELECT * FROM [dbo].[film_category]

-- Descritivo dos filmes (atualmente sem uso)
SELECT * FROM [dbo].[film_text]

-- Tabela em que guardará a informação de qual loja tem cada filme
SELECT * FROM [dbo].[inventory]

-- Linguagem em que o filme foi feito
SELECT * FROM [dbo].[language]

-- Informações referente ao quanto o cliente pagou
SELECT * FROM [dbo].[payment]

-- Informações referente à venda do filme, como a data de alguel e devolução
SELECT * FROM [dbo].[rental]

-- Gerente das lojas
SELECT * FROM [dbo].[staff]

-- Tabela das lojas
SELECT * FROM [dbo].[store]


-- Entendendo os dados das vendas
SELECT title, rental_date, return_date, amount 
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
ORDER BY title