-- CREATE BY LAHATRA AND DAMA 
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+03:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- BASE DE DONNÉES: `QUIZ` 
CREATE DATABASE IF NOT EXISTS quiz;
USE quiz;

CREATE TABLE IF NOT EXISTS ADMINISTRATEUR (
    ID INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NOM VARCHAR(255) NOT NULL,
    MDP VARCHAR(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS USERS (
    ID INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NOM VARCHAR(255) NOT NULL,
    PRENOM VARCHAR(255) NOT NULL,
    EMAIL VARCHAR(255) NOT NULL,
    SCORE VARCHAR(255) NOT NULl
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS QUESTION (
    ID INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ENONCE TEXT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS DESCRIPTIONS (
    ID INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ENONCE TEXT NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS REPONSE (
    ID INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    REPONSE TEXT NOT NULL,
    ID_QUESTION INT(11) NOT NULL,
    CONSTRAINT fk_id_question_reponse FOREIGN KEY(ID_QUESTION) REFERENCES QUESTION(ID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS CHOIX (
    ID INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ID_USER INT(11) NOT NULL,
    ID_REPONSE INT(11) NOT NULL,
    CONSTRAINT fk_id_user_choix FOREIGN KEY(ID_USER) REFERENCES USERS(ID),
    CONSTRAINT fk_id_reponse_choix FOREIGN KEY(ID_REPONSE) REFERENCES REPONSE(ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `QUESTION_ENONCE` (
    ID_QUESTION INT(11) NOT NULL,
    ID_DESCRIPTION INT(11) NOT NULL,
    CONSTRAINT fk_id_question_ques_enonce FOREIGN KEY(ID_QUESTION) REFERENCES QUESTION(ID),
    CONSTRAINT fk_id_description_que_enonce FOREIGN KEY(ID_DESCRIPTION) REFERENCES DESCRIPTIONS(ID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;