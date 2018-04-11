CREATE DATABASE MyCard;

USE MyCard;

CREATE TABLE USER (
  user_id			INT NOT NULL AUTO_INCREMENT UNIQUE,
  name		  	VARCHAR(20) NOT NULL,
  surname	  	VARCHAR(20) NOT NULL,
  birth				DATE NOT NULL,
  email 			VARCHAR(40) NOT NULL,
  passw 			VARCHAR(20) NOT NULL,
  photo       BLOB NULL,
  PRIMARY KEY (user_id))
ENGINE = 'InnoDB';

CREATE TABLE  CARD (
  card_id			INT NOT NULL AUTO_INCREMENT UNIQUE,
  user_id     INT NOT NULL,
  title       VARCHAR(20) NOT NULL,
  name		  	VARCHAR(20) NOT NULL,
  surname	  	VARCHAR(20) NOT NULL,
  email 			VARCHAR(40) NOT NULL,
  phone 			VARCHAR(20) NOT NULL,
  photo       BLOB NULL,
  note        VARCHAR(300),
  INDEX newCARD (user_id),
  PRIMARY KEY (card_id),
  FOREIGN KEY (user_id) REFERENCES USER (user_id))
ENGINE = 'InnoDB';

CREATE TABLE  MEETING (
  meeting_id	INT NOT NULL AUTO_INCREMENT UNIQUE,
  user_id			INT NOT NULL,
  title       VARCHAR(40) NOT NULL,
  place       VARCHAR(40) NOT NULL,
  date        DATETIME(),
  topic		    VARCHAR(300) NULL,
  lat 		  	FLOAT( 10, 6 ) NOT NULL,
  lng 		    FLOAT( 10, 6 ) NOT NULL,
  INDEX newMEETING (user_id),
  PRIMARY KEY (meeting_id),
  FOREIGN KEY (user_id) REFERENCES USER (user_id))
ENGINE = 'InnoDB';

CREATE TABLE  COMPANY (
 company_id		INT NOT NULL AUTO_INCREMENT UNIQUE,
 name         VARCHAR (20) NOT NULL,
 place        VARCHAR (40) NOT NULL,
 web          VARCHAR (40) NOT NULL,
 email        VARCHAR (40) NOT NULL,
 note				  VARCHAR (300) NULL,
 PRIMARY KEY (company_id))
ENGINE = 'InnoDB';

CREATE TABLE  INVITE (
  user_id			INT NOT NULL,
  meeting_id	INT NOT NULL,
  INDEX newID (user_id),
  INDEX newINVITE (meeting_id),
  PRIMARY KEY (user_id, meeting_id),
  FOREIGN KEY (user_id) REFERENCES USER (user_id),
  FOREIGN KEY (meeting_id) REFERENCES MEETING (meeting_id))
ENGINE = 'InnoDB';

CREATE TABLE  PARTECIPATE (
  user_id			INT NOT NULL,
  meeting_id	INT NOT NULL,
  INDEX new_ID (user_id),
  INDEX newPARTECIPATE (meeting_id),
  PRIMARY KEY (user_id, meeting_id),
  FOREIGN KEY (user_id) REFERENCES USER (user_id),
  FOREIGN KEY (meeting_id) REFERENCES MEETING (meeting_id))
ENGINE = 'InnoDB';

CREATE TABLE  WALLET (
  user_id			INT NOT NULL,
  meeting_id	INT NOT NULL,
  card_id     INT NOT NULL,
  note        VARCHAR (300) NULL,
  rating      TINYINT NULL,
  INDEX new_USER (user_id),
  INDEX new_MEETING (meeting_id),
  INDEX newWALLET (card_id),
  PRIMARY KEY (user_id, meeting_id, card_id),
  FOREIGN KEY (user_id) REFERENCES USER (user_id),
  FOREIGN KEY (meeting_id) REFERENCES MEETING (meeting_id),
  FOREIGN KEY (card_id) REFERENCES CARD (card_id))
ENGINE = 'InnoDB';
