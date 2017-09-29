CREATE TABLE Usuario(
	Email VARCHAR(100),
	Nome VARCHAR(100) NOT NULL,
	Senha VARCHAR(100) NOT NULL,
	Profissao VARCHAR(100) NOT NULL,	
	Sexo VARCHAR(10) NOT NULL,
	Foto_Perfil TEXT NOT NULL,
	Cidade VARCHAR(100) NOT NULL,
	Nascimento VARCHAR(10) NOT NULL,
	CONSTRAINT UsuarioPK PRIMARY KEY(Email)
);

CREATE TABLE Local(
	ID SERIAL,
	Usuario VARCHAR(100),		
	Nome VARCHAR(100) NOT NULL,	
	Rua VARCHAR(100) NOT NULL,
	Cidade VARCHAR(100) NOT NULL,
	Descricao TEXT NOT NULL,
	Estado VARCHAR(100) NOT NULL,
	Tipo VARCHAR(100) NOT NULL,
	CONSTRAINT LocalPK PRIMARY KEY(ID),
	CONSTRAINT LocalFK FOREIGN KEY(Usuario) 
		REFERENCES Usuario(Email) 
			ON UPDATE CASCADE 
			ON DELETE CASCADE
);

CREATE TABLE Evento(
	ID SERIAL,
	Usuario VARCHAR(100) NOT NULL,	
	ID_Local INT NOT NULL,
	Nome VARCHAR(100) NOT NULL,
	Data VARCHAR(10) NOT NULL,	
	Hora VARCHAR(15) NOT NULL,	
	Local VARCHAR(100) NOT NULL,
	Descricao TEXT NOT NULL,
	CONSTRAINT EventoPK PRIMARY KEY(ID),
	CONSTRAINT EventoFK1 FOREIGN KEY(Usuario) 
		REFERENCES Usuario(Email) 
			ON UPDATE CASCADE 
			ON DELETE CASCADE,
	CONSTRAINT EventoFK2 FOREIGN KEY(ID_Local) 
		REFERENCES Local(ID) 
			ON UPDATE CASCADE 
			ON DELETE CASCADE
);

CREATE TABLE Avaliacao_Local(
	ID_Local INT,	
	Usuario VARCHAR(100),
	Nota_Local INT NOT NULL,
	CONSTRAINT Avaliacao_LocalPK PRIMARY KEY(ID_Local, Usuario),
	CONSTRAINT Avaliacao_LocalFK1 FOREIGN KEY (ID_Local) 
		REFERENCES Local(ID) 
			ON UPDATE CASCADE 
			ON DELETE CASCADE,
	CONSTRAINT Avaliacao_LocalFK2 FOREIGN KEY (Usuario) 
		REFERENCES Usuario(Email) 
			ON UPDATE CASCADE 
			ON DELETE CASCADE
);

CREATE TABLE Presenca_Local(	
	ID_Local INT,
	Usuario VARCHAR(100),
	Comentario TEXT NOT NULL,	
	Status VARCHAR(50) NOT NULL,
	Data VARCHAR(10),
	CONSTRAINT Presenca_LocalPK PRIMARY KEY(ID_Local, Usuario, Data),
	CONSTRAINT Presenca_LocalFK1 FOREIGN KEY(Usuario) 
		REFERENCES Usuario(Email) 
			ON UPDATE CASCADE 
			ON DELETE CASCADE,	
	CONSTRAINT Presenca_LocalFK2 FOREIGN KEY(ID_Local) 
		REFERENCES Local(ID) 
			ON UPDATE CASCADE 
			ON DELETE CASCADE
);

CREATE TABLE Presenca_Evento(	
	ID_Evento INT,
	Usuario VARCHAR(100),
	Comentario TEXT NOT NULL,	
	Status VARCHAR(50) NOT NULL,
	Data VARCHAR(10),
	CONSTRAINT Presenca_EventoPK PRIMARY KEY(ID_Evento, Usuario, Data),
	CONSTRAINT Presenca_EventoFK1 FOREIGN KEY(Usuario) 
		REFERENCES Usuario(Email) 
			ON UPDATE CASCADE 
			ON DELETE CASCADE,	
	CONSTRAINT Presenca_EventoFK2 FOREIGN KEY(ID_Evento) 
		REFERENCES Evento(ID) 
			ON UPDATE CASCADE 
			ON DELETE CASCADE
);

CREATE TABLE Divulgacao_Evento (
	ID SERIAL,
	ID_Evento INT,
	Usuario VARCHAR(100),
	CONSTRAINT Divulgacao_EventoPK PRIMARY KEY(ID),
	CONSTRAINT Divulgacao_EventoK1 FOREIGN KEY(Usuario) 
		REFERENCES Usuario(Email) 
			ON UPDATE CASCADE 
			ON DELETE CASCADE,	
	CONSTRAINT Divulgacao_EventoFK2 FOREIGN KEY(ID_Evento) 
		REFERENCES Evento(ID) 
			ON UPDATE CASCADE 
			ON DELETE CASCADE
);

CREATE TABLE Interacao(
	Usuario_Interaginte VARCHAR(100),
	Usuario_Interagido VARCHAR(100),
	Amizade BOOLEAN NOT NULL,
	Solicitacao_Amizade BOOLEAN NOT NULL,
	CONSTRAINT InteracaoPK PRIMARY KEY(
		Usuario_Interaginte, Usuario_Interagido),
	CONSTRAINT InteracaoFK1 FOREIGN KEY (Usuario_Interagido) 
		REFERENCES Usuario(Email) 
			ON UPDATE CASCADE 
			ON DELETE CASCADE,
	CONSTRAINT InteracaoFK2 FOREIGN KEY (Usuario_Interaginte) 
		REFERENCES Usuario(Email) 
			ON UPDATE CASCADE 
			ON DELETE CASCADE
);

CREATE TABLE Fotos_Local(
	ID SERIAL,
	ID_Local INT,	
	Foto TEXT,
	CONSTRAINT Fotos_LocalPK PRIMARY KEY(ID),	
	CONSTRAINT Fotos_LocalFK FOREIGN KEY(ID_Local) 
		REFERENCES Local(ID) 
			ON UPDATE CASCADE 
			ON DELETE CASCADE
);

CREATE TABLE Fotos_Presenca_Local(
	ID SERIAL,
	ID_Local INT,
	Foto TEXT,
	CONSTRAINT Fotos_Presenca_LocalPK PRIMARY KEY(ID),	
	CONSTRAINT Fotos_Presenca_LocalFK FOREIGN KEY (ID_Local) 
		REFERENCES Local(ID) 
			ON UPDATE CASCADE 
			ON DELETE CASCADE
);

CREATE TABLE Fotos_Presenca_Evento(	
	ID SERIAL,
	ID_Evento INT,
	Foto TEXT,
	CONSTRAINT Fotos_Presenca_EventoPK PRIMARY KEY(ID),	
	CONSTRAINT Fotos_Presenca_EventoFK FOREIGN KEY (ID_Evento) 
		REFERENCES Evento(ID) 
			ON UPDATE CASCADE 
			ON DELETE CASCADE
);

CREATE TABLE Mensagem(
	ID SERIAL,	
	Remetente VARCHAR(100),
	Destinatario VARCHAR(100),
	Mensagem TEXT NOT NULL,
	CONSTRAINT MensagemPK PRIMARY KEY(ID),	
	CONSTRAINT MensagemFK1 FOREIGN KEY(Remetente) 
		REFERENCES Usuario(Email) 
			ON UPDATE CASCADE 
			ON DELETE CASCADE,
	CONSTRAINT MensagemFK2 FOREIGN KEY(Destinatario) 
		REFERENCES Usuario(Email) 
			ON UPDATE CASCADE 
			ON DELETE CASCADE
);

CREATE TABLE Recomendacao_Local(
	ID SERIAL,
	Usuario_Recomendador VARCHAR(100),
	Usuario_Destino VARCHAR(100),
	ID_Local INT NOT NULL,
	CONSTRAINT Recomendacao_LocalPK PRIMARY KEY(ID),
	CONSTRAINT Recomendacao_LocalFK1 FOREIGN KEY(Usuario_Recomendador) 
		REFERENCES Usuario(Email) 
			ON UPDATE CASCADE 
			ON DELETE CASCADE,
	CONSTRAINT Recomendacao_LocalFK2 FOREIGN KEY(Usuario_Destino) 
		REFERENCES Usuario(Email) 
			ON UPDATE CASCADE 
			ON DELETE CASCADE,
	CONSTRAINT Recomendacao_LocalFK3 FOREIGN KEY(ID_Local) 
		REFERENCES Local(ID) 
			ON UPDATE CASCADE 
			ON DELETE CASCADE	
);