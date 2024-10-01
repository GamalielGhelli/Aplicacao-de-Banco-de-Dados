create table Loja(
numero_loja  char(10),
endereco  varchar(255) not null,
cidade varchar(100) not null,
estado char(10) check (estado in ('MG', 'GO', 'RJ', 'DF')),

constraint PK_Numero_Loja primary key(numero_loja)
);

create table Empregado(
CPF_empregado varchar(15),
nome varchar(100),
sexo varchar(10),
data_de_nascimento date check (data_de_nascimento < '2005-01-01'),
funcao varchar(50) check (funcao in('Gerente', 'Estoquista', 'Caixa', 'Padeiro', 'Açogueiro', 'Atendendte')),
loja_de_trabalho char(3),

constraint PK_CPF_empregado primary key (CPF_empregado),
constraint FK_loja_de_trabalho foreign key (loja_de_trabalho) references Loja(numero_loja)
);

create table Produto(
codigo_produto char(10),
nome_produto varchar(100),
unidade_de_medida varchar(50),

constraint PK_codigo_produto primary key (codigo_produto)
);

create table Estoque(
loja_estoque char(5),
codigo_produto char(10),
quantidade_em_estoque int,
valor_unitario decimal(10,2),

constraint PK_Estoque primary key ( loja_estoque, codigo_produto),
constraint FK_loja_estoque foreign key (loja_estoque) references Loja(numero_loja),
constraint FK_codigo_produto foreign key (codigo_produto) references Produto(codigo_produto)
);

create table Venda (
    numero_nota_fiscal int,
    loja char(5),
    data_venda date check (data_venda >= '2024-01-02'),
    codigo_produto char(10),
    nome_produto varchar(100),
    quantidade int,
    valor_unitario decimal(10,2),
    total_a_pagar decimal(10,2) generated always as (quantidade * valor_unitario) stored,
    constraint pk_venda primary key (numero_nota_fiscal, loja, data_venda, codigo_produto),
    constraint fk_loja foreign key (loja) references Loja(numero_loja),
    constraint fk_produto foreign key (codigo_produto) references Produto(codigo_produto)
);


