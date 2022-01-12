/*Montar uma consulta que informa quantos alunos cursaram a disciplina de Bancos de Dados em 2019 e 2020.*/
SELECT count(ta.ra) as contagem_alunos, td.nome_disc, th.ano		
FROM tabela_alunos ta INNER JOIN tabela_historico th ON ta.ra = th.ra 
INNER JOIN tabela_disciplinas td ON td.cod_disc = th.cod_disc 
WHERE td.nome_disc is 'Bancos de Dados' 
AND (th.ano = 2019 OR th.ano = 2020)
GROUP BY th.ano;

/*Montar uma consulta que exiba os nomes dos alunos que não foram reprovados em nenhuma disciplina (nota de corte = 6)*/
SELECT nome FROM tabela_alunos ta 
WHERE ra not in (
   SELECT nome FROM tabela_alunos ta2 inner join tabela_historico th on ta2.ra = th.ra WHERE nota < 6
)
