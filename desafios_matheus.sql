

-- Fáceis (15):


-- 1. Selecione o nome dos atores em ordem alfabética.
SELECT nome
FROM atores
ORDER BY nome ASC;


-- 2. Selecione o nome dos personagens em ordem alfabética inversa.
SELECT nome
FROM personagens
ORDER BY nome DESC;


-- 3. Selecione o nome e a nacionalidade dos atores dos EUA.
SELECT nome,
    nacionalidade
FROM atores
WHERE nacionalidade = 'EUA';


-- 4. Selecione o nome dos personagens cujo nome começa com "A".
SELECT nome
FROM personagens
WHERE nome LIKE 'A%';


-- 5. Selecione o nome e a descrição dos personagens em ordem alfabética pelo nome.
SELECT nome,
    descricao
FROM personagens
ORDER BY nome ASC;


-- 6. Selecione o nome e a data de nascimento dos atores cuja data de nascimento é anterior a '1990-01-01'.
SELECT nome,
    dtNasc
FROM atores
WHERE dtNasc < '1990-01-01';


-- 7. Selecione o nome dos atores cujo nome contém a letra "o".
SELECT nome
FROM atores
WHERE nome LIKE '%o%';


-- 8. Selecione o nome dos personagens cujo nome termina com a letra "y".
SELECT nome
FROM personagens
WHERE nome LIKE '%y';


-- 9. Selecione o nome e a nacionalidade dos atores dos EUA em ordem alfabética pelo nome.
SELECT nome,
    nacionalidade
FROM atores
WHERE nacionalidade = 'EUA'
ORDER BY nome ASC;


-- 10. Selecione o nome dos atores cujo nome contém a letra "e" e nasceram antes de '1970-01-01'.
SELECT nome
FROM atores
WHERE nome LIKE '%e%'
    AND dtNasc < '1970-01-01';


-- 11. Selecione o nome dos personagens cujo nome começa com a letra "C" e a nacionalidade é "EUA".
SELECT nome
FROM atores
WHERE nome LIKE 'C%'
    AND nacionalidade = 'EUA';


-- 12. Selecione o nome e a data de nascimento dos atores em ordem decrescente pela data de nascimento.
SELECT nome,
    dtNasc
FROM atores
ORDER BY dtNasc DESC;


-- 13. Selecione o nome dos personagens cujo nome contém a letra "i" e a descrição é "Principal".
SELECT nome
FROM personagens
WHERE nome LIKE '%i%'
    AND descricao = 'Principal';


-- 14. Selecione o nome dos atores cujo nome termina com a letra "h" e nasceram depois de '1970-01-01'.
SELECT nome
FROM atores
WHERE nome LIKE '%h'
    AND dtNasc > '1970-01-01';


-- 15. Selecione o nome e a nacionalidade dos atores cuja nacionalidade é diferente de "EUA".
SELECT nome,
    nacionalidade
FROM atores
WHERE nacionalidade != 'EUA';


-- Médios (10):+

-- Mostre os IDs dos personagens cujos nomes são Meredith Grey e Derek Shepherd:
SELECT idPersonagem
FROM personagens
WHERE nome IN ('Meredith Grey', 'Derek Shepherd');

-- Mostre os nomes dos atores que nasceram nos EUA:
SELECT nome
FROM atores
WHERE nacionalidade = 'EUA';

-- Mostre as redes sociais dos atores que nasceram no Canadá:
SELECT rede_social
FROM atores
WHERE nacionalidade = 'Canadá';

-- Mostre o nome dos atores que nasceram antes de 1 de janeiro de 1970:
SELECT nome
FROM atores
WHERE dtNasc < '1970-01-01';

-- Mostre os dados dos personagens que os atores tenham o id entre 3 e 5:
SELECT *
FROM personagens JOIN atores ON idAtor = fkAtor
WHERE idAtor BETWEEN 3 and 5;

-- Mostre a idade dos usuários que nasceram nos EUA

SELECT nome,
    TIMESTAMPDIFF(year, dtNasc, now()) AS idade
FROM atores
WHERE nacionalidade = 'EUA';

-- Mostre os nomes e redes sociais dos atores que nasceram no Canadá

SELECT nome,
    rede_social
FROM atores
WHERE nacionalidade = 'Canadá';

-- Mostre os personagens dos atores que nasceram depois de 1 de janeiro de 1975

SELECT personagens.nome
FROM personagens
    JOIN atores ON idAtor = fkAtor
WHERE dtNasc > '1970-01-01';

-- Mostre os nomes dos personagens que o nome do ator começa com 'S'

SELECT personagens.nome
FROM personagens
    JOIN atores ON idAtor = fkAtor
WHERE atores.nome LIKE 'S%';

-- Mostre os nomes dos personagens que morreram que aparecem na temporada 3

SELECT personagens.nome
FROM personagens
	JOIN aparicao ON idPersonagem = fkPersonagem
WHERE personagens.morreu = 'S' AND fkTemporada = 3;

-- Difíceis (5):


-- 26. Selecione o nome dos atores juntamente com o número de personagens associados a cada ator, apenas para atores que têm personagens associados. Ordene em ordem decrescente pelo número de personagens.
SELECT atores.nome,
    COUNT(idPersonagem) AS num_personagens
FROM atores
    LEFT JOIN personagens ON atores.idAtor = personagens.fkAtor
WHERE idPersonagem IS NOT NULL
GROUP BY atores.nome
ORDER BY num_personagens DESC;


-- 27. Selecione o nome dos personagens e a média das pontuações associadas a cada personagem.
SELECT p.nome,
    AVG(a.pontuacao) AS media_pontuacao
FROM personagens p
    LEFT JOIN avaliacao a ON p.idPersonagem = a.fkPersonagem
GROUP BY p.nome;


-- 28. Selecione o nome dos personagens e a contagem de aparições em cada temporada.
SELECT p.nome,
    COUNT(a.fkTemporada) AS num_aparicoes
FROM personagens p
    LEFT JOIN aparicao a ON p.idPersonagem = a.fkPersonagem
GROUP BY p.nome;


-- 29. Selecione o nome dos personagens e o mínimo ID dos atores associados a cada personagem.
SELECT p.nome,
    MIN(a.idAtor) AS min_id_ator
FROM personagens p
    LEFT JOIN atores a ON p.fkAtor = a.idAtor
GROUP BY p.nome;


-- 30. Selecione o nome dos personagens e a soma dos IDs dos atores associados a cada personagem.
SELECT p.nome,
    SUM(a.idAtor) AS soma_ids_atores
FROM personagens p
    LEFT JOIN atores a ON p.fkAtor = a.idAtor
GROUP BY p.nome;


-- Desafiadores (2):


-- 31. Selecione o nome dos atores juntamente com o número de personagens associados a cada ator. Ordene em ordem decrescente pelo número de personagens.
SELECT a.nome,
    COUNT(p.idPersonagem) AS num_personagens
FROM atores a
    LEFT JOIN personagens p ON a.idAtor = p.fkAtor
GROUP BY a.nome
ORDER BY num_personagens DESC;


-- 32. Selecione o nome dos personagens e a média das pontuações associadas a cada personagem.
SELECT p.nome,
    AVG(a.pontuacao) AS media_pontuacao
FROM personagens p
    LEFT JOIN avaliacao a ON p.idPersonagem = a.fkPersonagem
GROUP BY p.nome;