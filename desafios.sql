SELECT * FROM atores;
SELECT * FROM personagens;

SELECT * FROM temporada;
SELECT * FROM aparicao;
SELECT * FROM historico_relacionamento;


-- ME INFORME OS ATORES QUE APARECERAM NA TEMPORADA 2
-- ME INFORME APENAS O NOME DOS PERSONAGENS COM A LETRA 'M'
-- ME INFORME TODOS OS ATORES EM ORDEM DESCRESCENTE
-- ME INFORME APENAS OS PERSONAGENS QUE SE RELACIONARAM RELACIONAMENTOS 
-- ME INFORME APENAS OS NOMES 

SELECT nome, dtNasc, rede_social FROM atores;

SELECT nome, descricao FROM personagens;

SELECT * FROM temporada;


SELECT nome, dtLancamento FROM temporada;


SELECT * FROM atores WHERE nacionalidade = 'EUA';


SELECT * FROM personagens WHERE papel = 'Principal';


SELECT * FROM aparicao WHERE fkTemporada = 1;


SELECT nome, dtNasc, nacionalidade FROM atores ORDER BY dtNasc ASC;


SELECT nome, papel, descricao FROM personagens WHERE papel = 'Principal';


SELECT p.nome,
    p.papel
FROM personagens p
WHERE NOT EXISTS (
    SELECT *
    FROM temporada t
    WHERE NOT EXISTS (
            SELECT *
            FROM aparicao a
            WHERE a.fkPersonagem = p.idPersonagem
                AND a.fkTemporada = t.idTemporada
        )
);