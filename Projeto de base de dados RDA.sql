
-- Tabela de endereços dos alunos
CREATE TABLE endereco (
    idendereco INT PRIMARY KEY,
    país VARCHAR(45),
    cidade VARCHAR(45),
    bairro VARCHAR(45),
	rua VARCHAR(45),
    casa INT,
    porta INT
);

select * from endereco;

-- Criação da tabela dos encarregados dos alunos
CREATE TABLE IF NOT EXISTS encarregados (
  idencarregados INT NOT NULL,
  nome VARCHAR(45) NULL,
  sobrenome VARCHAR(45) NULL,
  relacao VARCHAR(45) NULL,
  telefone1 VARCHAR(45) NULL,
  telefone2 VARCHAR(45) NULL,
  email VARCHAR(45) NULL,
  nacionalidade VARCHAR(45) NULL,
  cidade VARCHAR(45) NULL,
  bairro VARCHAR(45) NULL,
  rua VARCHAR(45) NULL,
  PRIMARY KEY (idencarregados));
  

-- Criando a tabela dos polos que são locais de treinos
CREATE TABLE IF NOT EXISTS polo (
  `idpolo` INT NOT NULL,
  `nome_polo` VARCHAR(45) NULL,
  `responsavel` VARCHAR(45) NULL,
  `país` VARCHAR(45) NULL,
  `cidade` VARCHAR(45) NULL,
  `quantidade_alunos` INT NULL,
  PRIMARY KEY (`idpolo`));


-- Tabela de Capoeristas
-- Criando fk na tabela

CREATE TABLE IF NOT EXISTS capoeristas (
  `idcapoerista` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `sobrenome` VARCHAR(45) NULL,
  `apelido` VARCHAR(45) NULL,
  `nascimento` DATE NULL,
  `idade` INT NULL,
  `estado` VARCHAR(45) NULL,
  `inscrito` DATE NULL,
  `nacionalidade` VARCHAR(45) NULL,
  `encarregados_idencarregados1` INT NOT NULL,
  `endereco_idendereco` VARCHAR(45) NOT NULL,
  `polo_idpolo` INT NOT NULL,
  PRIMARY KEY (`idcapoerista`),
  INDEX `fk_capoeristas_encarregados2_idx` (`encarregados_idencarregados1` ASC) VISIBLE,
  INDEX `fk_capoeristas_endereco1_idx` (`endereco_idendereco` ASC) VISIBLE,
  INDEX `fk_capoeristas_polo1_idx` (`polo_idpolo` ASC) VISIBLE,
  CONSTRAINT `fk_capoeristas_encarregados2`
    FOREIGN KEY (`encarregados_idencarregados1`)
    REFERENCES encarregados (`idencarregados`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
 --  CONSTRAINT `fk_capoeristas_endereco1`
--     FOREIGN KEY (endereco_idendereco)
--     REFERENCES endereco (idendereco)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION,
  CONSTRAINT `fk_capoeristas_polo1`
    FOREIGN KEY (`polo_idpolo`)
    REFERENCES polo (`idpolo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB

select * from capoeristas;


-- criando a tabela de avaliação dos alunos de capoeira
CREATE TABLE IF NOT EXISTS avaliacao (
  `idavaliacao` INT NOT NULL,
  `musicalidade` INT NOT NULL,
  `tecnica` INT NULL,
  `presenca_eventos` INT NULL,
  `falta_eventos` INT NULL,
  `capoeristas_idcapoerista` INT NOT NULL,
  PRIMARY KEY (`idavaliacao`),
  INDEX `fk_avaliacao_capoeristas1_idx` (`capoeristas_idcapoerista` ASC) VISIBLE,
  CONSTRAINT `fk_avaliacao_capoeristas1`
    FOREIGN KEY (`capoeristas_idcapoerista`)
    REFERENCES capoeristas (`idcapoerista`)
);


-- Criando a tabela de graduações e suas chaves ptimárias e secundárias
CREATE TABLE IF NOT EXISTS graduacoes (
  `idgraduacao` INT NOT NULL,
  `numero_graduacao` INT NOT NULL,
  `cor_corda` VARCHAR(45) NULL,
  `nome_grau` VARCHAR(45) NULL,
  `capoeristas_idcapoerista` INT NOT NULL,
  PRIMARY KEY (`idgraduacao`),
  INDEX `fk_graduacoes_capoeristas1_idx` (`capoeristas_idcapoerista` ASC) VISIBLE,
  CONSTRAINT `fk_graduacoes_capoeristas1`
    FOREIGN KEY (`capoeristas_idcapoerista`)
    REFERENCES capoeristas (`idcapoerista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    

-- Craindo a tabela de contatos
CREATE TABLE IF NOT EXISTS contatos (
  `codigo_país` INT NOT NULL,
  `contato1` INT NOT NULL,
  `contato2` INT NULL,
  `email` VARCHAR(45) NULL,
  `instagram` VARCHAR(45) NULL,
  `facebook` VARCHAR(45) NULL,
  `capoeristas_idcapoerista` INT NOT NULL,
  PRIMARY KEY (`contato1`),
  INDEX `fk_contatos_capoeristas1_idx` (`capoeristas_idcapoerista` ASC) VISIBLE,
  CONSTRAINT `fk_contatos_capoeristas1`
    FOREIGN KEY (`capoeristas_idcapoerista`)
    REFERENCES capoeristas (`idcapoerista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- Criando a tabela de assiduidade
CREATE TABLE IF NOT EXISTS assiduidade (
  `presencas` INT NOT NULL,
  `faltas` INT NOT NULL,
  `capoeristas_idcapoerista` INT NOT NULL,
  PRIMARY KEY (`presencas`, `faltas`, `capoeristas_idcapoerista`),
  INDEX `fk_assiduidade_capoeristas1_idx` (`capoeristas_idcapoerista` ASC) VISIBLE,
  CONSTRAINT `fk_assiduidade_capoeristas1`
    FOREIGN KEY (`capoeristas_idcapoerista`)
    REFERENCES capoeristas (`idcapoerista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- Criando a tabela de mensalidades dos alunos
CREATE TABLE IF NOT EXISTS mensalidade (
  `idmensalidade` INT NOT NULL,
  `pago` INT NULL,
  `divida` INT NULL,
  `capoeristas_idcapoerista` INT NOT NULL,
  PRIMARY KEY (`idmensalidade`),
  INDEX `fk_mensalidade_capoeristas1_idx` (`capoeristas_idcapoerista` ASC) VISIBLE,
  CONSTRAINT `fk_mensalidade_capoeristas1`
    FOREIGN KEY (`capoeristas_idcapoerista`)
    REFERENCES capoeristas (`idcapoerista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);








/* NOW i will start introducing the data about the capoeira students */




/* NOW i will start introducing the data about the capoeira students */

-- Introduzindo os dados dos polos ou locais de treinos

INSERT INTO polo (idpolo, nome_polo, responsavel, país, cidade, quantidade_alunos)
VALUES (1, 'kilamba', 'diretor', 'angola', 'luanda', 25);




-- Tive que mudar os tipos de dados das coluas abaixo
ALTER TABLE encarregados
MODIFY COLUMN telefone1 int;
ALTER TABLE encarregados
MODIFY COLUMN telefone2 int;


-- Introduzindo dados dos encarregados dos alunos

INSERT INTO encarregados (idencarregados, nome, sobrenome, relacao, telefone1)
VALUES (2001, 'Hélia', 'Firmino', 'mãe', 924404180);

INSERT INTO encarregados (idencarregados, nome, sobrenome, relacao, telefone1, telefone2)
VALUES (2002, 'Amélia', 'Carlos', 'mãe', 940519115, 923321204);

INSERT INTO encarregados (idencarregados, nome, sobrenome, relacao, telefone1)
VALUES (2003, 'Jorge', 'Manuel', 'pai', 925789826);

INSERT INTO encarregados (idencarregados, nome, sobrenome, relacao, telefone1, telefone2)
VALUES (2004, 'Domingos', 'Paulo', 'pai', 912225553, 923821902);

INSERT INTO encarregados (idencarregados, nome, sobrenome, relacao, telefone1)
VALUES (2006, 'Irene', 'Magalhães', 'mãe', 924681588);

INSERT INTO encarregados (idencarregados, nome, sobrenome, relacao, telefone1, telefone2)
VALUES (2007, 'Victorina', 'Casimiro', 'mãe', 925411031, 927558203);

INSERT INTO encarregados (idencarregados, nome, sobrenome, relacao, telefone1, telefone2)
VALUES (2008, 'Santos', 'Sebastião', 'pai', 912200489, 945555700);

INSERT INTO encarregados (idencarregados, nome, sobrenome, relacao, telefone1)
VALUES (2009, 'Benoni', 'Domingos', 'pai', 919267824);

INSERT INTO encarregados (idencarregados, nome, sobrenome, relacao, telefone1)
VALUES (2010, 'Diogo', 'Jenovani', 'pai', 927273066);

INSERT INTO encarregados (idencarregados, nome, sobrenome, relacao, telefone1, telefone2)
VALUES (2011, 'Elsa', 'Maia', 'mãe', 948169015, 998169015);

INSERT INTO encarregados (idencarregados, nome, sobrenome, relacao, telefone1)
VALUES (2012, 'Rosa', 'Moniz', 'mãe', 923633109);

INSERT INTO encarregados (idencarregados, nome, sobrenome, relacao, telefone1)
VALUES (2013, 'Adriano', 'Afonso', 'pai', 923884530);

INSERT INTO encarregados (idencarregados, nome, sobrenome, relacao, telefone1, telefone2)
VALUES (2014, 'Gizela', 'França', 'mãe', 924503780, 923209557);

INSERT INTO encarregados (idencarregados, nome, sobrenome, relacao, telefone1)
VALUES (2015, 'Yuri', 'Cazanga', 'pai', 923874755);

INSERT INTO encarregados (idencarregados, nome, sobrenome, relacao, telefone1, telefone2)
VALUES (2016, 'Denilson', 'Ligeiro', 'pai', 937941911, 923264482);

INSERT INTO encarregados (idencarregados, nome, sobrenome, relacao, telefone1, telefone2)
VALUES (2017, 'Lurdes', 'Miguel', 'mãe', 923406139, 990406139);

INSERT INTO encarregados (idencarregados, nome, relacao, telefone1)
VALUES (2018, 'Amaral', 'pai', 925970909);

INSERT INTO encarregados (idencarregados, nome, sobrenome, relacao, telefone1, telefone2)
VALUES (2019, 'Lauricia', 'da Silva', 'mãe', 928588470, 914186703);

INSERT INTO encarregados (idencarregados, nome, sobrenome, relacao, telefone1)
VALUES (2020, 'Sonia', 'Adão', 'mãe', 931402757);

-- checando os dados
select * from encarregados;

-- e funciona tudo perfeitamente


-- Inserindo dados na tabela de endercos

INSERT INTO endereco (idendereco, país, cidade, bairro)
VALUES (0001, 'Angola', 'Luanda', 'Kilamba');

INSERT INTO endereco (idendereco, país, cidade, bairro, rua)
VALUES (0002, 'Angola', 'Luanda', 'Kilamba', 'W6');

INSERT INTO endereco (idendereco, país, cidade, bairro, rua)
VALUES (0003, 'Angola', 'Luanda', 'Kilamba', 'Z28');

INSERT INTO endereco (idendereco, país, cidade, bairro, rua, casa)
VALUES (0004, 'Angola', 'Luanda', 'Kk5000', 'H7a', 21);

INSERT INTO endereco (idendereco, país, cidade, bairro, rua, casa)
VALUES (0005, 'Angola', 'Luanda', 'Kilamba', 'W27', 71);

INSERT INTO endereco (idendereco, país, cidade, bairro, rua, casa)
VALUES (0006, 'Angola', 'Luanda', 'Kilamba', 'W27', 73);

INSERT INTO endereco (idendereco, país, cidade, bairro, rua, casa)
VALUES (0007, 'Angola', 'Luanda', 'Kilamba', 'W27', 74);

INSERT INTO endereco (idendereco, país, cidade, bairro, rua, casa)
VALUES (0008, 'Angola', 'Luanda', 'Kilamba', 'V33', 44);

INSERT INTO endereco (idendereco, país, cidade, bairro, rua, casa)
VALUES (0009, 'Angola', 'Luanda', 'Kilamba', 'W29', 62);

INSERT INTO endereco (idendereco, país, cidade, bairro, rua)
VALUES (0010, 'Angola', 'Luanda', 'Kilamba', 'W8');

INSERT INTO endereco (idendereco, país, cidade, bairro, rua, casa)
VALUES (0011, 'Angola', 'Luanda', 'Kilamba', 'V30', 31);

INSERT INTO endereco (idendereco, país, cidade, bairro, rua, casa)
VALUES (0012, 'Angola', 'Luanda', 'Kilamba', 'W25', 52);

INSERT INTO endereco (idendereco, país, cidade, bairro, rua, casa)
VALUES (0013, 'Angola', 'Luanda', 'Kilamba', 'U40', 77);

INSERT INTO endereco (idendereco, país, cidade, bairro, rua)
VALUES (0014, 'Angola', 'Luanda', 'Kilamba', 'W27');

INSERT INTO endereco (idendereco, país, cidade, bairro, rua, casa)
VALUES (0015, 'Angola', 'Luanda', 'Kilamba', 'W27', 62);


-- checando os dados na tabela de endereços

select * from endereco;

-- So far so good


-- Inserindo os dados na tabela dos capoeristas

INSERT INTO capoeristas (idcapoerista, nome, sobrenome, apelido, nascimento, idade,
estado, nacionalidade, encarregados_idencarregados1, endereco_idendereco, polo_idpolo)
VALUES (1001, 'Conceição', 'Catarina', 'Atitude', '2006-11-30', 15, 'ativo', 'angolana', 2003, 0001, 1);

INSERT INTO capoeristas (idcapoerista, nome, sobrenome, apelido, nascimento, idade,
estado, nacionalidade, encarregados_idencarregados1, endereco_idendereco, polo_idpolo)
VALUES (1003, 'Ponteciana', 'Mateus', 'Carrapito', '2005-11-21', 16, 'ativo', 'angolana', 2001, 0002, 1);

INSERT INTO capoeristas (idcapoerista, nome, sobrenome, apelido, nascimento, idade,
estado, nacionalidade, encarregados_idencarregados1, endereco_idendereco, polo_idpolo)
VALUES (1004, 'Welwitschia', 'Firmino', 'Revelação', '2016-03-27', 6, 'ativo', 'angolana', 2001, 0002, 1);

INSERT INTO capoeristas (idcapoerista, nome, sobrenome, nascimento, idade,
estado, nacionalidade, encarregados_idencarregados1, endereco_idendereco, polo_idpolo)
VALUES (1005, 'Stefania', 'Manuel', '2002-05-11', 20, 'ativo', 'angolana', 2002, 0003, 1);

INSERT INTO capoeristas (idcapoerista, nome, sobrenome, nascimento, idade,
estado, nacionalidade, encarregados_idencarregados1, endereco_idendereco, polo_idpolo)
VALUES (1006, 'Dádiva', 'Frederico', '2014-08-29', 8, 'ativo', 'angolana', 2002, 0003, 1);

INSERT INTO capoeristas (idcapoerista, nome, sobrenome, apelido, nascimento, idade,
estado, nacionalidade, encarregados_idencarregados1, endereco_idendereco, polo_idpolo)
VALUES (1007, 'Raquel', 'Fernandes', 'Circo', '2011-01-22', 11, 'ativo', 'angolana', 2001, 0002, 1);

INSERT INTO capoeristas (idcapoerista, nome, sobrenome, apelido, nascimento, idade,
estado, nacionalidade, encarregados_idencarregados1, endereco_idendereco, polo_idpolo)
VALUES (1009, 'Percy', 'Paulo', 'Bolacha', '2011-04-01', 11, 'ativo', 'angolano', 2004, 0001, 1);

INSERT INTO capoeristas (idcapoerista, nome, sobrenome, apelido, nascimento, idade,
estado, nacionalidade, encarregados_idencarregados1, endereco_idendereco, polo_idpolo)
VALUES (1010, 'Yasmin', 'Paulo', 'Boneca', '2016-03-18', 6, 'ativo', 'angolana', 2004, 0001, 1);

INSERT INTO capoeristas (idcapoerista, nome, sobrenome, apelido, nascimento, idade,
estado, nacionalidade, encarregados_idencarregados1, endereco_idendereco, polo_idpolo)
VALUES (1012, 'Ladislau', 'André', 'Mavinga', '1998-10-01', 24, 'ativo', 'angolano', 0,  0004, 1);

INSERT INTO capoeristas (idcapoerista, nome, sobrenome, apelido, nascimento, idade,
estado, nacionalidade, encarregados_idencarregados1, endereco_idendereco, polo_idpolo)
VALUES (1014, 'Lucibela', 'Sebastião', 'Luz', '2011-02-09', 11, 'ativo', 'angolana', 2008, 0005, 1);

INSERT INTO capoeristas (idcapoerista, nome, sobrenome, apelido,
estado, nacionalidade, encarregados_idencarregados1, endereco_idendereco, polo_idpolo)
VALUES (1015, 'Zélia', 'Bernardo', 'Tropa', 'ativo', 'angolana', 2008, 0005, 1);

INSERT INTO capoeristas (idcapoerista, nome, sobrenome, apelido, nascimento, idade,
estado, nacionalidade, encarregados_idencarregados1, endereco_idendereco, polo_idpolo)
VALUES (1016, 'Kuamy', 'Sebastião', 'Mimoso', '2014-05-04', 8, 'ativo', 'angolano', 2008, 0005, 1);

-- apagar a linha nos endereços onde o id é igual a 0006 e 0007

INSERT INTO capoeristas (idcapoerista, nome, sobrenome, nascimento, idade,
estado, nacionalidade, encarregados_idencarregados1, endereco_idendereco, polo_idpolo)
VALUES (1017, 'Luana', 'Sebastião', '2015-12-26', 6, 'ativo', 'angolana', 2008, 0005, 1);

INSERT INTO capoeristas (idcapoerista, nome, sobrenome, apelido, nascimento, idade,
estado, nacionalidade, encarregados_idencarregados1, endereco_idendereco, polo_idpolo)
VALUES (1018, 'Cristovão', 'Francisco', 'Loveman', '2002-05-28', 20, 'ativo', 'angolano', 0, 0008, 1);

INSERT INTO capoeristas (idcapoerista, nome, sobrenome, apelido, nascimento, idade,
estado, nacionalidade, encarregados_idencarregados1, endereco_idendereco, polo_idpolo)
VALUES (1024, 'Emarilson', 'Cabral', 'Bamba', '2013-05-01', 9, 'ativo', 'angolano', 2011, 0009, 1);

INSERT INTO capoeristas (idcapoerista, nome, sobrenome, apelido, nascimento, idade,
estado, nacionalidade, encarregados_idencarregados1, endereco_idendereco, polo_idpolo)
VALUES (1027, 'Hibert', 'França', 'Balão', '2014-04-07', 8, 'ativo', 'angolano', 2014, 0001, 1);

INSERT INTO capoeristas (idcapoerista, nome, sobrenome, apelido, nascimento, idade,
estado, nacionalidade, encarregados_idencarregados1, endereco_idendereco, polo_idpolo)
VALUES (1033, 'Emanuel', 'Capitão', 'Tarla', '1999-03-23', 11, 'ativo', 'angolano', 0, 0011, 1);

INSERT INTO capoeristas (idcapoerista, nome, sobrenome, nascimento, idade,
estado, nacionalidade, encarregados_idencarregados1, endereco_idendereco, polo_idpolo)
VALUES (1034, 'Edissa', 'Ferreira', '2014-03-18', 8, 'ativo', 'angolana', 2017, 0001, 1);

INSERT INTO capoeristas (idcapoerista, nome, sobrenome, apelido, nascimento, idade,
estado, nacionalidade, encarregados_idencarregados1, endereco_idendereco, polo_idpolo)
VALUES (1036, 'Edmilson', 'Advindo', 'Totó', '2000-09-05', 22, 'ativo', 'angolano', 0, 0012, 1);

INSERT INTO capoeristas (idcapoerista, nome, sobrenome, apelido, nascimento, idade,
estado, nacionalidade, encarregados_idencarregados1, endereco_idendereco, polo_idpolo)
VALUES (1037, 'Maciel', 'Amaral', 'Shodó', '2008-03-25', 14, 'ativo', 'angolano', 2018, 0013, 1);

INSERT INTO capoeristas (idcapoerista, nome, sobrenome, apelido, nascimento, idade,
estado, nacionalidade, encarregados_idencarregados1, endereco_idendereco, polo_idpolo)
VALUES (1038, 'Emanuel', 'Amaral', 'Dragão', '2002-06-20', 20, 'ativo', 'angolano', 2018, 0013, 1);

INSERT INTO capoeristas (idcapoerista, nome, sobrenome, nascimento, idade,
estado, nacionalidade, encarregados_idencarregados1, endereco_idendereco, polo_idpolo)
VALUES (1039, 'José', 'da Silva', '2017-12-16', 4, 'ativo', 'angolano', 2019, 0014, 1);

INSERT INTO capoeristas (idcapoerista, nome, sobrenome, nascimento, idade,
estado, nacionalidade, encarregados_idencarregados1, endereco_idendereco, polo_idpolo)
VALUES (1040, 'Eduane', 'Demba', '2012-09-14', 10, 'ativo', 'angolano', 2020, 0015, 1);

INSERT INTO capoeristas (idcapoerista, nome, sobrenome, nascimento, idade,
estado, nacionalidade, encarregados_idencarregados1, endereco_idendereco, polo_idpolo)
VALUES (1041, 'Alicia', 'Demba', '2015-05-05', 7, 'ativo', 'angolana', 2020, 0015, 1);


-- Terminei de inserir os dados dos capoeristas
-- checando como estão os dados
select * from capoeristas;
-- estão todos nos conformes








    


    
