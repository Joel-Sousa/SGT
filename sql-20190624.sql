CREATE DATABASE  IF NOT EXISTS `sistema_agendamento` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `sistema_agendamento`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: sistema_agendamento
-- ------------------------------------------------------
-- Server version	5.7.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `hst_arquivo`
--

DROP TABLE IF EXISTS `hst_arquivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hst_arquivo` (
  `NM_ARQUIVO` char(50) DEFAULT NULL,
  `CAMINHO` char(50) DEFAULT NULL,
  `ID_HST` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hst_arquivo`
--

LOCK TABLES `hst_arquivo` WRITE;
/*!40000 ALTER TABLE `hst_arquivo` DISABLE KEYS */;
/*!40000 ALTER TABLE `hst_arquivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hst_ptl_arquivo`
--

DROP TABLE IF EXISTS `hst_ptl_arquivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hst_ptl_arquivo` (
  `ID_HST` int(11) NOT NULL,
  `nomeArquivo` varchar(100) DEFAULT NULL,
  `novoNomeArquivo` varchar(100) DEFAULT NULL,
  `dtGravacao` datetime DEFAULT NULL,
  `idAnexo` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idAnexo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hst_ptl_arquivo`
--

LOCK TABLES `hst_ptl_arquivo` WRITE;
/*!40000 ALTER TABLE `hst_ptl_arquivo` DISABLE KEYS */;
INSERT INTO `hst_ptl_arquivo` VALUES (1,'C:\\fakepath\\Joel Francisco de Sousa.pdf','35815.pdf','2019-06-22 14:58:08',1),(2,'C:\\fakepath\\Joel Francisco de Sousa.pdf','18416.pdf','2019-06-22 17:25:34',4),(1,'C:\\fakepath\\1 (8).jpg','45264.jpg','2019-06-24 09:41:44',5);
/*!40000 ALTER TABLE `hst_ptl_arquivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hst_quadro`
--

DROP TABLE IF EXISTS `hst_quadro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hst_quadro` (
  `CD_QUADRO` int(11) NOT NULL AUTO_INCREMENT,
  `NM_QUADRO` varchar(100) DEFAULT NULL,
  `CHV_FUN_GRAVACAO` varchar(100) DEFAULT NULL,
  `DT_GRAVACAO` datetime DEFAULT NULL,
  `DT_ENTREGA` datetime DEFAULT NULL,
  `CHV_FUN_RESPONSAVEL` varchar(100) DEFAULT NULL,
  `SITUACAO_QUADRO` int(11) DEFAULT NULL,
  `CONTROLE_SITUACAO` int(11) DEFAULT NULL,
  `DATA_VALIDACAO` datetime DEFAULT NULL,
  `TIPO_ROTINA` int(11) DEFAULT NULL,
  `CONTROLE_QUADRO_NOVO` int(11) DEFAULT NULL,
  `ORDEM_QUADRO` int(11) DEFAULT NULL,
  `DT_ORDEM_QUADRO` datetime DEFAULT NULL,
  `CHV_ORDEM_QUADRO` varchar(100) DEFAULT NULL,
  `ORDEM_RELATORIO` int(11) DEFAULT NULL,
  `DT_ORDEM_RELATORIO` datetime DEFAULT NULL,
  `CHV_ORDEM_RELATORIO` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CD_QUADRO`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hst_quadro`
--

LOCK TABLES `hst_quadro` WRITE;
/*!40000 ALTER TABLE `hst_quadro` DISABLE KEYS */;
INSERT INTO `hst_quadro` VALUES (1,'Teste','F7034899','2019-06-22 00:00:00',NULL,'t1010',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'teste','F7034899','2019-06-22 00:00:00',NULL,'g2020',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'Desenvolver documentaçao para SGT','F7034899','2019-06-24 00:00:00',NULL,'T107843',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'Desenvolver Sessao do SGT','F7034899','2019-06-24 00:00:00',NULL,'T1078429',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'Avaliar SGT e','F7034899','2019-06-24 00:00:00',NULL,'g202090',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'Ministrar aula de java','F7034899','2019-06-24 00:00:00',NULL,'t20289',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'ministrar aula de algoritimo e logica de programacao','F7034899','2019-06-24 00:00:00',NULL,'t20289',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `hst_quadro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hst_responsaveis`
--

DROP TABLE IF EXISTS `hst_responsaveis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hst_responsaveis` (
  `CHV_FUN_RESPONSAVEL` varchar(100) DEFAULT NULL,
  `NM_RESP` varchar(100) DEFAULT NULL,
  `FUNCAO` varchar(100) DEFAULT NULL,
  `MODO_VISUALIZACAO` varchar(100) DEFAULT NULL,
  `COLOR` varchar(100) DEFAULT NULL,
  `COD_RESP` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`COD_RESP`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hst_responsaveis`
--

LOCK TABLES `hst_responsaveis` WRITE;
/*!40000 ALTER TABLE `hst_responsaveis` DISABLE KEYS */;
INSERT INTO `hst_responsaveis` VALUES ('T107843','Clodo Reis','Estagiario',NULL,'#52bdf8',7),('T1078429','Joel ','Estagiario',NULL,'#ff00ff',8),('g202090','Vanessa ','Diretora',NULL,'#ff8080',9),('t20289','Joao evangelista','Professor',NULL,'#30d32c',10);
/*!40000 ALTER TABLE `hst_responsaveis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hst_tarefa`
--

DROP TABLE IF EXISTS `hst_tarefa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hst_tarefa` (
  `ID_TAREFA` int(11) NOT NULL AUTO_INCREMENT,
  `RESUMO` varchar(100) DEFAULT NULL,
  `CHV_FUN_RESPONSAVEL` varchar(100) DEFAULT NULL,
  `DESCRICAO` varchar(100) DEFAULT NULL,
  `CD_SIS` int(11) DEFAULT NULL,
  `SITUACAO_TAREFA` varchar(100) DEFAULT NULL,
  `DT_REQUISICAO` datetime DEFAULT NULL,
  `CHV_FUN_REQUISICAO` varchar(100) DEFAULT NULL,
  `PRIORIDADE` varchar(100) DEFAULT NULL,
  `CD_QUADRO` int(11) DEFAULT NULL,
  `DT_PREVISTA` date DEFAULT NULL,
  `DT_EFETIVA` datetime DEFAULT NULL,
  `SITUACAO_REQUISITANTE` int(11) DEFAULT NULL,
  `CONTROLE_NOVA_TAREFA` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_TAREFA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hst_tarefa`
--

LOCK TABLES `hst_tarefa` WRITE;
/*!40000 ALTER TABLE `hst_tarefa` DISABLE KEYS */;
/*!40000 ALTER TABLE `hst_tarefa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hst_tb_comentario`
--

DROP TABLE IF EXISTS `hst_tb_comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hst_tb_comentario` (
  `ID_CMTR` int(11) NOT NULL AUTO_INCREMENT,
  `CMTR` char(50) DEFAULT NULL,
  `DT_CMTR` char(50) DEFAULT NULL,
  `CHV_FUN_CMTR` char(50) DEFAULT NULL,
  `ID_HST` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_CMTR`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hst_tb_comentario`
--

LOCK TABLES `hst_tb_comentario` WRITE;
/*!40000 ALTER TABLE `hst_tb_comentario` DISABLE KEYS */;
INSERT INTO `hst_tb_comentario` VALUES (1,'Parabens !','2019-06-24 10:02:47','t1010',7),(2,'muito bom !','2019-06-24 10:02:54','t1010',7);
/*!40000 ALTER TABLE `hst_tb_comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hst_tb_historias`
--

DROP TABLE IF EXISTS `hst_tb_historias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hst_tb_historias` (
  `ID_HST` int(11) NOT NULL AUTO_INCREMENT,
  `RESUMO` varchar(100) DEFAULT NULL,
  `CHV_FUN_RESPONSAVEL` varchar(100) DEFAULT NULL,
  `DESCRICAO` varchar(100) DEFAULT NULL,
  `CD_SIS` int(11) DEFAULT NULL,
  `SITUACAO` varchar(100) DEFAULT NULL,
  `DT_REQUISICAO` datetime DEFAULT NULL,
  `CHV_FUN_REQUISICAO` varchar(100) DEFAULT NULL,
  `PRIORIDADE` varchar(100) DEFAULT NULL,
  `CD_QUADRO` int(11) DEFAULT NULL,
  `DT_PREVISTA` date DEFAULT NULL,
  `DT_EFETIVA` datetime DEFAULT NULL,
  `SITUACAO_REQUISITANTE` int(11) DEFAULT NULL,
  `CONTROLE_NOVA_TAREFA` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_HST`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hst_tb_historias`
--

LOCK TABLES `hst_tb_historias` WRITE;
/*!40000 ALTER TABLE `hst_tb_historias` DISABLE KEYS */;
INSERT INTO `hst_tb_historias` VALUES (1,NULL,NULL,'teste2',NULL,'0','2019-06-22 00:00:00','F7034899',NULL,1,NULL,NULL,NULL,NULL),(2,NULL,NULL,'teste',NULL,'0','2019-06-22 00:00:00','F7034899',NULL,2,NULL,NULL,NULL,NULL),(3,NULL,NULL,'Desevolver os documentos de Visao, Requisitos, Regra de negocio e suas especificações',NULL,'1','2019-06-24 00:00:00','F7034899',NULL,3,'2019-06-25','2019-06-24 00:00:00',NULL,NULL),(4,NULL,NULL,'desenvolver sessao do projeto',NULL,'0','2019-06-24 00:00:00','F7034899',NULL,4,NULL,NULL,NULL,NULL),(5,NULL,NULL,'Desenvolver banco de dados',NULL,'1','2019-06-24 00:00:00','F7034899',NULL,4,'2019-06-17',NULL,NULL,NULL),(6,NULL,NULL,'Ministrar no dia 23-06',NULL,'2','2019-06-24 00:00:00','F7034899',NULL,6,'2019-06-24','2019-06-24 00:00:00',NULL,NULL),(7,NULL,NULL,'juntar os alunos de si e tads',NULL,'2','2019-06-24 00:00:00','F7034899',NULL,6,'2019-06-24','2019-06-24 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `hst_tb_historias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hst_usuario`
--

DROP TABLE IF EXISTS `hst_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hst_usuario` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(20) NOT NULL,
  `usuario` varchar(20) DEFAULT NULL,
  `senha` varchar(20) DEFAULT NULL,
  `perfil` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hst_usuario`
--

LOCK TABLES `hst_usuario` WRITE;
/*!40000 ALTER TABLE `hst_usuario` DISABLE KEYS */;
INSERT INTO `hst_usuario` VALUES (1,'t1010','Clodo','123','Gestor'),(2,'t2020','junim','123','Tecnico');
/*!40000 ALTER TABLE `hst_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'sistema_agendamento'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-24 10:16:24
