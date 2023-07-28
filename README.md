<!-- PROJECT LOGO -->
<br />
<div align="center">

  <h1 align="center">Análise da Base de Dados Sakila</h1>

  <p align="center">
    Análise de dados para negócios da base de dados de uma locadora de filmes.
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Sumário</summary>
  <ol>
    <li>
      <a href="#sobre-o-projeto">Sobre o Projeto</a>
      <ul>
        <li><a href="#ferramentas">Ferramentas</a></li>
	<li><a href="#etapas">Etapas</a></li>
      </ul>
    </li>
    <li><a href="#iniciar-o-projeto">Iniciar o Projeto</a></li>
    <li>
      <a href="#entender-a-base">Entender a Base</a>
      <ul>
        <li><a href="#resumo-das-tabelas-e-campos-específicos">Resumo das Tabelas e Campos Específicos</a></li>
      </ul>  
    </li>
    <li>
      <a href="#análise-do-negócio">Análise do Negócio</a>
      <ul>
        <li><a href="#quais-foram-os-5-gêneros-mais-alugados">Quais foram os 5 gêneros mais alugados?</a></li>
        <li><a href="#existe-alguma-possibilidade-desses-gêneros-serem-os-mais-alugados-por-terem-mais-filmes">Existe alguma possibilidade desses gêneros serem os mais alugados por terem mais filmes?</a></li>
        <li><a href="#quais-foram-os-5-filmes-mais-alugados">Quais foram os 5 filmes mais alugados?</a></li>
        <li><a href="#quais-foram-os-5-filmes-menos-alugados">Quais foram os 5 filmes menos alugados?</a></li>
        <li><a href="#existe-algum-filme-que-não-foi-alugado">Existe algum filme que não foi alugado?</a></li>
        <li><a href="#por-ordem-decrescente-qual-foi-o-lucro-que-cada-loja-recebeu">Por ordem decrescente, qual foi o lucro que cada loja recebeu?</a></li>
        <li><a href="#quem-são-os-10-maiores-clientes">Quem são os 10 maiores clientes?</a></li>
        <li><a href="#quais-são-as-cidades-onde-residem-os-10-maiores-clientes">Quais são as cidades onde residem os 10 maiores clientes?</a></li>
	<li><a href="#quais-são-as-cinco-cidades-com-o-maior-número-de-clientes-exceto-as-que-já-possuem-lojas">Quais são as cinco cidades com o maior número de clientes, exceto as que já possuem lojas?</a></li>
        <li><a href="#quem-é-o-ator-que-tem-mais-filmes-alugados">Quem é o ator que tem mais filmes alugados?</a></li>
        <li><a href="#por-ordem-decrescente-qual-foi-o-lucro-que-cada-loja-recebeu">Por ordem decrescente, qual foi o lucro que cada loja recebeu?</a></li>
      </ul> 
    </li>
    <li><a href="#apresentação">Apresentação</a></li>
    <li><a href="#agradecimentos">Agradecimentos</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>



<!-- Sobre o Projeto -->
## Sobre o Projeto

Este projeto tem o objetivo de treinar e demonstrar as minhas habilidades em análise de dados com o SQL Server.



### Ferramentas

Para realizar este projeto, foi utilizado as seguintes ferramentas:


* [![SQL-Server][MicrosoftSQLServer.sql]][SQLServer-url]
* [![Microsoft-Excel][MicrosoftExcel.xlsx]][MicrosoftExcel-url]
* [![MicrosoftPowerPoint][MicrosoftPowerPoint.pptx]][MicrosoftPowerPoint-url]


### Etapas

1. Análise da Base:

	Inicialmente, realizou-se uma consulta em cada tabela, com o objetivo de compreender seus atributos e relacionamentos. Essa etapa permitiu obter uma visão abrangente dos dados disponíveis.

2. Levantamento de Requisitos:

	Com base na análise das tabelas, foram levantados os requisitos necessários para a resolução do problema de negócio. Essa fase é fundamental para garantir que os dados extraídos sejam adequados às demandas específicas da empresa.

3. Extração dos Dados:

	Uma vez definidos os requisitos, procedeu-se à criação das queries para extrair os dados relevantes para a resolução do problema. A extração foi realizada de forma a obter informações necessárias para a geração de insights.

4. Transferência dos Dados para o Excel:

	Após a extração dos dados, estes foram transferidos para o Excel. Essa etapa permitiu uma manipulação mais eficiente dos dados, possibilitando a criação de análises detalhadas para os relatórios.

5. Geração dos Relatórios:

	Utilizando as informações consolidadas no Excel, foram gerados dois relatórios, apresentando os resultados obtidos. Esses relatórios constituem uma parte crucial do processo, pois fornecem insights valiosos para a compreensão do cenário atual e potenciais oportunidades de melhoria.

6. Criação da Apresentação de Storytelling no PowerPoint:

	Finalmente, os visuais e informações mais relevantes dos relatórios foram incorporados a uma apresentação de storytelling no PowerPoint. Essa etapa permitiu criar uma narrativa envolvente e visualmente impactante, facilitando a comunicação dos resultados e conclusões aos stakeholders e tomadores de decisão.


<!-- Iniciar o Projeto -->
## Iniciar o Projeto

1. Clone este Repositório
   ```sh
   git clone https://github.com/DemikFR/SQL-Server-Sakila-Data-Analysis.git
   ```
2. Execute a query que está em '/sql-server-sakila-db/sql-server-sakila-db'

A base de dados Sakila será instalada em seu SQL-Server.



<!-- Entender a Base -->
## Entender a Base

Para compreender esta base de dados, foi realizado uma pequena query com <code>SELECT</code> em cada tabela e um relacionamento com as tabelas referente às vendas das lojas, conforme abaixo:

```sql
SELECT title, rental_date, return_date, amount 
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
ORDER BY title
```

### Resumo das Tabelas e Campos Específicos 

#### Tabela Actor

Esta tabela armazena o ID e sobrenome do Ator.

#### Tabela Address, City e Country

A tabela address conta com informações de endereço, como CEP e logradouro, além de um campo de identificação (ID) da cidade correspondente. Essa tabela estabelecerá uma relação com a tabela city para cada endereço, por meio do campo de ID da cidade. A tabela cidade, por sua vez, possui um campo de ID que identifica o país (country) ao qual ela pertence.

#### Tabela Customer

Esta tabela tem por objetivo guardar os clientes de cada loja, cada um receberá a identificação estrangeira da loja, além do ID de endereço.

#### Tabela Category

Esta tabela serve para armazenar os gêneros dos filmes, por exemplo: ação, comédia, etc. 

#### Tabela Film

Esta tabela tem a finalidade de armazenar informações dos filmes, bem como nome, sinopse e data de lançamento. Além disso ela contém informações comercial do filme, como 'rental duration' que é o tempo de duração do contrato, 'rental rate' que é a taxa fixa do aluguel e o 'replacement cost' que é a taxa para o cliente trocar de filme.

#### Tabela Film Actor, film category, film text

A tabela Film Actor serve para relacionar o filme com o seu principal ator (tabela actor), já a film category relaciona o filme com o(s) seu(s) gênero(s). A tabela film text serve para armazenar o filme e sua sinópse, porém está em desuso.

#### Tabela language

Esta tabela armazena as 6 principais linguagens de filmes.

#### Tabela store

Compreende todas as unidades da locadora.

#### Tabela staff

Os gerentes de cada loja.

#### Tabela store

Guardará as lojas junto com o seu gerente e endereço.

#### Tabela Inventory

Esta tabela relaciona os filmes com suas respectivas lojas, indicando qual loja é responsável pela disponibilidade de cada filme.

#### Tabela Rental

Esta tabela tem o aluguel de cada cliente, bem como o filme alugado, qual loja pertence e a data locação e de devolução.

#### Tabela Payment

Tabela que tem por finalidade armazenar a informação e confirmação do pagamento da locação pelo cliente, nela conterá o valor final do aluguel, ou seja, total pago.



<!-- Análise para o Negócio -->
## Análise do Negócio

Para realizar a análise, foram feitas algumas perguntas de negócios com base nos dados disponíveis, cada uma foi repondida conforme a sua consulta SQL mostrada ao longo deste tópico.

### Quais foram os 5 gêneros mais alugados?

Essa pergunta será útil para a equipe de negócios identificar o perfil dos seus clientes, pois sabendo disso, poderá ser tomada uma melhor decisão sobre quais filmes deverão adquirir em um próximo investimento.

Os gêneros de filmes que mais vendem são: 

|genero_filme   | alugueis |
|---------------|----------|
|Sports	        | 1179     |
|Animation	    | 1166     |
|Action	        | 1112     |
|Sci-Fi	        | 1101     |
|Family	        | 1096     |

Para ter o resultado acima, foi necessário realizar a seguinte consulta no SQL Server:

```sql
SELECT TOP 5 c.name genero_filme, COUNT(r.rental_id) alugueis
FROM [dbo].[category] c
INNER JOIN [dbo].[film_category] fc ON c.category_id = fc.category_id
INNER JOIN [dbo].[film] f ON fc.film_id = f.film_id
INNER JOIN [dbo].[inventory] i ON f.film_id = i.film_id
INNER JOIN [dbo].[rental] r ON i.inventory_id = r.inventory_id
GROUP BY c.name
ORDER BY alugueis DESC
```


### Existe alguma possibilidade desses gêneros serem os mais alugados por terem mais filmes?

Se caso, essa possibilidade ser real, é possível que aumentando as opções dos outros gêneros, aumente as vendas de cada gênero.

Para reponder essa pergunta, foi necessário usar a Correlação de Pearson que é uma medida estatística para verificar se uma variável tem relação com a outra, no caso, se a quantidade de alugueis tem relação com a quantidade de filmes por gênero disponíveis no estoque. A correlação deve retornar um valor de -1 a 1, sendo que, basicamente, se quanto mais perto do número inteiro estiver, maior é a correlação, caso estiver próximo de 0, menor é a correlação ou não existe.

```sql
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
```

O cálculo retornou o valor <b>0.79</b> que significa que existe uma correlação forte entre as variáveis. 

Esse resultado sugere que há uma tendência de que os gêneros de filmes com mais títulos disponíveis no estoque também sejam mais alugados. Com base nesse resultado, a equipe de negócios pode considerar adquirir mais filmes de outros gêneros para ampliar sua oferta e atender às preferências do seu público de maneira mais abrangente.


### Quais foram os 5 filmes mais alugados?

Essa questão pode ser útil para a equipe de negócios entender quais filmes são mais procurados pelos clientes e, assim, adquirir mais títulos seguindo o mesmo padrão.

Sendo assim, para extrair essa informação foi feita a seguinte query:

```sql
SELECT TOP 7 f.title AS nome_filme, c.name AS genero_filme, COUNT(r.rental_id) alugueis
FROM [dbo].[category] c
INNER JOIN [dbo].[film_category] fc ON c.category_id = fc.category_id
INNER JOIN [dbo].[film] f ON fc.film_id = f.film_id
INNER JOIN [dbo].[inventory] i ON f.film_id = i.film_id
INNER JOIN [dbo].[rental] r ON i.inventory_id = r.inventory_id
GROUP BY f.title, c.name
ORDER BY alugueis DESC
```

O resultado da consulta foi: 

| nome_filme              | genero_filme      | alugueis |
| ------------------------|-------------------|----------|
| BUCKET BROTHERHOOD	    | Travel	          | 34       |
| ROCKETEER MOTHER	      | Foreign	          | 33       |
| RIDGEMONT SUBMARINE     | New	              | 32       |
| JUGGLER HARDLY	        | Animation	        | 32       |
| GRIT CLOCKWORK	        | Games	            | 32       |
| SCALAWAG DUCK	          | Music	            | 32       |
| FORWARD TEMPLE	        | Games	            | 32       |

Note que para melhor decisão foram considerados os empatados.


### Quais foram os 5 filmes menos alugados?

A fim de complementar a pergunta anterior, esta tem como objetivo ajudar a equipe de negócios a identificar quais padrões de filmes são menos populares entre os clientes, evitando adquirir títulos semelhantes no futuro.

Para responde-la foi feita a seguinte consulta no banco:

```sql
SELECT TOP 17 f.title AS nome_filme, c.name AS genero_filme, COUNT(r.rental_id) alugueis
FROM [dbo].[category] c
INNER JOIN [dbo].[film_category] fc ON c.category_id = fc.category_id
INNER JOIN [dbo].[film] f ON fc.film_id = f.film_id
INNER JOIN [dbo].[inventory] i ON f.film_id = i.film_id
INNER JOIN [dbo].[rental] r ON i.inventory_id = r.inventory_id
GROUP BY f.title, c.name
ORDER BY alugueis ASC
```
Os filmes com menos vendas foram:

| nome_filme	        | genero_filme	 | alugueis |
|---------------------|----------------|----------|
| MIXED DOORS	        | Foreign	       | 4        |
| TRAIN BUNCH	        | Horror	       | 4        |
| HARDLY ROBBERS	    | Documentary	   | 4        |
| PRIVATE DROP	      | Games	         | 5        |
| INFORMER DOUBLE	    | Foreign	       | 5        |
| BUNCH MINDS	        | Drama	         | 5        |
| GLORY TRACY	        | Games	         | 5        |
| MANNEQUIN WORST	    | New	           | 5        |
| HUNTER ALTER	      | Documentary	   | 5        |
| CONSPIRACY SPIRIT	  | Classics	     | 5        |
| FREEDOM CLEOPATRA	  | Comedy	       | 5        |
| MUSSOLINI SPOILERS	| Sports	       | 5        |
| SEVEN SWARM	        | Games	         | 5        |
| BRAVEHEART HUMAN	  | Family	       | 5        |
| FEVER EMPIRE	      | Games	         | 5        |
| FULL FLATLINERS	    | Children	     | 5        |
| TRAFFIC HOBBIT	    | Travel	       | 5        |

Neste caso, também foram considerados os empatados.


### Existe algum filme que não foi alugado?

Não foram encontrados filmes nessa condição, conforme a consulta abaixo: 

```sql
SELECT f.title AS nome_filme, c.name AS genero_filme, COUNT(r.rental_id) alugueis
FROM [dbo].[category] c
INNER JOIN [dbo].[film_category] fc ON c.category_id = fc.category_id
INNER JOIN [dbo].[film] f ON fc.film_id = f.film_id
INNER JOIN [dbo].[inventory] i ON f.film_id = i.film_id
INNER JOIN [dbo].[rental] r ON i.inventory_id = r.inventory_id
GROUP BY f.title, c.name
HAVING COUNT(r.rental_id) = 0
ORDER BY alugueis ASC
```

Resultado:

| nome_filme	| genero_filme	| alugueis |
|-------------|---------------|----------|


### Quem é o ator que tem mais filmes alugados?

Com essa pergunta, a equipe de negócios saberá quem é o ator mais famoso entre os seus clientes, podendo assim, adquirir mais produtos do mesmo.

Após a consulta realizada abaixo, constatou-se que <b>Susan Davis</b> foi a atriz que teve mais filmes alugados, com um total de 825 locações, tornando-a a mais famosa entre os clientes.

```sql
SELECT TOP 1 a.first_name+' '+a.last_name AS nome_ator, COUNT(r.rental_id) alugueis
FROM [dbo].[actor] a
INNER JOIN [dbo].[film_actor] fa ON a.actor_id = fa.actor_id
INNER JOIN [dbo].[film] f ON fa.film_id = f.film_id
INNER JOIN [dbo].[inventory] i ON f.film_id = i.film_id
INNER JOIN [dbo].[rental] r ON i.inventory_id = r.inventory_id
GROUP BY a.first_name+' '+a.last_name
ORDER BY alugueis DESC
```


### Quem são os 10 maiores clientes?

A fim de identificar os principais clientes da locadora, foi realizada uma consulta no banco de dados para obter uma lista dos 10 clientes com maior quantidade de locações realizadas.

```sql
SELECT TOP 10 c.first_name+' '+c.last_name AS nome_cliente, COUNT(r.rental_id) alugueis
FROM [dbo].[customer] c
INNER JOIN [dbo].[rental] r ON c.customer_id = r.customer_id
GROUP BY c.first_name+' '+c.last_name
ORDER BY alugueis DESC
```

Resultado:
| nome_cliente	    | alugueis | 
|-------------------|----------|
| ELEANOR HUNT	    | 46       |
| KARL SEAL	        | 45       |
| CLARA SHAW	      | 42       |
| MARCIA DEAN	      | 42       |
| TAMMY SANDERS	    | 41       |
| SUE PETERS	      | 40       |
| WESLEY BULL	      | 40       |
| MARION SNYDER	    | 39       |
| RHONDA KENNEDY	  | 39       |
| TIM CARY	        | 39       |

### Quais são as cidades onde residem os 10 maiores clientes?

Será possível usar essa informação para tomar a decisão de onde poderá abrir uma próxima unidade.

Para tal, a seguinte query foi realizada:

```sql
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
```

O resultado da consulta foi:

| nome_cliente	 | cidade_cliente	|
|----------------|----------------------|
| ELEANOR HUNT	 | Saint-Denis		|
| KARL SEAL	 | Cape Coral		|
| CLARA SHAW	 | Molodetno		|
| MARCIA DEAN	 | Tanza		|
| TAMMY SANDERS	 | Changhwa		|
| SUE PETERS	 | Changzhou		|
| WESLEY BULL	 | Ourense (Orense)	|
| MARION SNYDER	 | Santa Brbara dOeste	|
| TIM CARY	 | Bijapur		|
| RHONDA KENNEDY | Apeldoorn		|


### Quais são as cinco cidades com o maior número de clientes, exceto as que já possuem lojas?

Para complementar o resultado da pergunta anterior, foi possível identificar as cidades onde tem o maior número de clientes, em exceção das que já existem lojas, conforme a consulta abaixo:

```sql
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
GROUP BY c.city
ORDER BY qte_clientes DESC
```

Apenas duas cidades contém mais clientes que as outras, que é 2, em todas as outras cidades cadastradas, foram constatadas apenas 1 cliente por cidade, assim, foi filtrado na consulta apenas essas duas.

| nome_cidade	| qte_clientes	|
|---------------|---------------|
| Aurora	| 2		|
| London	| 2		|


### Por ordem decrescente, qual foi o lucro que cada loja recebeu?

Essa questão pode servir para a equipe de negócios analisar o desempenho de cada loja e identificar oportunidades para maximizar os lucros. 

A seguinte consulta foi realizada:


```sql
SELECT s.store_id AS id_loja, sf.first_name+' '+sf.last_name AS nome_gerente, SUM(p.amount) lucro_total
FROM [dbo].[store] s
INNER JOIN [dbo].[staff] sf ON s.store_id = sf.store_id
INNER JOIN [dbo].[inventory] i ON s.store_id = i.store_id
INNER JOIN [dbo].[rental] r ON i.inventory_id = r.inventory_id
INNER JOIN [dbo].[payment] p ON r.rental_id = p.rental_id
GROUP BY s.store_id, sf.first_name+' '+sf.last_name
ORDER BY lucro_total DESC
```

O resultado obtido foi:

| id_loja	| nome_gerente	  | lucro_total	|
|---------------|-----------------|-------------|
| 2		| Jon Stephens	  | 33726.77	|
| 1		| Mike Hillyer	  | 33679.79	|



## Apresentação

Todas as imagens abaixo são os slides retirados do arquivo <i>apresentacao.pptx</i> deste repositório.

![Slide1](https://github.com/DemikFR/SQL-Server-Sakila-Data-Analysis/assets/102700735/437e3cd3-3e67-4240-853a-39eec12362ca)

![Slide2](https://github.com/DemikFR/SQL-Server-Sakila-Data-Analysis/assets/102700735/3f92861f-508b-48c7-a89a-b3b1b214f66c)

![Slide3](https://github.com/DemikFR/SQL-Server-Sakila-Data-Analysis/assets/102700735/02b1066d-91fb-4383-ba78-349fd72cfd77)

![Slide4](https://github.com/DemikFR/SQL-Server-Sakila-Data-Analysis/assets/102700735/3e00de6e-03ec-4829-8e63-bc414dc833b1)

![Slide5](https://github.com/DemikFR/SQL-Server-Sakila-Data-Analysis/assets/102700735/c4d7c359-85a1-44d6-bd0f-e54af7725426)

![Slide6](https://github.com/DemikFR/SQL-Server-Sakila-Data-Analysis/assets/102700735/48ea417f-9d1b-4351-85f2-9b01d2881850)



<!-- Agradecimentos -->
## Agradecimentos

Este projeto usou a versão da base Sakila disponibilizada pelo <a href="https://github.com/jOOQ">JOOQ</a> através de seu repositório <a href="https://github.com/jOOQ/sakila">Sakila</a>.



<!-- LICENSE -->
## License

Distributed under the BSD 2-Clause License. See `LICENSE.txt` for more information.



<!-- CONTACT -->
## Contact

Demik Freitas - [Linkedin](https://www.linkedin.com/in/demik-freitas/) - demik.freitast2d18@gmail.com

Project Link: [https://github.com/DemikFR/SQL-Server-Sakila-Data-Analysis](https://github.com/DemikFR/SQL-Server-Sakila-Data-Analysis)



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[MicrosoftSQLServer.sql]: https://img.shields.io/badge/Microsoft%20SQL%20Server-CC2927?style=for-the-badge&logo=microsoft%20sql%20server&logoColor=white
[SQLServer-url]: https://www.microsoft.com/pt-br/sql-server/sql-server-downloads
[MicrosoftExcel.xlsx]: https://img.shields.io/badge/Microsoft_Excel-217346?style=for-the-badge&logo=microsoft-excel&logoColor=white
[MicrosoftExcel-url]: https://www.microsoft.com/pt-br/microsoft-365/excel
[MicrosoftPowerPoint.pptx]: https://img.shields.io/badge/Microsoft_PowerPoint-B7472A?style=for-the-badge&logo=microsoft-powerpoint&logoColor=white
[MicrosoftPowerPoint-url]: https://www.microsoft.com/pt-br/microsoft-365/powerpoint
