/*Montar uma consulta que informa quantos alunos cursaram a disciplina de Bancos de Dados em 2019 e 2020.*/
SELECT count(ta.ra) as contagem_alunos, td.nome_disc, th.ano		
FROM tabela_alunos ta INNER JOIN tabela_historico th ON ta.ra = th.ra 
INNER JOIN tabela_disciplinas td ON td.cod_disc = th.cod_disc 
WHERE td.nome_disc is 'Bancos de Dados' 
AND (th.ano = 2019 OR th.ano = 2020)
GROUP BY th.ano;

/*Montar uma consulta que exiba os nomes dos alunos que não foram reprovados em nenhuma disciplina (nota de corte = 6)*/
CREATE TABLE aprovados AS 
	SELECT ta.nome, th.nota, th.cod_disc, ta.ra from tabela_historico th INNER JOIN tabela_alunos ta ON th.ra = ta.ra
	GROUP BY ta.nome
	HAVING th.nota > 6
	
SELECT nome FROM aprovados 
