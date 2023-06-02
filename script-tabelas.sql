CREATE DATABASE greys;
USE greys;
CREATE TABLE atores (
idAtor INT PRIMARY KEY auto_increment,
nome VARCHAR(45),
dtNasc DATE,
genero CHAR(1),
nacionalidade VARCHAR (45),
rede_social VARCHAR(45)
);

CREATE TABLE personagens (
idPersonagem INT,
fkAtor INT,
morreu VARCHAR (45),
nome VARCHAR (45),
descricao VARCHAR (45),
papel VARCHAR (45),
constraint fkAtor FOREIGN KEY (fkAtor) REFERENCES atores (idAtor),
constraint pkPersonagemAtor PRIMARY KEY (idPersonagem, fkAtor)
);

CREATE TABLE historico_relacionamento (
id_Historico_Relacionamento INT,
fkPersonagem1 INT,
fkPersonagem2 INT,
duracao INT,
constraint fkPersonagem1 FOREIGN KEY (fkPersonagem1) REFERENCES personagens (idPersonagem),
constraint fkPersonagem2 FOREIGN KEY (fkPersonagem2) REFERENCES personagens (idPersonagem),
constraint pk_historico_personagens PRIMARY KEY (id_Historico_Relacionamento, fkPersonagem1, fkPersonagem2)
);


CREATE TABLE temporada (
idTemporada INT PRIMARY KEY auto_increment,
nome VARCHAR(45),
dtLancamento DATE
);

CREATE TABLE aparicao(
fkTemporada INT,
fkPersonagem INT,
constraint fkTemporada FOREIGN KEY (fkTemporada) REFERENCES temporada (idTemporada),
constraint fkPersonagem FOREIGN KEY (fkPersonagem) REFERENCES personagens (idPersonagem)
);
