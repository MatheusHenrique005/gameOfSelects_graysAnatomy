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

INSERT INTO atores VALUES
(null, 'Ellen Pompeo','1969-11-10', 'F', 'EUA', '@ellenpompeo'),
(null, 'Chandra Wilson','1969-8-27', 'F', 'EUA', '@chandrawilsonofficial'),
(null, 'Patrick Dempsey','1966-2-13', 'M', 'EUA', '@patrickdempsey'),
(null, 'Sandra Oh','1971-7-20', 'F', 'Canadá', '@iamsandraohinsta'),
(null, 'Justin Chambers', '1970-7-11', 'M', 'EUA', '@officialjustinchambers');

select*from atores;	

CREATE TABLE personagens (
idPersonagem INT,
fkAtor INT,
morreu CHAR (1),
CONSTRAINt chkMorreu CHECK (morreu IN('S', 'N')),
nome VARCHAR (45),
descricao VARCHAR (45),
papel VARCHAR (45),
constraint fkAtor FOREIGN KEY (fkAtor) REFERENCES atores (idAtor),
constraint pkPersonagemAtor PRIMARY KEY (idPersonagem, fkAtor)
);

INSERT INTO personagens VALUES
('1','1','N','Meredith Grey','Principal','Interna'),
('2','2','N','Miranda Bailey','Principal','Enfermeira'),
('3','3','N','Derek Shepherd','Principal','Medico'),
('4','4','N','Cristina Yang','Principal','Interna'),
('5','5','N','Alex Karev','Principal','Interno');

select*from personagens;

CREATE TABLE historico_relacionamento (
id_Historico_Relacionamento INT auto_increment,
fkPersonagem1 INT,
fkPersonagem2 INT,
duracao INT,
constraint fkPersonagem1 FOREIGN KEY (fkPersonagem1) REFERENCES personagens (idPersonagem),
constraint fkPersonagem2 FOREIGN KEY (fkPersonagem2) REFERENCES personagens (idPersonagem),
constraint pk_historico_personagens PRIMARY KEY (id_Historico_Relacionamento, fkPersonagem1, fkPersonagem2)
);


insert into historico_relacionamento values 
(null, 1, 3, 6);

select * from personagens;

CREATE TABLE temporada (
idTemporada INT PRIMARY KEY auto_increment,
nome VARCHAR(45),
dtLancamento DATE
);

INSERT INTO temporada VALUES
(null, '1ªTemporada', '2005-3-27'),
(null, '2ªTemporada', '2005-4-3'),
(null, '3ªTemporada', '2005-4-10'),
(null, '4ªTemporada', '2005-4-17'),
(null, '5ªTemporada', '2005-4-24');


CREATE TABLE aparicao(
fkTemporada INT,
fkPersonagem INT,
constraint fkTemporada FOREIGN KEY (fkTemporada) REFERENCES temporada (idTemporada),
constraint fkPersonagem FOREIGN KEY (fkPersonagem) REFERENCES personagens (idPersonagem)
);

INSERT INTO aparicao VALUES 
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5);

INSERT INTO aparicao VALUES 
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5);

INSERT INTO aparicao VALUES 
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5);

INSERT INTO aparicao VALUES 
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(4, 5);

INSERT INTO aparicao VALUES 
(5, 1),
(5, 2),
(5, 3),
(5, 4),
(5, 5);

