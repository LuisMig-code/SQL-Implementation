CREATE DATABASE Trabalho;

CREATE TABLE cozinhe (
	matricula INT NOT NULL ,
    nome VARCHAR(30) NOT NULL,
    data_admissao DATE NOT NULL,
    cpf  VARCHAR(11) NOT NULL,
    rg VARCHAR(20),
    salario DECIMAL(10,2),
    nome_fantasia VARCHAR(30),
    PRIMARY KEY(matricula)
);

CREATE TABLE degust (
	matricula INT NOT NULL ,
    nome VARCHAR(30) NOT NULL,
    data_admissao DATE NOT NULL,
    cpf  VARCHAR(11) NOT NULL,
    rg VARCHAR(20),
    salario DECIMAL(10,2),
    PRIMARY KEY(matricula)
);

CREATE TABLE editor (
	matricula INT NOT NULL ,
    nome VARCHAR(30) NOT NULL,
    data_admissao DATE NOT NULL,
    cpf  VARCHAR(11) NOT NULL,
    rg VARCHAR(20),
    salario DECIMAL(10,2),
    PRIMARY KEY(matricula)
);




CREATE TABLE restaurante (
	cod_restaurante INT NOT NULL,
    nome VARCHAR(30) NOT NULL,
    PRIMARY KEY (cod_restaurante)
);

CREATE TABLE cozinhe_trabalhou_restaurante(
	matriculaCozinhe INT NOT NULL,
    cod_restaurante INT NOT NULL,
    PRIMARY KEY(matriculaCozinhe , cod_restaurante),
    FOREIGN KEY(matriculaCozinhe) REFERENCES cozinhe(matricula),
    FOREIGN KEY(cod_restaurante) REFERENCES restaurante(cod_restaurante)
);



CREATE TABLE categoria (
	cod_cat INT NOT NULL,
    descricao VARCHAR(30) NOT NULL,
    PRIMARY KEY (cod_cat)
);

CREATE TABLE receita(
	cod_receita INT NOT NULL,
    matriculaCozinhe INT NOT NULL,
    cod_cat INT NOT NULL,
    nome VARCHAR(30) NOT NULL,
    porcoes INT,
    descricao VARCHAR(100),
    data_criacao DATE NOT NULL,
    PRIMARY KEY(cod_receita),
    FOREIGN KEY(matriculaCozinhe) REFERENCES cozinhe(matricula),
    FOREIGN KEY(cod_cat) REFERENCES categoria(cod_cat)
);

CREATE TABLE ingrediente(
	cod_ingrediente INT NOT NULL,
    nome VARCHAR(30) NOT NULL,
    descricao VARCHAR(100),
    PRIMARY KEY(cod_ingrediente)
);

CREATE TABLE receita_usa_ingrediente(
	cod_receita INT NOT NULL,
    cod_ingrediente INT NOT NULL,
    medida VARCHAR(20) NOT NULL,
    qtde INT NOT NULL,
    PRIMARY KEY(cod_receita , cod_ingrediente),
    FOREIGN KEY(cod_receita) REFERENCES receita(cod_receita),
    FOREIGN KEY(cod_ingrediente) REFERENCES ingrediente(cod_ingrediente)
);

CREATE TABLE degust_prova_receita(
	cod_receita INT NOT NULL,
    matriculaDegust INT NOT NULL,
    data_degust DATE NOT NULL,
    nota INT NOT NULL,
    PRIMARY KEY (cod_receita , matriculaDegust),
    FOREIGN KEY (cod_receita) REFERENCES receita(cod_receita),
    FOREIGN KEY (matriculaDegust) REFERENCES degust(matricula)
);




CREATE TABLE livro(
	isbn INT NOT NULL,
    matriculaEditor INT NOT NULL,
    titulo VARCHAR(20) NOT NULL,
    ano_publi INT NOT NULL,
    num_pags INT NOT NULL,
    PRIMARY KEY(isbn) ,
    FOREIGN KEY(matriculaEditor) REFERENCES editor(matricula)
);

CREATE TABLE livro_contem_receita(
	isbn INT NOT NULL,
    cod_receita INT NOT NULL,
    PRIMARY KEY(isbn , cod_receita),
    FOREIGN KEY(isbn) REFERENCES livro(isbn),
    FOREIGN KEY(cod_receita) REFERENCES receita(cod_receita)
);









