<!-- PROJECT LOGO -->
<br />
<div align="center">

  <h1 align="center">Análise da Base de Dados Sakila</h1>

  <p align="center">
    Análise de dados para negócios da base de dados Sakila.
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#sobre-o-projeto">Sobre o Projeto</a>
      <ul>
        <li><a href="#ferramentas">Ferramentas</a></li>
      </ul>
    </li>
    <li><a href="#iniciar-o-projeto">Iniciar o Projeto</a></li>
    <li>
      <a href="#entender-a-base">Entender a Base</a>
      <ul>
        <li><a href="#resumo-das-tabelas-e-campos-específicos">Resumo das Tabelas e Campos Específicos</a></li>
      </ul>  
    </li>
    <li><a href="#analise-do-negocio">Análise do Negócio</a></li>
    <li><a href="#agradecimentos">Agradecimentos</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>



<!-- Sobre o Projeto -->
## Sobre o Projeto

Este projeto tem o objetivo de treinar e demonstrar as minhas habilidades em análise de dados com o SQL Server.



### Ferramentas

Para realizar este projeto, foi usado a seguinte ferramenta:



* [![SQL-Server][MicrosoftSQLServer.sql]][SQLServer-url]




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

Tabela para armazenar os gêneros dos filmes, por exemplo: ação, comédia, etc. 

#### Tabela Film

Tabela tem a finalidade de armazenar informações dos filmes, bem como nome, sinopse e data de lançamento. Além disso ela contém informações comercial do filme, como 'rental duration' que é o tempo de duração do contrato, 'rental rate' que é a taxa fixa do aluguel e o 'replacement cost' que é a taxa para o cliente trocar de filme.

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

Para efeito de análise, foram feitas algumas perguntas acerca dos dados disponíveis, conforme abaixo:

#### Quais foram os 5 gêneros mais alugados?

Essa pergunta será útil para a equipe de negócios identificar o perfil dos seus clientes, pois sabendo disso, poderá ser tomada uma melhor decisão sobre quais filmes deverão adquirir em um próximo investimento.

#### Existe alguma possibilidade desses gêneros serem os mais alugados por terem mais filmes?

#### Quais foram os 5 filmes mais alugados?

#### Quais são os 5 filmes menos alugados?

#### Existe algum filme que não foi alugado?

#### Por ordem crescente, qual foi o lucro que cada loja recebeu?

#### Quais são os 10 maiores clientes?

#### Quais as cidades que os 10 maiores clientes residem?

#### Quem é o ator que tem mais filmes alugados?

#### Qual foi o lucro médio de cada ano?



<!-- Agradecimentos -->
## Agradecimento

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