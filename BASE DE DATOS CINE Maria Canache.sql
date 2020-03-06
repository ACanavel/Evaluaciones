/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     06/03/2020 12:22:49                          */
/*==============================================================*/


drop table if exists ACTORES;

drop table if exists CINE;

drop table if exists COMENTARIOS;

drop table if exists DIRECTOR;

drop table if exists ELENCO;

drop table if exists ESTABLECEN;

drop table if exists FUNCIONES;

drop table if exists GENERAN;

drop table if exists INTEGRADO;

drop table if exists PELICULA;

drop table if exists PROMOCIONES;

drop table if exists SALA;

drop table if exists SE_CONFORMA;

drop table if exists SE_PROYECTA;

drop table if exists SE_VEN;

drop table if exists TRABAJA;

/*==============================================================*/
/* Table: ACTORES                                               */
/*==============================================================*/
create table ACTORES
(
   ID_ACTOR             int not null,
   NOM_ACTOR            varchar(25) not null,
   NACIONALIDAD         varchar(12) not null,
   PARTICIPACION        varchar(30) not null,
   primary key (ID_ACTOR)
);

/*==============================================================*/
/* Table: CINE                                                  */
/*==============================================================*/
create table CINE
(
   ID_CINE              int not null,
   SALA                 int not null,
   NOMBRE_CINE          varchar(15) not null,
   DIRECCION            varchar(50) not null,
   TELEFONO             int not null,
   primary key (ID_CINE)
);

/*==============================================================*/
/* Table: COMENTARIOS                                           */
/*==============================================================*/
create table COMENTARIOS
(
   ID_OPINION           int not null,
   NOMBRE               varchar(25) not null,
   EDAD                 int,
   FECHA_OP             date not null,
   FILME                varchar(30) not null,
   primary key (ID_OPINION)
);

/*==============================================================*/
/* Table: DIRECTOR                                              */
/*==============================================================*/
create table DIRECTOR
(
   ID_DIRECTOR          int not null,
   NOM_DIR              varchar(25) not null,
   NACIONALIDAD         varchar(12) not null,
   TRABAJOS             varchar(30) not null,
   primary key (ID_DIRECTOR)
);

/*==============================================================*/
/* Table: ELENCO                                                */
/*==============================================================*/
create table ELENCO
(
   ID_ELENCO            int not null,
   PELICULA             varchar(30) not null,
   primary key (ID_ELENCO)
);

/*==============================================================*/
/* Table: ESTABLECEN                                            */
/*==============================================================*/
create table ESTABLECEN
(
   ID_PROMOCION         int not null,
   ID_FUNCION           int not null,
   primary key (ID_PROMOCION, ID_FUNCION)
);

/*==============================================================*/
/* Table: FUNCIONES                                             */
/*==============================================================*/
create table FUNCIONES
(
   ID_FUNCION           int not null,
   FECHA_FUN            date not null,
   HORA                 time not null,
   PELICULA             varchar(30) not null,
   primary key (ID_FUNCION)
);

/*==============================================================*/
/* Table: GENERAN                                               */
/*==============================================================*/
create table GENERAN
(
   ID_OPINION           int not null,
   ID_FUNCION           int not null,
   primary key (ID_OPINION, ID_FUNCION)
);

/*==============================================================*/
/* Table: INTEGRADO                                             */
/*==============================================================*/
create table INTEGRADO
(
   ID_ACTOR             int not null,
   ID_ELENCO            int not null,
   primary key (ID_ACTOR, ID_ELENCO)
);

/*==============================================================*/
/* Table: PELICULA                                              */
/*==============================================================*/
create table PELICULA
(
   ID_PELICULA          int not null,
   TITULO_DISTRIB       varchar(30) not null,
   TITULO_ORIGINAL      varchar(30) not null,
   GENERO               varchar(10) not null,
   IDIOMA               varchar(10) not null,
   SUBTIT_E             bool not null,
   FECHA_PRODUC         date not null,
   SITIO_WEB            varchar(20) not null,
   DURACION             time not null,
   FECHA_ESTRENO        date not null,
   RESUMEN              varchar(50) not null,
   ELENCO               varchar(50) not null,
   CALIFICACION         int not null,
   primary key (ID_PELICULA)
);

/*==============================================================*/
/* Table: PROMOCIONES                                           */
/*==============================================================*/
create table PROMOCIONES
(
   ID_PROMOCION         int not null,
   TIPO_PROMOCION       varchar(15) not null,
   DESCUENTO            real not null,
   FUNCION              int,
   primary key (ID_PROMOCION)
);

/*==============================================================*/
/* Table: SALA                                                  */
/*==============================================================*/
create table SALA
(
   ID_SALA              int not null,
   ID_CINE              int not null,
   NOMBRE_SALA          varchar(10) not null,
   NUM_BUTACAS          int not null,
   FUNCION              int not null,
   primary key (ID_SALA)
);

/*==============================================================*/
/* Table: SE_CONFORMA                                           */
/*==============================================================*/
create table SE_CONFORMA
(
   ID_ELENCO            int not null,
   ID_PELICULA          int not null,
   primary key (ID_ELENCO, ID_PELICULA)
);

/*==============================================================*/
/* Table: SE_PROYECTA                                           */
/*==============================================================*/
create table SE_PROYECTA
(
   ID_CINE              int not null,
   ID_PELICULA          int not null,
   primary key (ID_CINE, ID_PELICULA)
);

/*==============================================================*/
/* Table: SE_VEN                                                */
/*==============================================================*/
create table SE_VEN
(
   ID_FUNCION           int not null,
   ID_SALA              int not null,
   primary key (ID_FUNCION, ID_SALA)
);

/*==============================================================*/
/* Table: TRABAJA                                               */
/*==============================================================*/
create table TRABAJA
(
   ID_DIRECTOR          int not null,
   ID_ELENCO            int not null,
   primary key (ID_DIRECTOR, ID_ELENCO)
);

alter table ESTABLECEN add constraint FK_ESTABLECEN foreign key (ID_PROMOCION)
      references PROMOCIONES (ID_PROMOCION) on delete restrict on update restrict;

alter table ESTABLECEN add constraint FK_ESTABLECEN2 foreign key (ID_FUNCION)
      references FUNCIONES (ID_FUNCION) on delete restrict on update restrict;

alter table GENERAN add constraint FK_GENERAN foreign key (ID_OPINION)
      references COMENTARIOS (ID_OPINION) on delete restrict on update restrict;

alter table GENERAN add constraint FK_GENERAN2 foreign key (ID_FUNCION)
      references FUNCIONES (ID_FUNCION) on delete restrict on update restrict;

alter table INTEGRADO add constraint FK_INTEGRADO foreign key (ID_ACTOR)
      references ACTORES (ID_ACTOR) on delete restrict on update restrict;

alter table INTEGRADO add constraint FK_INTEGRADO2 foreign key (ID_ELENCO)
      references ELENCO (ID_ELENCO) on delete restrict on update restrict;

alter table SALA add constraint FK_TIENE foreign key (ID_CINE)
      references CINE (ID_CINE) on delete restrict on update restrict;

alter table SE_CONFORMA add constraint FK_SE_CONFORMA foreign key (ID_ELENCO)
      references ELENCO (ID_ELENCO) on delete restrict on update restrict;

alter table SE_CONFORMA add constraint FK_SE_CONFORMA2 foreign key (ID_PELICULA)
      references PELICULA (ID_PELICULA) on delete restrict on update restrict;

alter table SE_PROYECTA add constraint FK_SE_PROYECTA foreign key (ID_CINE)
      references CINE (ID_CINE) on delete restrict on update restrict;

alter table SE_PROYECTA add constraint FK_SE_PROYECTA2 foreign key (ID_PELICULA)
      references PELICULA (ID_PELICULA) on delete restrict on update restrict;

alter table SE_VEN add constraint FK_SE_VEN foreign key (ID_FUNCION)
      references FUNCIONES (ID_FUNCION) on delete restrict on update restrict;

alter table SE_VEN add constraint FK_SE_VEN2 foreign key (ID_SALA)
      references SALA (ID_SALA) on delete restrict on update restrict;

alter table TRABAJA add constraint FK_TRABAJA foreign key (ID_DIRECTOR)
      references DIRECTOR (ID_DIRECTOR) on delete restrict on update restrict;

alter table TRABAJA add constraint FK_TRABAJA2 foreign key (ID_ELENCO)
      references ELENCO (ID_ELENCO) on delete restrict on update restrict;

