
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


    






    


    