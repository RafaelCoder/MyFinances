create table contas(
  Con_Codigo INTEGER,
  Con_Descricao VARCHAR(200),
  PRIMARY KEY (Con_Codigo)
);

create table historicos(
  His_Codigo INTEGER,
  His_Descricao VARCHAR(200),
  His_Tipo CHAR(1), -- C/D
  PRIMARY KEY (His_Codigo)
);

create table categorias(
  Cat_Codigo INTEGER,
  Cat_Descricao VARCHAR(200),
  PRIMARY KEY (Cat_Codigo)
);

create table subcategorias(
  Cat_Codigo INTEGER,
  SbCat_Codigo INTEGER,
  SbCat_Descricao VARCHAR(200),
  FOREIGN KEY (Cat_Codigo) REFERENCES Categorias(Cat_Codigo),
  PRIMARY KEY (Cat_Codigo, SbCat_Codigo)
);

create table lancamentos(
  Lan_Codigo INTEGER,
  Con_Codigo INTEGER,
  His_Codigo INTEGER,
  Cat_Codigo INTEGER,
  SbCat_Codigo INTEGER,
  Lan_DataHoraLcto DATETIME,
  Lan_Valor DOUBLE,
  FOREIGN KEY (Con_Codigo) REFERENCES Contas(Con_Codigo),
  FOREIGN KEY (His_Codigo) REFERENCES Historicos(His_Codigo),
  FOREIGN KEY (Cat_Codigo) REFERENCES Categorias(Cat_Codigo),
  FOREIGN KEY (Cat_Codigo, SbCat_Codigo) REFERENCES SubCategorias(Cat_Codigo, SbCat_Codigo),
  PRIMARY KEY (Lan_Codigo)
);

