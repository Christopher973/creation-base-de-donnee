-- -----------------------------------------------------------------------------
--             Génération d'une base de données pour
--                      Oracle Version 10g
--                        (22/1/2022 18:03:49)
-- -----------------------------------------------------------------------------
--      Nom de la base : MLR1
--      Projet : Espace de travail
--      Auteur : MonNom
--      Date de dernière modification : 22/1/2022 18:03:19
-- -----------------------------------------------------------------------------

DROP TABLE RELAIS CASCADE CONSTRAINTS;

DROP TABLE PAIEMENT CASCADE CONSTRAINTS;

DROP TABLE CARTE_BANCAIRE CASCADE CONSTRAINTS;

DROP TABLE COMMANDE CASCADE CONSTRAINTS;

DROP TABLE LIVRAISON CASCADE CONSTRAINTS;

DROP TABLE CARTE_4_ETOILE CASCADE CONSTRAINTS;

DROP TABLE CLIENT CASCADE CONSTRAINTS;

DROP TABLE ARTICLE CASCADE CONSTRAINTS;

DROP TABLE AUTRE_ADRESSE CASCADE CONSTRAINTS;

DROP TABLE CHEQUE CASCADE CONSTRAINTS;

DROP TABLE APPARTENIR CASCADE CONSTRAINTS;

-- -----------------------------------------------------------------------------
--       CREATION DE LA BASE 
-- -----------------------------------------------------------------------------

CREATE DATABASE MLR1;

-- -----------------------------------------------------------------------------
--       TABLE : RELAIS
-- -----------------------------------------------------------------------------

CREATE TABLE RELAIS
   (
    NLIV CHAR(6)  NOT NULL,
    NPOINTRELAIS CHAR(6)  NULL,
    NOMPOINTRELAIS VARCHAR2(50)  NULL,
    ADRESSEPOINTRELAIS VARCHAR2(30)  NULL,
    CODEPOSTALEPOINTRELAIS CHAR(5)  NULL,
    VILLEPOINTRELAIS VARCHAR2(30)  NULL
,   CONSTRAINT PK_RELAIS PRIMARY KEY (NLIV)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : PAIEMENT
-- -----------------------------------------------------------------------------

CREATE TABLE PAIEMENT
   (
    NPAIEMENT CHAR(6)  NOT NULL,
    SUPPORTPAIEMENT CHAR(6)  NULL
,   CONSTRAINT PK_PAIEMENT PRIMARY KEY (NPAIEMENT)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : CARTE_BANCAIRE
-- -----------------------------------------------------------------------------

CREATE TABLE CARTE_BANCAIRE
   (
    NCB CHAR(16)  NOT NULL,
    NPAIEMENT CHAR(6)  NOT NULL,
    NOMCB VARCHAR2(30)  NULL,
    DATEEXPIRATION CHAR(4)  NULL,
    CRYPTOGRAMME CHAR(3)  NULL,
    TYPEPAIEMENTCB CHAR(1)  NULL,
    SUPPORTPAIEMENT CHAR(6)  NULL
,   CONSTRAINT PK_CARTE_BANCAIRE PRIMARY KEY (NCB)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE CARTE_BANCAIRE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_CARTE_BANCAIRE_PAIEMENT
     ON CARTE_BANCAIRE (NPAIEMENT ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : COMMANDE
-- -----------------------------------------------------------------------------

CREATE TABLE COMMANDE
   (
    NBON CHAR(6)  NOT NULL,
    NCLIENT CHAR(6)  NOT NULL,
    NPAIEMENT CHAR(6)  NOT NULL,
    DATEBON DATE  NULL,
    MONTANTDEDUCTION NUMBER(3)  NULL,
    MODELIV VARCHAR2(11)  NULL,
    FRAISLIV NUMBER(2,1)  NULL
,   CONSTRAINT PK_COMMANDE PRIMARY KEY (NBON)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE COMMANDE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_COMMANDE_CLIENT
     ON COMMANDE (NCLIENT ASC)
    ;

CREATE UNIQUE INDEX I_FK_COMMANDE_PAIEMENT
     ON COMMANDE (NPAIEMENT ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : LIVRAISON
-- -----------------------------------------------------------------------------

CREATE TABLE LIVRAISON
   (
    NLIV CHAR(6)  NOT NULL,
    NBON CHAR(6)  NOT NULL
,   CONSTRAINT PK_LIVRAISON PRIMARY KEY (NLIV)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE LIVRAISON
-- -----------------------------------------------------------------------------

CREATE UNIQUE INDEX I_FK_LIVRAISON_COMMANDE
     ON LIVRAISON (NBON ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : CARTE_4_ETOILE
-- -----------------------------------------------------------------------------

CREATE TABLE CARTE_4_ETOILE
   (
    NC4 CHAR(16)  NOT NULL,
    NPAIEMENT CHAR(6)  NOT NULL,
    DATENAISSANCEC4 DATE  NULL,
    TYPEPAIEMENTC4 CHAR(1)  NULL,
    SUPPORTPAIEMENT CHAR(6)  NULL
,   CONSTRAINT PK_CARTE_4_ETOILE PRIMARY KEY (NC4)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE CARTE_4_ETOILE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_CARTE_4_ETOILE_PAIEMENT
     ON CARTE_4_ETOILE (NPAIEMENT ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : CLIENT
-- -----------------------------------------------------------------------------

CREATE TABLE CLIENT
   (
    NCLIENT CHAR(6)  NOT NULL,
    CIVILITE VARCHAR2(4)  NULL,
    NOM VARCHAR2(30)  NULL,
    PRENOM VARCHAR2(30)  NULL,
    ADRESSE VARCHAR2(30)  NULL,
    CODEPOSTALE CHAR(5)  NULL,
    VILLE VARCHAR2(30)  NULL,
    TELEPHONE CHAR(10)  NULL,
    TPORTABLE CHAR(10)  NULL,
    DATENAISSANCE DATE  NULL,
    EMAIL VARCHAR2(30)  NULL,
    PTFIDELITE NUMBER(5)  NULL
,   CONSTRAINT PK_CLIENT PRIMARY KEY (NCLIENT)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : ARTICLE
-- -----------------------------------------------------------------------------

CREATE TABLE ARTICLE
   (
    REFERENCE CHAR(6)  NOT NULL,
    NPAGE VARCHAR2(3)  NULL,
    DESIGNATION CHAR(50)  NULL,
    PRIXUNITAIRE NUMBER(5,2)  NULL
,   CONSTRAINT PK_ARTICLE PRIMARY KEY (REFERENCE)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : AUTRE_ADRESSE
-- -----------------------------------------------------------------------------

CREATE TABLE AUTRE_ADRESSE
   (
    NLIV CHAR(6)  NOT NULL,
    NOMLIV VARCHAR2(30)  NULL,
    PRENOMLIV VARCHAR2(30)  NULL,
    ADRESSELIV VARCHAR2(30)  NULL,
    CODEPOSTALELIV CHAR(5)  NULL,
    VILLELIV VARCHAR2(30)  NULL,
    TELEPHONELIV CHAR(10)  NULL
,   CONSTRAINT PK_AUTRE_ADRESSE PRIMARY KEY (NLIV)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : CHEQUE
-- -----------------------------------------------------------------------------

CREATE TABLE CHEQUE
   (
    NPAIEMENT CHAR(6)  NOT NULL,
    SUPPORTPAIEMENT CHAR(6)  NULL
,   CONSTRAINT PK_CHEQUE PRIMARY KEY (NPAIEMENT)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : APPARTENIR
-- -----------------------------------------------------------------------------

CREATE TABLE APPARTENIR
   (
    NBON CHAR(6)  NOT NULL,
    REFERENCE CHAR(6)  NOT NULL,
    QUANTITE NUMBER(3)  NULL
,   CONSTRAINT PK_APPARTENIR PRIMARY KEY (NBON, REFERENCE)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE APPARTENIR
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_APPARTENIR_COMMANDE
     ON APPARTENIR (NBON ASC)
    ;

CREATE  INDEX I_FK_APPARTENIR_ARTICLE
     ON APPARTENIR (REFERENCE ASC)
    ;


-- -----------------------------------------------------------------------------
--       CREATION DES REFERENCES DE TABLE
-- -----------------------------------------------------------------------------


ALTER TABLE RELAIS ADD (
     CONSTRAINT FK_RELAIS_LIVRAISON
          FOREIGN KEY (NLIV)
               REFERENCES LIVRAISON (NLIV))   ;

ALTER TABLE CARTE_BANCAIRE ADD (
     CONSTRAINT FK_CARTE_BANCAIRE_PAIEMENT
          FOREIGN KEY (NPAIEMENT)
               REFERENCES PAIEMENT (NPAIEMENT))   ;

ALTER TABLE COMMANDE ADD (
     CONSTRAINT FK_COMMANDE_CLIENT
          FOREIGN KEY (NCLIENT)
               REFERENCES CLIENT (NCLIENT))   ;

ALTER TABLE COMMANDE ADD (
     CONSTRAINT FK_COMMANDE_PAIEMENT
          FOREIGN KEY (NPAIEMENT)
               REFERENCES PAIEMENT (NPAIEMENT))   ;

ALTER TABLE LIVRAISON ADD (
     CONSTRAINT FK_LIVRAISON_COMMANDE
          FOREIGN KEY (NBON)
               REFERENCES COMMANDE (NBON))   ;

ALTER TABLE CARTE_4_ETOILE ADD (
     CONSTRAINT FK_CARTE_4_ETOILE_PAIEMENT
          FOREIGN KEY (NPAIEMENT)
               REFERENCES PAIEMENT (NPAIEMENT))   ;

ALTER TABLE AUTRE_ADRESSE ADD (
     CONSTRAINT FK_AUTRE_ADRESSE_LIVRAISON
          FOREIGN KEY (NLIV)
               REFERENCES LIVRAISON (NLIV))   ;

ALTER TABLE CHEQUE ADD (
     CONSTRAINT FK_CHEQUE_PAIEMENT
          FOREIGN KEY (NPAIEMENT)
               REFERENCES PAIEMENT (NPAIEMENT))   ;

ALTER TABLE APPARTENIR ADD (
     CONSTRAINT FK_APPARTENIR_COMMANDE
          FOREIGN KEY (NBON)
               REFERENCES COMMANDE (NBON))   ;

ALTER TABLE APPARTENIR ADD (
     CONSTRAINT FK_APPARTENIR_ARTICLE
          FOREIGN KEY (REFERENCE)
               REFERENCES ARTICLE (REFERENCE))   ;


-- -----------------------------------------------------------------------------
--                FIN DE GENERATION
-- -----------------------------------------------------------------------------