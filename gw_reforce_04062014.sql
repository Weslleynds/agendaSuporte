CREATE DATABASE  IF NOT EXISTS `gw_reforce` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `gw_reforce`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: gw_modelo
-- ------------------------------------------------------
-- Server version	5.6.10

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
-- Table structure for table `adiantamento`
--

DROP TABLE IF EXISTS `adiantamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adiantamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_titulo` bigint(20) DEFAULT NULL,
  `id_pedido_venda` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Adiantamento_Titulo` (`id_titulo`),
  KEY `FK_Adiantamento_PedidoVenda` (`id_pedido_venda`),
  CONSTRAINT `FK_Adiantamento_PedidoVenda` FOREIGN KEY (`id_pedido_venda`) REFERENCES `pedidovenda` (`id`),
  CONSTRAINT `FK_Adiantamento_Titulo` FOREIGN KEY (`id_titulo`) REFERENCES `titulo` (`id_titulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adiantamento`
--

LOCK TABLES `adiantamento` WRITE;
/*!40000 ALTER TABLE `adiantamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `adiantamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aditivo`
--

DROP TABLE IF EXISTS `aditivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aditivo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_contrato` bigint(20) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `id_modelo_contrato` int(11) DEFAULT NULL,
  `contrato` varchar(100) DEFAULT NULL,
  `descricao` varchar(5000) DEFAULT NULL,
  `abertura` bit(1) DEFAULT NULL,
  `id_gestor` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Aditico_Contrato` (`id_contrato`),
  KEY `FK_Aditivo_ModeloContrato` (`id_modelo_contrato`),
  CONSTRAINT `FK_Aditico_Contrato` FOREIGN KEY (`id_contrato`) REFERENCES `contrato` (`id`),
  CONSTRAINT `FK_Aditivo_ModeloContrato` FOREIGN KEY (`id_modelo_contrato`) REFERENCES `modelocontrato` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aditivo`
--

LOCK TABLES `aditivo` WRITE;
/*!40000 ALTER TABLE `aditivo` DISABLE KEYS */;
/*!40000 ALTER TABLE `aditivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ajuste`
--

DROP TABLE IF EXISTS `ajuste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ajuste` (
  `id_aditivo` bigint(20) NOT NULL,
  `data` datetime DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `reajuste_desconto` char(1) DEFAULT NULL,
  `ipca` float DEFAULT NULL,
  `igpm` float DEFAULT NULL,
  PRIMARY KEY (`id_aditivo`),
  CONSTRAINT `FK_Reajuste_Aditivo` FOREIGN KEY (`id_aditivo`) REFERENCES `aditivo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ajuste`
--

LOCK TABLES `ajuste` WRITE;
/*!40000 ALTER TABLE `ajuste` DISABLE KEYS */;
/*!40000 ALTER TABLE `ajuste` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ajusteestoque`
--

DROP TABLE IF EXISTS `ajusteestoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ajusteestoque` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_mov` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_AjusteEstoque_MovItem` (`id_mov`),
  CONSTRAINT `FK_AjusteEstoque_MovItem` FOREIGN KEY (`id_mov`) REFERENCES `movitem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ajusteestoque`
--

LOCK TABLES `ajusteestoque` WRITE;
/*!40000 ALTER TABLE `ajusteestoque` DISABLE KEYS */;
/*!40000 ALTER TABLE `ajusteestoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aliquotaestadual`
--

DROP TABLE IF EXISTS `aliquotaestadual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aliquotaestadual` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `destino` int(11) DEFAULT NULL,
  `aliq_icms` float DEFAULT NULL,
  `aliq_reducao_base` float DEFAULT NULL,
  `margem_lucro_subst` float DEFAULT NULL,
  `aliq_icms_subst` float DEFAULT NULL,
  `cst_icms` int(11) DEFAULT NULL,
  `id_regra` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_AliquotaEstadual_RegraTributacaoEstadual` (`id_regra`),
  CONSTRAINT `FK_AliquotaEstadual_RegraTributacaoEstadual` FOREIGN KEY (`id_regra`) REFERENCES `regratributacaoestadual` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aliquotaestadual`
--

LOCK TABLES `aliquotaestadual` WRITE;
/*!40000 ALTER TABLE `aliquotaestadual` DISABLE KEYS */;
/*!40000 ALTER TABLE `aliquotaestadual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aliquotamunicipal`
--

DROP TABLE IF EXISTS `aliquotamunicipal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aliquotamunicipal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `municipio` int(11) DEFAULT NULL,
  `id_regra` int(11) DEFAULT NULL,
  `aliquota_iss` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_AliquotaMunicipal_RegraTributacaoMunicipal` (`id_regra`),
  CONSTRAINT `FK_AliquotaMunicipal_RegraTributacaoMunicipal` FOREIGN KEY (`id_regra`) REFERENCES `regratributacaomunicipal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aliquotamunicipal`
--

LOCK TABLES `aliquotamunicipal` WRITE;
/*!40000 ALTER TABLE `aliquotamunicipal` DISABLE KEYS */;
/*!40000 ALTER TABLE `aliquotamunicipal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `almoxarife`
--

DROP TABLE IF EXISTS `almoxarife`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `almoxarife` (
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `Almoxarife_Pessoa` FOREIGN KEY (`id`) REFERENCES `pessoa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almoxarife`
--

LOCK TABLES `almoxarife` WRITE;
/*!40000 ALTER TABLE `almoxarife` DISABLE KEYS */;
/*!40000 ALTER TABLE `almoxarife` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aplicacaoveiculo`
--

DROP TABLE IF EXISTS `aplicacaoveiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aplicacaoveiculo` (
  `id_veiculo` bigint(20) NOT NULL,
  `id_itemapli` bigint(20) NOT NULL,
  PRIMARY KEY (`id_veiculo`,`id_itemapli`),
  KEY `FK_Aplicacao_Veiculo` (`id_veiculo`),
  KEY `FK_Aplicacao_Itemaplicacao` (`id_itemapli`),
  CONSTRAINT `FK_Aplicacao_Itemaplicacao` FOREIGN KEY (`id_itemapli`) REFERENCES `itemaplicacao` (`id`),
  CONSTRAINT `FK_Aplicacao_Veiculo` FOREIGN KEY (`id_veiculo`) REFERENCES `veiculo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aplicacaoveiculo`
--

LOCK TABLES `aplicacaoveiculo` WRITE;
/*!40000 ALTER TABLE `aplicacaoveiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `aplicacaoveiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aprovacaoproposta`
--

DROP TABLE IF EXISTS `aprovacaoproposta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aprovacaoproposta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_proposta` bigint(20) NOT NULL,
  `id_unidadenegocio` int(11) NOT NULL,
  `dia_vencto` int(11) DEFAULT NULL,
  `id_indice` int(11) DEFAULT NULL,
  `id_modelo_contrato` int(11) DEFAULT NULL,
  `num_manut_corretiva` int(11) DEFAULT NULL,
  `periodicidade_manut_prev` int(11) DEFAULT NULL,
  `observacao_contrato` varchar(500) DEFAULT NULL,
  `prazo_instalacao` int(11) DEFAULT NULL,
  `observacao_ordemservico` varchar(500) DEFAULT NULL,
  `cobranca` varchar(1) DEFAULT NULL,
  `id_configcobranca` int(11) DEFAULT NULL,
  `id_contrato` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_AprovacaoProposta_Proposta` (`id_proposta`),
  KEY `FK_AprovacaoProposta_UnidadeNegocio` (`id_unidadenegocio`),
  KEY `FK_AprovacaoProposta_ModeloContrato` (`id_modelo_contrato`),
  KEY `FK_Aprovacaoproposta_Configcobranca` (`id_configcobranca`),
  KEY `FK_Aprovacaoproposta_Contrato` (`id_contrato`),
  CONSTRAINT `FK_Aprovacaoproposta_Configcobranca` FOREIGN KEY (`id_configcobranca`) REFERENCES `configcobranca` (`id`),
  CONSTRAINT `FK_Aprovacaoproposta_Contrato` FOREIGN KEY (`id_contrato`) REFERENCES `contrato` (`id`),
  CONSTRAINT `FK_AprovacaoProposta_ModeloContrato` FOREIGN KEY (`id_modelo_contrato`) REFERENCES `modelocontrato` (`id`),
  CONSTRAINT `FK_AprovacaoProposta_Proposta` FOREIGN KEY (`id_proposta`) REFERENCES `proposta` (`id`),
  CONSTRAINT `FK_AprovacaoProposta_UnidadeNegocio` FOREIGN KEY (`id_unidadenegocio`) REFERENCES `unidadenegocio` (`id_unidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aprovacaoproposta`
--

LOCK TABLES `aprovacaoproposta` WRITE;
/*!40000 ALTER TABLE `aprovacaoproposta` DISABLE KEYS */;
/*!40000 ALTER TABLE `aprovacaoproposta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arquivosprocessados`
--

DROP TABLE IF EXISTS `arquivosprocessados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arquivosprocessados` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_empresa` bigint(20) NOT NULL,
  `data` datetime NOT NULL,
  `nome_arquivo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ArquivosProcessados_Empresa` (`id_empresa`),
  CONSTRAINT `FK_ArquivosProcessados_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arquivosprocessados`
--

LOCK TABLES `arquivosprocessados` WRITE;
/*!40000 ALTER TABLE `arquivosprocessados` DISABLE KEYS */;
/*!40000 ALTER TABLE `arquivosprocessados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atividade`
--

DROP TABLE IF EXISTS `atividade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atividade` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data` datetime NOT NULL,
  `descricao` varchar(500) DEFAULT NULL,
  `origem` varchar(20) DEFAULT NULL,
  `id_pessoa` bigint(20) NOT NULL,
  `interno_externo` char(1) DEFAULT NULL,
  `usuario` int(11) DEFAULT NULL,
  `titulo` varchar(40) DEFAULT NULL,
  `agendado` datetime DEFAULT NULL,
  `anterior` bigint(20) DEFAULT NULL,
  `proximo` bigint(20) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Atividade_Pessoa` (`id_pessoa`),
  KEY `FK_Atividade_Atividade` (`anterior`),
  KEY `FK_Atividade_AtividadeProximo` (`proximo`),
  CONSTRAINT `atividade_ibfk_1` FOREIGN KEY (`anterior`) REFERENCES `atividade` (`id`),
  CONSTRAINT `atividade_ibfk_2` FOREIGN KEY (`proximo`) REFERENCES `atividade` (`id`),
  CONSTRAINT `FK_Atividade_Pessoa` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atividade`
--

LOCK TABLES `atividade` WRITE;
/*!40000 ALTER TABLE `atividade` DISABLE KEYS */;
/*!40000 ALTER TABLE `atividade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atividadecontrato`
--

DROP TABLE IF EXISTS `atividadecontrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atividadecontrato` (
  `id_contrato` bigint(20) NOT NULL,
  `id_atividade` bigint(20) NOT NULL,
  PRIMARY KEY (`id_contrato`,`id_atividade`),
  KEY `FK_AtividadeContrato_Atividade` (`id_atividade`),
  CONSTRAINT `FK_AtividadeContrato_Atividade` FOREIGN KEY (`id_atividade`) REFERENCES `atividade` (`id`),
  CONSTRAINT `FK_AtividadeContrato_Contrato` FOREIGN KEY (`id_contrato`) REFERENCES `contrato` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atividadecontrato`
--

LOCK TABLES `atividadecontrato` WRITE;
/*!40000 ALTER TABLE `atividadecontrato` DISABLE KEYS */;
/*!40000 ALTER TABLE `atividadecontrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atividadelead`
--

DROP TABLE IF EXISTS `atividadelead`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atividadelead` (
  `id_lead` bigint(20) NOT NULL,
  `id_atividade` bigint(20) NOT NULL,
  PRIMARY KEY (`id_lead`,`id_atividade`),
  KEY `FK_AtividadeLead_Lead` (`id_lead`),
  KEY `FK_AtividadeLead_Atividade` (`id_atividade`),
  CONSTRAINT `FK_AtividadeLead_Atividade` FOREIGN KEY (`id_atividade`) REFERENCES `atividade` (`id`),
  CONSTRAINT `FK_AtividadeLead_Lead` FOREIGN KEY (`id_lead`) REFERENCES `lead` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atividadelead`
--

LOCK TABLES `atividadelead` WRITE;
/*!40000 ALTER TABLE `atividadelead` DISABLE KEYS */;
/*!40000 ALTER TABLE `atividadelead` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atividadeos`
--

DROP TABLE IF EXISTS `atividadeos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atividadeos` (
  `id_os` bigint(20) NOT NULL,
  `id_atividade` bigint(20) NOT NULL,
  `id_tecnico` bigint(20) NOT NULL,
  `inicio` datetime NOT NULL,
  `fim` datetime NOT NULL,
  PRIMARY KEY (`id_os`,`id_atividade`),
  KEY `FK_AtividadeOS_OrdemServico` (`id_os`),
  KEY `FK_AtividadeOS_Atividade` (`id_atividade`),
  KEY `FK_AtividadeOS_Tecnico` (`id_tecnico`),
  CONSTRAINT `FK_AtividadeOS_Atividade` FOREIGN KEY (`id_atividade`) REFERENCES `atividade` (`id`),
  CONSTRAINT `FK_AtividadeOS_OrdemServico` FOREIGN KEY (`id_os`) REFERENCES `ordemservico` (`id`),
  CONSTRAINT `FK_AtividadeOS_Tecnico` FOREIGN KEY (`id_tecnico`) REFERENCES `pessoa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atividadeos`
--

LOCK TABLES `atividadeos` WRITE;
/*!40000 ALTER TABLE `atividadeos` DISABLE KEYS */;
/*!40000 ALTER TABLE `atividadeos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atividadeproposta`
--

DROP TABLE IF EXISTS `atividadeproposta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atividadeproposta` (
  `id_proposta` bigint(20) NOT NULL,
  `id_atividade` bigint(20) NOT NULL,
  PRIMARY KEY (`id_proposta`,`id_atividade`),
  KEY `AtividadeProposta_Proposta` (`id_proposta`),
  KEY `AtividadeProposta_Atividade` (`id_atividade`),
  CONSTRAINT `AtividadeProposta_Atividade` FOREIGN KEY (`id_atividade`) REFERENCES `atividade` (`id`),
  CONSTRAINT `AtividadeProposta_Proposta` FOREIGN KEY (`id_proposta`) REFERENCES `proposta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atividadeproposta`
--

LOCK TABLES `atividadeproposta` WRITE;
/*!40000 ALTER TABLE `atividadeproposta` DISABLE KEYS */;
/*!40000 ALTER TABLE `atividadeproposta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atividadeticket`
--

DROP TABLE IF EXISTS `atividadeticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atividadeticket` (
  `id_ticket` bigint(20) NOT NULL,
  `id_atividade` bigint(20) NOT NULL,
  PRIMARY KEY (`id_ticket`,`id_atividade`),
  KEY `FK_AtividadeTicket_Atividade` (`id_atividade`),
  CONSTRAINT `FK_AtividadeTicket_Atividade` FOREIGN KEY (`id_atividade`) REFERENCES `atividade` (`id`),
  CONSTRAINT `FK_AtividadeTicket_Ticket` FOREIGN KEY (`id_ticket`) REFERENCES `ticket` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atividadeticket`
--

LOCK TABLES `atividadeticket` WRITE;
/*!40000 ALTER TABLE `atividadeticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `atividadeticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atividadetitulo`
--

DROP TABLE IF EXISTS `atividadetitulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atividadetitulo` (
  `id_titulo` bigint(20) NOT NULL,
  `id_atividade` bigint(20) NOT NULL,
  PRIMARY KEY (`id_titulo`,`id_atividade`),
  KEY `AtividadeTitulo_Titulo` (`id_titulo`),
  KEY `AtividadeTitulo_Atividade` (`id_atividade`),
  CONSTRAINT `AtividadeTitulo_Atividade` FOREIGN KEY (`id_atividade`) REFERENCES `atividade` (`id`),
  CONSTRAINT `AtividadeTitulo_Titulo` FOREIGN KEY (`id_titulo`) REFERENCES `titulo` (`id_titulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atividadetitulo`
--

LOCK TABLES `atividadetitulo` WRITE;
/*!40000 ALTER TABLE `atividadetitulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `atividadetitulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bonificacao`
--

DROP TABLE IF EXISTS `bonificacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bonificacao` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_contrato` bigint(20) DEFAULT NULL,
  `n_parcelas` int(11) DEFAULT NULL,
  `valor_mensal` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Bonificacao_Contrato` (`id_contrato`),
  CONSTRAINT `FK_Bonificacao_Contrato` FOREIGN KEY (`id_contrato`) REFERENCES `contrato` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bonificacao`
--

LOCK TABLES `bonificacao` WRITE;
/*!40000 ALTER TABLE `bonificacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `bonificacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartaocredito`
--

DROP TABLE IF EXISTS `cartaocredito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cartaocredito` (
  `id_conta` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_conta`),
  KEY `FK_CartaoCredito_Conta` (`id_conta`),
  CONSTRAINT `FK_CartaoCredito_Conta` FOREIGN KEY (`id_conta`) REFERENCES `conta` (`id_conta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartaocredito`
--

LOCK TABLES `cartaocredito` WRITE;
/*!40000 ALTER TABLE `cartaocredito` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartaocredito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carteira`
--

DROP TABLE IF EXISTS `carteira`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carteira` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_conta` int(11) NOT NULL,
  `numcarteira` int(11) NOT NULL,
  `numconvenio` varchar(50) DEFAULT NULL,
  `bancoempresaimprime` char(1) DEFAULT NULL,
  `proxnossonumero` int(11) DEFAULT '1',
  `dmais` int(11) DEFAULT NULL,
  `registrada` tinyint(1) DEFAULT NULL,
  `variacao` int(11) DEFAULT NULL,
  `codigotransmissao` char(20) DEFAULT NULL,
  `controle_nosso_numero` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `numcarteira` (`numcarteira`),
  KEY `FK_Carteira_ContaBanco` (`id_conta`),
  CONSTRAINT `FK_Carteira_ContaBanco` FOREIGN KEY (`id_conta`) REFERENCES `contabanco` (`id_conta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carteira`
--

LOCK TABLES `carteira` WRITE;
/*!40000 ALTER TABLE `carteira` DISABLE KEYS */;
/*!40000 ALTER TABLE `carteira` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoriacliente`
--

DROP TABLE IF EXISTS `categoriacliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoriacliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pai` int(11) DEFAULT NULL,
  `descricao` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `CategoriaCliente_CategoriaCliente` (`id_pai`),
  CONSTRAINT `CategoriaCliente_CategoriaCliente` FOREIGN KEY (`id_pai`) REFERENCES `categoriacliente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoriacliente`
--

LOCK TABLES `categoriacliente` WRITE;
/*!40000 ALTER TABLE `categoriacliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoriacliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoriafornecedor`
--

DROP TABLE IF EXISTS `categoriafornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoriafornecedor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pai` int(11) DEFAULT NULL,
  `descricao` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `CategoriaFornecedor_CategoriaFornecedor` (`id_pai`),
  CONSTRAINT `CategoriaFornecedor_CategoriaFornecedor` FOREIGN KEY (`id_pai`) REFERENCES `categoriafornecedor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoriafornecedor`
--

LOCK TABLES `categoriafornecedor` WRITE;
/*!40000 ALTER TABLE `categoriafornecedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoriafornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoriaitem`
--

DROP TABLE IF EXISTS `categoriaitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoriaitem` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `categoria_pai` bigint(20) DEFAULT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `CategoriaItem_CategoriaItem` (`categoria_pai`),
  CONSTRAINT `CategoriaItem_CategoriaItem` FOREIGN KEY (`categoria_pai`) REFERENCES `categoriaitem` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoriaitem`
--

LOCK TABLES `categoriaitem` WRITE;
/*!40000 ALTER TABLE `categoriaitem` DISABLE KEYS */;
INSERT INTO `categoriaitem` VALUES (1,NULL,'Revenda'),(2,NULL,'Serviços'),(3,1,'Alarme'),(4,1,'CFTV'),(5,1,'Materiais de consumo'),(6,3,'Centrais'),(7,3,'Sensores'),(8,2,'Manutenção mensal'),(9,3,'Cabos'),(10,3,'Diversos'),(11,3,'Painel de alarme'),(12,4,'Cabo'),(13,4,'Câmera'),(14,4,'DVR placa PC'),(15,4,'DVR stand alone'),(16,1,'Perimetral'),(17,16,'Cabo'),(18,16,'Fio'),(19,16,'Haste'),(20,16,'Painel eletrificador'),(21,2,'Manutenção avulsa'),(22,2,'Instalação'),(23,1,'Bateria'),(24,2,'Monitoramento'),(25,2,'Rastreamento veicular'),(26,2,'Locação');
/*!40000 ALTER TABLE `categoriaitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoriaticket`
--

DROP TABLE IF EXISTS `categoriaticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoriaticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) DEFAULT NULL,
  `descricao` varchar(2000) DEFAULT NULL,
  `sla` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoriaticket`
--

LOCK TABLES `categoriaticket` WRITE;
/*!40000 ALTER TABLE `categoriaticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoriaticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoriaveiculo`
--

DROP TABLE IF EXISTS `categoriaveiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoriaveiculo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `categoria_pai` bigint(20) DEFAULT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `CategoriaVeiculo_CategoriaVeiculo` (`categoria_pai`),
  CONSTRAINT `CategoriaVeiculo_CategoriaVeiculo` FOREIGN KEY (`categoria_pai`) REFERENCES `categoriaveiculo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoriaveiculo`
--

LOCK TABLES `categoriaveiculo` WRITE;
/*!40000 ALTER TABLE `categoriaveiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoriaveiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfop`
--

DROP TABLE IF EXISTS `cfop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cfop` char(10) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `entrada_saida` char(1) NOT NULL DEFAULT 'E',
  `estado_interestado_exportacao` char(1) NOT NULL DEFAULT 'E',
  `receita_gasto_nenhum` char(1) NOT NULL DEFAULT 'N',
  `atualiza_estoque` bit(1) NOT NULL DEFAULT b'0',
  `atualiza_custo` bit(1) NOT NULL DEFAULT b'0',
  `pv_pc_cm` char(2) NOT NULL DEFAULT 'PV',
  `com_dev_bon_rem_out` char(3) NOT NULL DEFAULT 'OUT',
  `pis` bit(1) NOT NULL DEFAULT b'0',
  `cofins` bit(1) NOT NULL DEFAULT b'0',
  `csll` bit(1) NOT NULL DEFAULT b'0',
  `ir` bit(1) NOT NULL DEFAULT b'0',
  `substributaria` bit(1) NOT NULL DEFAULT b'0',
  `ipi` bit(1) NOT NULL DEFAULT b'0',
  `icms` bit(1) NOT NULL DEFAULT b'0',
  `cst_icms` varchar(10) DEFAULT NULL,
  `observacao` varchar(1000) DEFAULT NULL,
  `agrupador` bit(1) NOT NULL DEFAULT b'0',
  `ativo` bit(1) DEFAULT NULL,
  `id_empresa` bigint(20) DEFAULT NULL,
  `Simples_nacional` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK_Id_Empresa` (`id_empresa`),
  CONSTRAINT `FK_Id_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=533 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfop`
--

LOCK TABLES `cfop` WRITE;
/*!40000 ALTER TABLE `cfop` DISABLE KEYS */;
INSERT INTO `cfop` VALUES (1,'1000','ENTRADAS OU AQUISIÇÕES DE SERVIÇOS DO ESTADO','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se, neste grupo, as operações ou prestações em que o estabelecimento remetente esteja localizado na mesma unidade da Federação do destinatário.','','\0',1,1),(2,'1100','COMPRAS PARA INDUSTRIALIZAÇÃO, COMERCIALIZAÇÃO OU PRESTAÇÃO DE SERVIÇOS','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(3,'1101','Compra para industrialização','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras de mercadorias a serem utilizadas em processo de industrialização. Também serão classificadas neste código as entradas de mercadorias em estabelecimento industrial de cooperativa recebidas de seus cooperados ou de estabelecimento de outra cooperativa.','\0','\0',1,1),(4,'1102','Compra para comercialização','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras de mercadorias a serem comercializadas. Também serão classificadas neste código as entradas de mercadorias em estabelecimento comercial de cooperativa recebidas de seus cooperados ou de estabelecimento de outra cooperativa.','\0','\0',1,1),(5,'1111','Compra para industrialização de mercadoria recebida anteriormente em consignação industrial','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras efetivas de mercadorias a serem utilizadas em processo de industrialização, recebidas anteriormente a título de consignação industrial.','\0','\0',1,1),(6,'1113','Compra para comercialização de mercadoria recebida anteriormente em consignação mercantil','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras efetivas de mercadorias recebidas anteriormente a título de consignação mercantil.','\0','\0',1,1),(7,'1116','Compra para industrialização originada de encomenda para recebimento futuro','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras de mercadorias a serem utilizadas em processo de industrialização, quando da entrada real da mercadoria, cuja aquisição tenha sido classificada no código “1.922 - Lançamento efetuado a título de simples faturamento decorrente de compra para recebimento futuro”.','\0','\0',1,1),(8,'1117','Compra para comercialização originada de encomenda para recebimento futuro','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras de mercadorias a serem comercializadas, quando da entrada real da mercadoria, cuja aquisição tenha sido classificada no código “1.922 - Lançamento efetuado a título de simples faturamento decorrente de compra para recebimento futuro”.','\0','\0',1,1),(9,'1118','Compra de mercadoria para comercialização pelo adquirente originário, entregue pelo vendedor remetente ao destinatário, em venda à ordem','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras de mercadorias já comercializadas, que, sem transitar pelo estabelecimento do adquirente originário, sejam entregues pelo vendedor remetente diretamente ao destinatário, em operação de venda à ordem, cuja venda seja classificada, pelo adquirente originário, no código “5.120 - Venda de mercadoria adquirida ou recebida de terceiros entregue ao destinatário pelo vendedor remetente, em venda à ordem”.','\0','\0',1,1),(10,'1120','Compra para industrialização, em venda à ordem, já recebida do vendedor remetente','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras de mercadorias a serem utilizadas em processo de industrialização, em vendas à ordem, já recebidas do vendedor remetente, por ordem do adquirente originário.','\0','\0',1,1),(11,'1121','Compra para comercialização, em venda à ordem, já recebida do vendedor remetente','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras de mercadorias a serem comercializadas, em vendas à ordem, já recebidas do vendedor remetente por ordem do adquirente originário.','\0','\0',1,1),(12,'1122','Compra para industrialização em que a mercadoria foi remetida pelo fornecedor ao industrializador sem transitar pelo estabelecimento adquirente','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras de mercadorias a serem utilizadas em processo de industrialização, remetidas pelo fornecedor para o industrializador sem que a mercadoria tenha transitado pelo estabelecimento do adquirente.','\0','\0',1,1),(13,'1124','Industrialização efetuada por outra empresa','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas de mercadorias industrializadas por terceiros, compreendendo os valores referentes aos serviços prestados e os das mercadorias de propriedade do industrializador empregadas no processo industrial. Quando a industrialização efetuada se referir a bens do ativo imobilizado ou de mercadorias para uso ou consumo do estabelecimento encomendante, a entrada deverá ser classificada nos códigos “1.551 - Compra de bem para o ativo imobilizado” ou “1.556 - Compra de material para uso ou consumo”.','\0','\0',1,1),(14,'1125','Industrialização efetuada por outra empresa quando a mercadoria remetida para utilização no processo de industrialização não transitou pelo estabelecimento adquirente da mercadoria','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas de mercadorias industrializadas por outras empresas, em que as mercadorias remetidas para utilização no processo de industrialização não transitaram pelo estabelecimento do adquirente das mercadorias, compreendendo os valores referentes aos serviços prestados e os das mercadorias de propriedade do industrializador empregadas no processo industrial. Quando a industrialização efetuada se referir a bens do ativo imobilizado ou de mercadorias para uso ou consumo do estabelecimento encomendante, a entrada deverá ser classificada nos códigos “1.551 - Compra de bem para o ativo imobilizado” ou “1.556 - Compra de material para uso ou consumo”.','\0','\0',1,1),(15,'1126','Compra para utilização na prestação de serviço','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas de mercadorias a serem utilizadas nas prestações de serviços.','\0','\0',1,1),(16,'1150','TRANSFERÊNCIAS PARA INDUSTRIALIZAÇÃO, COMERCIALIZAÇÃO OU PRESTAÇÃO DE SERVIÇOS','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(17,'1151','Transferência para industrialização','E','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas de mercadorias recebidas em transferência de outro estabelecimento da mesma empresa, para serem utilizadas em processo de industrialização.','\0','\0',1,1),(18,'1152','Transferência para comercialização','E','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas de mercadorias recebidas em transferência de outro estabelecimento da mesma empresa, para serem comercializadas.','\0','\0',1,1),(19,'1153','Transferência de energia elétrica para distribuição','E','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas de energia elétrica recebida em transferência de outro estabelecimento da mesma empresa, para distribuição.','\0','\0',1,1),(20,'1154','Transferência para utilização na prestação de serviço','E','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas de mercadorias recebidas em transferência de outro estabelecimento da mesma empresa, para serem utilizadas nas prestações de serviços.','\0','\0',1,1),(21,'1200','DEVOLUÇÕES DE VENDAS DE PRODUÇÃO PRÓPRIA, DE TERCEIROS OU ANULAÇÕES DE VALORES','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(22,'1201','Devolução de venda de produção do estabelecimento','E','E','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de vendas de produtos industrializados pelo estabelecimento, cujas saídas tenham sido classificadas como “Venda de produção do estabelecimento”.','\0','\0',1,1),(23,'1202','Devolução de venda de mercadoria adquirida ou recebida de terceiros','E','E','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de vendas de mercadorias adquiridas ou recebidas de terceiros, que não tenham sido objeto de industrialização no estabelecimento, cujas saídas tenham sido classificadas como “Venda de mercadoria adquirida ou recebida de terceiros”.','\0','\0',1,1),(24,'1203','Devolução de venda de produção do estabelecimento, destinada à Zona Franca de Manaus ou Áreas de Livre Comércio','E','E','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de vendas de produtos industrializados pelo estabelecimento, cujas saídas foram classificadas no código “5.109 - Venda de produção do estabelecimento, destinada à Zona Franca de Manaus ou Áreas de Livre Comércio”.','\0','\0',1,1),(25,'1204','Devolução de venda de mercadoria adquirida ou recebida de terceiros, destinada à Zona Franca de Manaus ou Áreas de Livre Comércio','E','E','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de vendas de mercadorias adquiridas ou recebidas de terceiros, cujas saídas foram classificadas no código “5.110 - Venda de mercadoria adquirida ou recebida de terceiros, destinada à Zona Franca de Manaus ou Áreas de Livre Comércio”.','\0','\0',1,1),(26,'1205','Anulação de valor relativo à prestação de serviço de comunicação','E','E','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as anulações correspondentes a valores faturados indevidamente, decorrentes de prestações de serviços de comunicação.','\0','\0',1,1),(27,'1206','Anulação de valor relativo à prestação de serviço de transporte','E','E','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as anulações correspondentes a valores faturados indevidamente, decorrentes de prestações de serviços de transporte.','\0','\0',1,1),(28,'1207','Anulação de valor relativo à venda de energia elétrica','E','E','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as anulações correspondentes a valores faturados indevidamente, decorrentes de venda de energia elétrica.','\0','\0',1,1),(29,'1208','Devolução de produção do estabelecimento, remetida em transferência','E','E','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de produtos industrializados pelo estabelecimento, transferidos para outros estabelecimentos da mesma empresa.','\0','\0',1,1),(30,'1209','Devolução de mercadoria adquirida ou recebida de terceiros, remetida em transferência','E','E','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de mercadorias adquiridas ou recebidas de terceiros, transferidas para outros estabelecimentos da mesma empresa.','\0','\0',1,1),(31,'1250','COMPRAS DE ENERGIA ELÉTRICA','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(32,'1251','Compra de energia elétrica para distribuição ou comercialização','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras de energia elétrica utilizada em sistema de distribuição ou comercialização. Também serão classificadas neste código as compras de energia elétrica por cooperativas para distribuição aos seus cooperados.','\0','\0',1,1),(33,'1252','Compra de energia elétrica por estabelecimento industrial','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras de energia elétrica utilizada no processo de industrialização. Também serão classificadas neste código as compras de energia elétrica utilizada por estabelecimento industrial de cooperativa.','\0','\0',1,1),(34,'1253','Compra de energia elétrica por estabelecimento comercial','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras de energia elétrica utilizada por estabelecimento comercial. Também serão classificadas neste código as compras de energia elétrica utilizada por estabelecimento comercial de cooperativa.','\0','\0',1,1),(35,'1254','Compra de energia elétrica por estabelecimento prestador de serviço de transporte','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras de energia elétrica utilizada por estabelecimento prestador de serviços de transporte.','\0','\0',1,1),(36,'1255','Compra de energia elétrica por estabelecimento prestador de serviço de comunicação','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras de energia elétrica utilizada por estabelecimento prestador de serviços de comunicação.','\0','\0',1,1),(37,'1256','Compra de energia elétrica por estabelecimento de produtor rural','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras de energia elétrica utilizada por estabelecimento de produtor rural.','\0','\0',1,1),(38,'1257','Compra de energia elétrica para consumo por demanda contratada','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras de energia elétrica para consumo por demanda contratada, que prevalecerá sobre os demais códigos deste subgrupo.','\0','\0',1,1),(39,'1300','AQUISIÇÕES DE SERVIÇOS DE COMUNICAÇÃO','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(40,'1301','Aquisição de serviço de comunicação para execução de serviço da mesma natureza','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as aquisições de serviços de comunicação utilizados nas prestações de serviços da mesma natureza.','\0','\0',1,1),(41,'1302','Aquisição de serviço de comunicação por estabelecimento industrial','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as aquisições de serviços de comunicação utilizados por estabelecimento industrial. Também serão classificadas neste código as aquisições de serviços de comunicação utilizados por estabelecimento industrial de cooperativa.','\0','\0',1,1),(42,'1303','Aquisição de serviço de comunicação por estabelecimento comercial','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as aquisições de serviços de comunicação utilizados por estabelecimento comercial. Também serão classificadas neste código as aquisições de serviços de comunicação utilizados por estabelecimento comercial de cooperativa.','\0','\0',1,1),(43,'1304','Aquisição de serviço de comunicação por estabelecimento de prestador de serviço de transporte','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as aquisições de serviços de comunicação utilizados por estabelecimento prestador de serviço de transporte.','\0','\0',1,1),(44,'1305','Aquisição de serviço de comunicação por estabelecimento de geradora ou de distribuidora de energia elétrica','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as aquisições de serviços de comunicação utilizados por estabelecimento de geradora ou de distribuidora de energia elétrica.','\0','\0',1,1),(45,'1306','Aquisição de serviço de comunicação por estabelecimento de produtor rural','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as aquisições de serviços de comunicação utilizados por estabelecimento de produtor rural.','\0','\0',1,1),(46,'1350','AQUISIÇÕES DE SERVIÇOS DE TRANSPORTE','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(47,'1351','Aquisição de serviço de transporte para execução de serviço da mesma natureza','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as aquisições de serviços de transporte utilizados nas prestações de serviços da mesma natureza.','\0','\0',1,1),(48,'1352','Aquisição de serviço de transporte por estabelecimento industrial','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as aquisições de serviços de transporte utilizados por estabelecimento industrial. Também serão classificadas neste código as aquisições de serviços de transporte utilizados por estabelecimento industrial de cooperativa.','\0','\0',1,1),(49,'1353','Aquisição de serviço de transporte por estabelecimento comercial','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as aquisições de serviços de transporte utilizados por estabelecimento comercial. Também serão classificadas neste código as aquisições de serviços de transporte utilizados por estabelecimento comercial de cooperativa.','\0','\0',1,1),(50,'1354','Aquisição de serviço de transporte por estabelecimento de prestador de serviço de comunicação','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as aquisições de serviços de transporte utilizados por estabelecimento prestador de serviços de comunicação.','\0','\0',1,1),(51,'1355','Aquisição de serviço de transporte por estabelecimento de geradora ou de distribuidora de energia elétrica','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as aquisições de serviços de transporte utilizados por estabelecimento de geradora ou de distribuidora de energia elétrica.','\0','\0',1,1),(52,'1356','Aquisição de serviço de transporte por estabelecimento de produtor rural','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as aquisições de serviços de transporte utilizados por estabelecimento de produtor rural.','\0','\0',1,1),(53,'1400','ENTRADAS DE MERCADORIAS SUJEITAS AO REGIME DE SUBSTITUIÇÃO TRIBUTÁRIA','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(54,'1401','Compra para industrialização em operação com mercadoria sujeita ao regime de substituição tributária','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras de mercadorias a serem utilizadas em processo de industrialização, decorrentes de operações com mercadorias sujeitas ao regime de substituição tributária. Também serão classificadas neste código as compras por estabelecimento industrial de cooperativa de mercadorias sujeitas ao regime de substituição tributária.','\0','\0',1,1),(55,'1403','Compra para comercialização em operação com mercadoria sujeita ao regime de substituição tributária','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras de mercadorias a serem comercializadas, decorrentes de operações com mercadorias sujeitas ao regime de substituição tributária. Também serão classificadas neste código as compras de mercadorias sujeitas ao regime de substituição tributária em estabelecimento comercial de cooperativa.','\0','\0',1,1),(56,'1406','Compra de bem para o ativo imobilizado cuja mercadoria está sujeita ao regime de substituição tributária','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras de bens destinados ao ativo imobilizado do estabelecimento, em operações com mercadorias sujeitas ao regime de substituição tributária.','\0','\0',1,1),(57,'1407','Compra de mercadoria para uso ou consumo cuja mercadoria está sujeita ao regime de substituição tributária','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras de mercadorias destinadas ao uso ou consumo do estabelecimento, em operações com mercadorias sujeitas ao regime de substituição tributária.','\0','\0',1,1),(58,'1408','Transferência para industrialização em operação com mercadoria sujeita ao regime de substituição tributária','E','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as mercadorias recebidas em transferência de outro estabelecimento da mesma empresa, para serem industrializadas no estabelecimento, em operações com mercadorias sujeitas ao regime de substituição tributária.','\0','\0',1,1),(59,'1409','Transferência para comercialização em operação com mercadoria sujeita ao regime de substituição tributária','E','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as mercadorias recebidas em transferência de outro estabelecimento da mesma empresa, para serem comercializadas, decorrentes de operações sujeitas ao regime de substituição tributária.','\0','\0',1,1),(60,'1410','Devolução de venda de produção do estabelecimento em operação com produto sujeito ao regime de substituição tributária','E','E','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de produtos industrializados e vendidos pelo estabelecimento, cujas saídas tenham sido classificadas como “Venda de produção do estabelecimento em operação com produto sujeito ao regime de substituição tributária”.','\0','\0',1,1),(61,'1411','Devolução de venda de mercadoria adquirida ou recebida de terceiros em operação com mercadoria sujeita ao regime de substituição tributária','E','E','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de vendas de mercadorias adquiridas ou recebidas de terceiros, cujas saídas tenham sido classificadas como “Venda de mercadoria adquirida ou recebida de terceiros em operação com mercadoria sujeita ao regime de substituição tributária”.','\0','\0',1,1),(62,'1414','Retorno de produção do estabelecimento, remetida para venda fora do estabelecimento em operação com produto sujeito ao regime de substituição tributária','E','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas, em retorno, de produtos industrializados pelo estabelecimento, remetidos para vendas fora do estabelecimento, inclusive por meio de veículos, em operações com produtos sujeitos ao regime de substituição tributária, e não comercializadas.','\0','\0',1,1),(63,'1415','Retorno de mercadoria adquirida ou recebida de terceiros, remetida para venda fora do estabelecimento em operação com mercadoria sujeita ao regime de substituição tributária','E','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas, em retorno, de mercadorias adquiridas ou recebidas de terceiros remetidas para vendas fora do estabelecimento, inclusive por meio de veículos, em operações com mercadorias sujeitas ao regime de substituição tributária, e não comercializadas.','\0','\0',1,1),(64,'1450','SISTEMAS DE INTEGRAÇÃO','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(65,'1451','Retorno de animal do estabelecimento produtor','E','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas referentes ao retorno de animais criados pelo produtor no sistema integrado.','\0','\0',1,1),(66,'1452','Retorno de insumo não utilizado na produção','E','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código o retorno de insumos não utilizados pelo produtor na criação de animais pelo sistema integrado.','\0','\0',1,1),(67,'1500','ENTRADAS DE MERCADORIAS REMETIDAS COM FIM ESPECÍFICO DE EXPORTAÇÃO E EVENTUAIS DEVOLUÇÕES','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(68,'1501','Entrada de mercadoria recebida com fim específico de exportação','E','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas de mercadorias em estabelecimento de “trading company”, empresa comercial exportadora ou outro estabelecimento do remetente, com fim específico de exportação.','\0','\0',1,1),(69,'1503','Entrada decorrente de devolução de produto remetido com fim específico de exportação, de produção do estabelecimento','E','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de produtos industrializados pelo estabelecimento, remetidos a “trading company”, a empresa comercial exportadora ou a outro estabelecimento do remetente, com fim específico de exportação, cujas saídas tenham sido classificadas no código “5.501 - Remessa de produção do estabelecimento, com fim específico de exportação”.','\0','\0',1,1),(70,'1504','Entrada decorrente de devolução de mercadoria remetida com fim específico de exportação, adquirida ou recebida de terceiros','E','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de mercadorias adquiridas ou recebidas de terceiros remetidas a “trading company”, a empresa comercial exportadora ou a outro estabelecimento do remetente, com fim específico de exportação, cujas saídas tenham sido classificadas no código “5.502 - Remessa de mercadoria adquirida ou recebida de terceiros, com fim específico de exportação”.','\0','\0',1,1),(71,'1550','OPERAÇÕES COM BENS DE ATIVO IMOBILIZADO E MATERIAIS PARA USO OU CONSUMO','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(72,'1551','Compra de bem para o ativo imobilizado','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras de bens destinados ao ativo imobilizado do estabelecimento.','\0','\0',1,1),(73,'1552','Transferência de bem do ativo imobilizado','E','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas de bens destinados ao ativo imobilizado recebidos em transferência de outro estabelecimento da mesma empresa.','\0','\0',1,1),(74,'1553','Devolução de venda de bem do ativo imobilizado','E','E','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de vendas de bens do ativo imobilizado, cujas saídas tenham sido classificadas no código “5.551 - Venda de bem do ativo imobilizado”.','\0','\0',1,1),(75,'1554','Retorno de bem do ativo imobilizado remetido para uso fora do estabelecimento','E','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas por retorno de bens do ativo imobilizado remetidos para uso fora do estabelecimento, cujas saídas tenham sido classificadas no código “5.554 - Remessa de bem do ativo imobilizado para uso fora do estabelecimento”.','\0','\0',1,1),(76,'1555','Entrada de bem do ativo imobilizado de terceiro, remetido para uso no estabelecimento','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas de bens do ativo imobilizado de terceiros, remetidos para uso no estabelecimento.','\0','\0',1,1),(77,'1556','Compra de material para uso ou consumo','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras de mercadorias destinadas ao uso ou consumo do estabelecimento.','\0','\0',1,1),(78,'1557','Transferência de material para uso ou consumo','E','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas de materiais para uso ou consumo recebidos em transferência de outro estabelecimento da mesma empresa.','\0','\0',1,1),(79,'1600','CRÉDITOS E RESSARCIMENTOS DE ICMS','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(80,'1601','Recebimento, por transferência, de crédito de ICMS','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código os lançamentos destinados ao registro de créditos de ICMS, recebidos por transferência de outras empresas.','\0','\0',1,1),(81,'1602','Recebimento, por transferência, de saldo credor de ICMS de outro estabelecimento da mesma empresa, para compensação de saldo devedor de ICMS','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código os lançamentos destinados ao registro da transferência de saldos credores de ICMS recebidos de outros estabelecimentos da mesma empresa, destinados à compensação do saldo devedor do estabelecimento.','\0','\0',1,1),(82,'1603','Ressarcimento de ICMS retido por substituição tributária','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código os lançamentos destinados ao registro de ressarcimento de ICMS retido por substituição tributária a contribuinte substituído, efetuado pelo contribuinte substituto, ou, ainda, quando o ressarcimento for apropriado pelo próprio contribuinte substituído, nas hipóteses previstas na legislação aplicável.','\0','\0',1,1),(83,'1900','OUTRAS ENTRADAS DE MERCADORIAS OU AQUISIÇÕES DE SERVIÇOS','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(84,'1901','Entrada para industrialização por encomenda','E','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas de insumos recebidos para industrialização por encomenda de outra empresa ou de outro estabelecimento da mesma empresa.','\0','\0',1,1),(85,'1902','Retorno de mercadoria remetida para industrialização por encomenda','E','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código o retorno dos insumos remetidos para industrialização por encomenda, incorporados ao produto final pelo estabelecimento industrializador.','\0','\0',1,1),(86,'1903','Entrada de mercadoria remetida para industrialização e não aplicada no referido processo','E','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas em devolução de insumos remetidos para industrialização e não aplicados no referido processo.','\0','\0',1,1),(87,'1904','Retorno de remessa para venda fora do estabelecimento','E','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas em retorno de mercadorias remetidas para venda fora do estabelecimento, inclusive por meio de veículos, e não comercializadas.','\0','\0',1,1),(88,'1905','Entrada de mercadoria recebida para depósito em depósito fechado ou armazém geral','E','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas de mercadorias recebidas para depósito em depósito fechado ou armazém geral.','\0','\0',1,1),(89,'1906','Retorno de mercadoria remetida para depósito fechado ou armazém geral','E','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas em retorno de mercadorias remetidas para depósito em depósito fechado ou armazém geral.','\0','\0',1,1),(90,'1907','Retorno simbólico de mercadoria remetida para depósito fechado ou armazém geral','E','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas em retorno simbólico de mercadorias remetidas para depósito em depósito fechado ou armazém geral, quando as mercadorias depositadas tenham sido objeto de saída a qualquer título e que não tenham retornado ao estabelecimento depositante.','\0','\0',1,1),(91,'1908','Entrada de bem por conta de contrato de comodato','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas de bens recebidos em cumprimento de contrato de comodato.','\0','\0',1,1),(92,'1909','Retorno de bem remetido por conta de contrato de comodato','E','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas de bens recebidos em devolução após cumprido o contrato de comodato.','\0','\0',1,1),(93,'1910','Entrada de bonificação, doação ou brinde','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas de mercadorias recebidas a título de bonificação, doação ou brinde.','\0','\0',1,1),(94,'1911','Entrada de amostra grátis','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas de mercadorias recebidas a título de amostra grátis.','\0','\0',1,1),(95,'1912','Entrada de mercadoria ou bem recebido para demonstração','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas de mercadorias ou bens recebidos para demonstração.','\0','\0',1,1),(96,'1913','Retorno de mercadoria ou bem remetido para demonstração','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas em retorno de mercadorias ou bens remetidos para demonstração.','\0','\0',1,1),(97,'1914','Retorno de mercadoria ou bem remetido para exposição ou feira','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas em retorno de mercadorias ou bens remetidos para exposição ou feira.','\0','\0',1,1),(98,'1915','Entrada de mercadoria ou bem recebido para conserto ou reparo','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas de mercadorias ou bens recebidos para conserto ou reparo.','\0','\0',1,1),(99,'1916','Retorno de mercadoria ou bem remetido para conserto ou reparo','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas em retorno de mercadorias ou bens remetidos para conserto ou reparo.','\0','\0',1,1),(100,'1917','Entrada de mercadoria recebida em consignação mercantil ou industrial','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas de mercadorias recebidas a título de consignação mercantil ou industrial.','\0','\0',1,1),(101,'1918','Devolução de mercadoria remetida em consignação mercantil ou industrial','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas por devolução de mercadorias remetidas anteriormente a título de consignação mercantil ou industrial.','\0','\0',1,1),(102,'1919','Devolução simbólica de mercadoria vendida ou utilizada em processo industrial, remetida anteriormente em consignação mercantil ou industrial','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas por devolução simbólica de mercadorias vendidas ou utilizadas em processo industrial, remetidas anteriormente a título de consignação mercantil ou industrial.','\0','\0',1,1),(103,'1920','Entrada de vasilhame ou sacaria','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas de vasilhame ou sacaria.','\0','\0',1,1),(104,'1921','Retorno de vasilhame ou sacaria','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas em retorno de vasilhame ou sacaria.','\0','\0',1,1),(105,'1922','Lançamento efetuado a título de simples faturamento decorrente de compra para recebimento futuro','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código os registros efetuados a título de simples faturamento decorrente de compra para recebimento futuro.','\0','\0',1,1),(106,'1923','Entrada de mercadoria recebida do vendedor remetente, em venda à ordem','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas de mercadorias recebidas do vendedor remetente, em vendas à ordem, cuja compra do adquirente originário, foi classificada nos códigos “1.120 - Compra para industrialização, em venda à ordem, já recebida do vendedor remetente” ou “1.121 - Compra para comercialização, em venda à ordem, já recebida do vendedor remetente”.','\0','\0',1,1),(107,'1924','Entrada para industrialização por conta e ordem do adquirente da mercadoria, quando esta não transitar pelo estabelecimento do adquirente','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas de insumos recebidos para serem industrializados por conta e ordem do adquirente, nas hipóteses em que os insumos não tenham transitado pelo estabelecimento do adquirente dos mesmos.','\0','\0',1,1),(108,'1925','Retorno de mercadoria remetida para industrialização por conta e ordem do adquirente da mercadoria, quando esta não transitar pelo estabelecimento do adquirente','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código o retorno dos insumos remetidos por conta e ordem do adquirente, para industrialização e incorporados ao produto final pelo estabelecimento industrializador, nas hipóteses em que os insumos não tenham transitado pelo estabelecimento do adquirente.','\0','\0',1,1),(109,'1926','Lançamento efetuado a título de reclassificação de mercadoria decorrente de formação de kit ou de sua desagregação','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código os registros efetuados a título de reclassificação decorrente de formação de kit de mercadorias ou de sua desagregação.','\0','\0',1,1),(110,'1949','Outra entrada de mercadoria ou prestação de serviço não especificada','E','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as outras entradas de mercadorias ou prestações de serviços que não tenham sido especificadas nos códigos anteriores.','\0','\0',1,1),(111,'2000','ENTRADAS OU AQUISIÇÕES DE SERVIÇOS DE OUTROS ESTADOS','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se, neste grupo, as operações ou prestações em que o estabelecimento remetente esteja localizado em unidade da Federação diversa daquela do destinatário.','','\0',1,1),(112,'2100','COMPRAS PARA INDUSTRIALIZAÇÃO, COMERCIALIZAÇÃO OU PRESTAÇÃO DE SERVIÇOS','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(113,'2101','Compra para industrialização','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras de mercadorias a serem utilizadas em processo de industrialização. Também serão classificadas neste código as entradas de mercadorias em estabelecimento industrial de cooperativa recebidas de seus cooperados ou de estabelecimento de outra cooperativa.','\0','\0',1,1),(114,'2102','Compra para comercialização','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras de mercadorias a serem comercializadas. Também serão classificadas neste código as entradas de mercadorias em estabelecimento comercial de cooperativa recebidas de seus cooperados ou de estabelecimento de outra cooperativa.','\0','\0',1,1),(115,'2111','Compra para industrialização de mercadoria recebida anteriormente em consignação industrial','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras efetivas de mercadorias a serem utilizadas em processo de industrialização, recebidas anteriormente a título de consignação industrial.','\0','\0',1,1),(116,'2113','Compra para comercialização, de mercadoria recebida anteriormente em consignação mercantil','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras efetivas de mercadorias recebidas anteriormente a título de consignação mercantil.','\0','\0',1,1),(117,'2116','Compra para industrialização originada de encomenda para recebimento futuro','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras de mercadorias a serem utilizadas em processo de industrialização, quando da entrada real da mercadoria, cuja aquisição tenha sido classificada no código “2.922 - Lançamento efetuado a título de simples faturamento decorrente de compra para recebimento futuro”.','\0','\0',1,1),(118,'2117','Compra para comercialização originada de encomenda para recebimento futuro','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras de mercadorias a serem comercializadas, quando da entrada real da mercadoria, cuja aquisição tenha sido classificada no código “2.922 - Lançamento efetuado a título de simples faturamento decorrente de compra para recebimento futuro”.','\0','\0',1,1),(119,'2118','Compra de mercadoria para comercialização pelo adquirente originário, entregue pelo vendedor remetente ao destinatário, em venda à ordem','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras de mercadorias já comercializadas, que, sem transitar pelo estabelecimento do adquirente originário, sejam entregues pelo vendedor remetente diretamente ao destinatário, em operação de venda à ordem, cuja venda seja classificada, pelo adquirente originário, no código “6.120 - Venda de mercadoria adquirida ou recebida de terceiros entregue ao destinatário pelo vendedor remetente, em venda à ordem”.','\0','\0',1,1),(120,'2120','Compra para industrialização, em venda à ordem, já recebida do vendedor remetente','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras de mercadorias a serem utilizadas em processo de industrialização, em vendas à ordem, já recebidas do vendedor remetente, por ordem do adquirente originário.','\0','\0',1,1),(121,'2121','Compra para comercialização, em venda à ordem, já recebida do vendedor remetente','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras de mercadorias a serem comercializadas, em vendas à ordem, já recebidas do vendedor remetente por ordem do adquirente originário.','\0','\0',1,1),(122,'2122','Compra para industrialização em que a mercadoria foi remetida pelo fornecedor ao industrializador sem transitar pelo estabelecimento adquirente','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras de mercadorias a serem utilizadas em processo de industrialização, remetidas pelo fornecedor para o industrializador sem que a mercadoria tenha transitado pelo estabelecimento do adquirente.','\0','\0',1,1),(123,'2124','Industrialização efetuada por outra empresa','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas de mercadorias industrializadas por terceiros, compreendendo os valores referentes aos serviços prestados e os das mercadorias de propriedade do industrializador empregadas no processo industrial. Quando a industrialização efetuada se referir a bens do ativo imobilizado ou de mercadorias para uso ou consumo do estabelecimento encomendante, a entrada deverá ser classificada nos códigos “2.551 - Compra de bem para o ativo imobilizado” ou “2.556 - Compra de material para uso ou consumo”.','\0','\0',1,1),(124,'2125','Industrialização efetuada por outra empresa quando a mercadoria remetida para utilização no processo de industrialização não transitou pelo estabelecimento adquirente da mercadoria','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas de mercadorias industrializadas por outras empresas, em que as mercadorias remetidas para utilização no processo de industrialização não transitaram pelo estabelecimento do adquirente das mercadorias, compreendendo os valores referentes aos serviços prestados e os das mercadorias de propriedade do industrializador empregadas no processo industrial. Quando a industrialização efetuada se referir a bens do ativo imobilizado ou de mercadorias para uso ou consumo do estabelecimento encomendante, a entrada deverá ser classificada nos códigos “2.551 - Compra de bem para o ativo imobilizado” ou “2.556 - Compra de material para uso ou consumo”.','\0','\0',1,1),(125,'2126','Compra para utilização na prestação de serviço','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas de mercadorias a serem utilizadas nas prestações de serviços.','\0','\0',1,1),(126,'2150','TRANSFERÊNCIAS PARA INDUSTRIALIZAÇÃO, COMERCIALIZAÇÃO OU PRESTAÇÃO DE SERVIÇOS','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(127,'2151','Transferência para industrialização','E','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas de mercadorias recebidas em transferência de outro estabelecimento da mesma empresa, para serem utilizadas em processo de industrialização.','\0','\0',1,1),(128,'2152','Transferência para comercialização','E','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas de mercadorias recebidas em transferência de outro estabelecimento da mesma empresa, para serem comercializadas.','\0','\0',1,1),(129,'2153','Transferência de energia elétrica para distribuição','E','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas de energia elétrica recebida em transferência de outro estabelecimento da mesma empresa, para distribuição.','\0','\0',1,1),(130,'2154','Transferência para utilização na prestação de serviço','E','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas de mercadorias recebidas em transferência de outro estabelecimento da mesma empresa, para serem utilizadas nas prestações de serviços.','\0','\0',1,1),(131,'2200','DEVOLUÇÕES DE VENDAS DE PRODUÇÃO PRÓPRIA, DE TERCEIROS OU ANULAÇÕES DE VALORES','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(132,'2201','Devolução de venda de produção do estabelecimento','E','I','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de vendas de produtos industrializados pelo estabelecimento, cujas saídas tenham sido classificadas como “Venda de produção do estabelecimento”.','\0','\0',1,1),(133,'2202','Devolução de venda de mercadoria adquirida ou recebida de terceiros','E','I','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de vendas de mercadorias adquiridas ou recebidas de terceiros, que não tenham sido objeto de industrialização no estabelecimento, cujas saídas tenham sido classificadas como “Venda de mercadoria adquirida ou recebida de terceiros”.','\0','\0',1,1),(134,'2203','Devolução de venda de produção do estabelecimento, destinada à Zona Franca de Manaus ou Áreas de Livre Comércio','E','I','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de vendas de produtos industrializados pelo estabelecimento, cujas saídas foram classificadas no código “6.109 - Venda de produção do estabelecimento, destinada à Zona Franca de Manaus ou Áreas de Livre Comércio”.','\0','\0',1,1),(135,'2204','Devolução de venda de mercadoria adquirida ou recebida de terceiros, destinada à Zona Franca de Manaus ou Áreas de Livre Comércio','E','I','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de vendas de mercadorias adquiridas ou recebidas de terceiros, cujas saídas foram classificadas no código “6.110 - Venda de mercadoria adquirida ou recebida de terceiros, destinada à Zona Franca de Manaus ou Áreas de Livre Comércio”.','\0','\0',1,1),(136,'2205','Anulação de valor relativo à prestação de serviço de comunicação','E','I','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as anulações correspondentes a valores faturados indevidamente, decorrentes de prestações de serviços de comunicação.','\0','\0',1,1),(137,'2206','Anulação de valor relativo à prestação de serviço de transporte','E','I','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as anulações correspondentes a valores faturados indevidamente, decorrentes de prestações de serviços de transporte.','\0','\0',1,1),(138,'2207','Anulação de valor relativo à venda de energia elétrica','E','I','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as anulações correspondentes a valores faturados indevidamente, decorrentes de venda de energia elétrica.','\0','\0',1,1),(139,'2208','Devolução de produção do estabelecimento, remetida em transferência','E','I','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de produtos industrializados pelo estabelecimento, transferidos para outros estabelecimentos da mesma empresa.','\0','\0',1,1),(140,'2209','Devolução de mercadoria adquirida ou recebida de terceiros, remetida em transferência','E','I','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de mercadorias adquiridas ou recebidas de terceiros, transferidas para outros estabelecimentos da mesma empresa.','\0','\0',1,1),(141,'2250','COMPRAS DE ENERGIA ELÉTRICA','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(142,'2251','Compra de energia elétrica para distribuição ou comercialização','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras de energia elétrica utilizada em sistema de distribuição ou comercialização. Também serão classificadas neste código as compras de energia elétrica por cooperativas para distribuição aos seus cooperados.','\0','\0',1,1),(143,'2252','Compra de energia elétrica por estabelecimento industrial','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras de energia elétrica utilizada no processo de industrialização. Também serão classificadas neste código as compras de energia elétrica utilizada por estabelecimento industrial de cooperativa.','\0','\0',1,1),(144,'2253','Compra de energia elétrica por estabelecimento comercial','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras de energia elétrica utilizada por estabelecimento comercial. Também serão classificadas neste código as compras de energia elétrica utilizada por estabelecimento comercial de cooperativa.','\0','\0',1,1),(145,'2254','Compra de energia elétrica por estabelecimento prestador de serviço de transporte','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras de energia elétrica utilizada por estabelecimento prestador de serviços de transporte.','\0','\0',1,1),(146,'2255','Compra de energia elétrica por estabelecimento prestador de serviço de comunicação','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras de energia elétrica utilizada por estabelecimento prestador de serviços de comunicação.','\0','\0',1,1),(147,'2256','Compra de energia elétrica por estabelecimento de produtor rural','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras de energia elétrica utilizada por estabelecimento de produtor rural.','\0','\0',1,1),(148,'2257','Compra de energia elétrica para consumo por demanda contratada','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras de energia elétrica para consumo por demanda contratada, que prevalecerá sobre os demais códigos deste subgrupo.','\0','\0',1,1),(149,'2300','AQUISIÇÕES DE SERVIÇOS DE COMUNICAÇÃO','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(150,'2301','Aquisição de serviço de comunicação para execução de serviço da mesma natureza','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as aquisições de serviços de comunicação utilizados nas prestações de serviços da mesma natureza.','\0','\0',1,1),(151,'2302','Aquisição de serviço de comunicação por estabelecimento industrial','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as aquisições de serviços de comunicação utilizados por estabelecimento industrial. Também serão classificadas neste código as aquisições de serviços de comunicação utilizados por estabelecimento industrial de cooperativa.','\0','\0',1,1),(152,'2303','Aquisição de serviço de comunicação por estabelecimento comercial','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as aquisições de serviços de comunicação utilizados por estabelecimento comercial. Também serão classificadas neste código as aquisições de serviços de comunicação utilizados por estabelecimento comercial de cooperativa.','\0','\0',1,1),(153,'2304','Aquisição de serviço de comunicação por estabelecimento de prestador de serviço de transporte','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as aquisições de serviços de comunicação utilizado por estabelecimento prestador de serviço de transporte.','\0','\0',1,1),(154,'2305','Aquisição de serviço de comunicação por estabelecimento de geradora ou de distribuidora de energia elétrica','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as aquisições de serviços de comunicação utilizados por estabelecimento de geradora ou de distribuidora de energia elétrica.','\0','\0',1,1),(155,'2306','Aquisição de serviço de comunicação por estabelecimento de produtor rural','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as aquisições de serviços de comunicação utilizados por estabelecimento de produtor rural.','\0','\0',1,1),(156,'2350','AQUISIÇÕES DE SERVIÇOS DE TRANSPORTE','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(157,'2351','Aquisição de serviço de transporte para execução de serviço da mesma natureza','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as aquisições de serviços de transporte utilizados nas prestações de serviços da mesma natureza.','\0','\0',1,1),(158,'2352','Aquisição de serviço de transporte por estabelecimento industrial','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as aquisições de serviços de transporte utilizados por estabelecimento industrial. Também serão classificadas neste código as aquisições de serviços de transporte utilizados por estabelecimento industrial de cooperativa.','\0','\0',1,1),(159,'2353','Aquisição de serviço de transporte por estabelecimento comercial','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as aquisições de serviços de transporte utilizados por estabelecimento comercial. Também serão classificadas neste código as aquisições de serviços de transporte utilizados por estabelecimento comercial de cooperativa.','\0','\0',1,1),(160,'2354','Aquisição de serviço de transporte por estabelecimento de prestador de serviço de comunicação','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as aquisições de serviços de transporte utilizados por estabelecimento prestador de serviços de comunicação.','\0','\0',1,1),(161,'2355','Aquisição de serviço de transporte por estabelecimento de geradora ou de distribuidora de energia elétrica','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as aquisições de serviços de transporte utilizados por estabelecimento de geradora ou de distribuidora de energia elétrica.','\0','\0',1,1),(162,'2356','Aquisição de serviço de transporte por estabelecimento de produtor rural','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as aquisições de serviços de transporte utilizados por estabelecimento de produtor rural.','\0','\0',1,1),(163,'2400','ENTRADAS DE MERCADORIAS SUJEITAS AO REGIME DE SUBSTITUIÇÃO TRIBUTÁRIA','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(164,'2401','Compra para industrialização em operação com mercadoria sujeita ao regime de substituição tributária','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras de mercadorias a serem utilizadas em processo de industrialização, decorrentes de operações com mercadorias sujeitas ao regime de substituição tributária. Também serão classificadas neste código as compras por estabelecimento industrial de cooperativa de mercadorias sujeitas ao regime de substituição tributária.','\0','\0',1,1),(165,'2403','Compra para comercialização em operação com mercadoria sujeita ao regime de substituição tributária','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras de mercadorias a serem comercializadas, decorrentes de operações com mercadorias sujeitas ao regime de substituição tributária. Também serão classificadas neste código as compras de mercadorias sujeitas ao regime de substituição tributária em estabelecimento comercial de cooperativa.','\0','\0',1,1),(166,'2406','Compra de bem para o ativo imobilizado cuja mercadoria está sujeita ao regime de substituição tributária','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras de bens destinados ao ativo imobilizado do estabelecimento, em operações com mercadorias sujeitas ao regime de substituição tributária.','\0','\0',1,1),(167,'2407','Compra de mercadoria para uso ou consumo cuja mercadoria está sujeita ao regime de substituição tributária','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras de mercadorias destinadas ao uso ou consumo do estabelecimento, em operações com mercadorias sujeitas ao regime de substituição tributária.','\0','\0',1,1),(168,'2408','Transferência para industrialização em operação com mercadoria sujeita ao regime de substituição tributária','E','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as mercadorias recebidas em transferência de outro estabelecimento da mesma empresa, para serem industrializadas no estabelecimento, em operações com mercadorias sujeitas ao regime de substituição tributária.','\0','\0',1,1),(169,'2409','Transferência para comercialização em operação com mercadoria sujeita ao regime de substituição tributária','E','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as mercadorias recebidas em transferência de outro estabelecimento da mesma empresa, para serem comercializadas, decorrentes de operações sujeitas ao regime de substituição tributária.','\0','\0',1,1),(170,'2410','Devolução de venda de produção do estabelecimento em operação com produto sujeito ao regime de substituição tributária','E','I','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de produtos industrializados e vendidos pelo estabelecimento, cujas saídas tenham sido classificadas como “Venda de produção do estabelecimento em operação com produto sujeito ao regime de substituição tributária”.','\0','\0',1,1),(171,'2411','Devolução de venda de mercadoria adquirida ou recebida de terceiros em operação com mercadoria sujeita ao regime de substituição tributária','E','I','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de vendas de mercadorias adquiridas ou recebidas de terceiros, cujas saídas tenham sido classificadas como “Venda de mercadoria adquirida ou recebida de terceiros em operação com mercadoria sujeita ao regime de substituição tributária”.','\0','\0',1,1),(172,'2414','Retorno de produção do estabelecimento, remetida para venda fora do estabelecimento em operação com produto sujeito ao regime de substituição tributária','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas, em retorno, de produtos industrializados pelo estabelecimento, remetidos para vendas fora do estabelecimento, inclusive por meio de veículos, em operações com produtos sujeitos ao regime de substituição tributária, e não comercializadas.','\0','\0',1,1),(173,'2415','Retorno de mercadoria adquirida ou recebida de terceiros, remetida para venda fora do estabelecimento em operação com mercadoria sujeita ao regime de substituição tributária','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas, em retorno, de mercadorias adquiridas ou recebidas de terceiros remetidas para vendas fora do estabelecimento, inclusive por meio de veículos, em operações com mercadorias sujeitas ao regime de substituição tributária, e não comercializadas.','\0','\0',1,1),(174,'2500','ENTRADAS DE MERCADORIAS REMETIDAS COM FIM ESPECÍFICO DE EXPORTAÇÃO E EVENTUAIS DEVOLUÇÕES','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(175,'2501','Entrada de mercadoria recebida com fim específico de exportação','E','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas de mercadorias em estabelecimento de “trading company”, empresa comercial exportadora ou outro estabelecimento do remetente, com fim específico de exportação.','\0','\0',1,1),(176,'2503','Entrada decorrente de devolução de produto remetido com fim específico de exportação, de produção do estabelecimento','E','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de produtos industrializados pelo estabelecimento, remetidos a “trading company”, a empresa comercial exportadora ou a outro estabelecimento do remetente, com fim específico de exportação, cujas saídas tenham sido classificadas no código “6.501 - Remessa de produção do estabelecimento, com fim específico de exportação”.','\0','\0',1,1),(177,'2504','Entrada decorrente de devolução de mercadoria remetida com fim específico de exportação, adquirida ou recebida de terceiros','E','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de mercadorias adquiridas ou recebidas de terceiros remetidas a “trading company”, a empresa comercial exportadora ou a outro estabelecimento do remetente, com fim específico de exportação, cujas saídas tenham sido classificadas no código “6.502 - Remessa de mercadoria adquirida ou recebida de terceiros, com fim específico de exportação”.','\0','\0',1,1),(178,'2550','OPERAÇÕES COM BENS DE ATIVO IMOBILIZADO E MATERIAIS PARA USO OU CONSUMO','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(179,'2551','Compra de bem para o ativo imobilizado','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras de bens destinados ao ativo imobilizado do estabelecimento.','\0','\0',1,1),(180,'2552','Transferência de bem do ativo imobilizado','E','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas de bens destinados ao ativo imobilizado recebidos em transferência de outro estabelecimento da mesma empresa.','\0','\0',1,1),(181,'2553','Devolução de venda de bem do ativo imobilizado','E','I','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de vendas de bens do ativo imobilizado, cujas saídas tenham sido classificadas no código “6.551 - Venda de bem do ativo imobilizado”.','\0','\0',1,1),(182,'2554','Retorno de bem do ativo imobilizado remetido para uso fora do estabelecimento','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas por retorno de bens do ativo imobilizado remetidos para uso fora do estabelecimento, cujas saídas tenham sido classificadas no código “6.554 - Remessa de bem do ativo imobilizado para uso fora do estabelecimento”.','\0','\0',1,1),(183,'2555','Entrada de bem do ativo imobilizado de terceiro, remetido para uso no estabelecimento','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas de bens do ativo imobilizado de terceiros, remetidos para uso no estabelecimento.','\0','\0',1,1),(184,'2556','Compra de material para uso ou consumo','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras de mercadorias destinadas ao uso ou consumo do estabelecimento.','\0','\0',1,1),(185,'2557','Transferência de material para uso ou consumo','E','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas de materiais para uso ou consumo recebidos em transferência de outro estabelecimento da mesma empresa.','\0','\0',1,1),(186,'2600','CRÉDITOS E RESSARCIMENTOS DE ICMS','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(187,'2603','Ressarcimento de ICMS retido por substituição tributária','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código os lançamentos destinados ao registro de ressarcimento de ICMS retido por substituição tributária a contribuinte substituído, efetuado pelo contribuinte substituto, nas hipóteses previstas na legislação aplicável.','\0','\0',1,1),(188,'2900','OUTRAS ENTRADAS DE MERCADORIAS OU AQUISIÇÕES DE SERVIÇOS','E','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(189,'2901','Entrada para industrialização por encomenda','E','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas de insumos recebidos para industrialização por encomenda de outra empresa ou de outro estabelecimento da mesma empresa.','\0','\0',1,1),(190,'2902','Retorno de mercadoria remetida para industrialização por encomenda','E','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código o retorno dos insumos remetidos para industrialização por encomenda, incorporados ao produto final pelo estabelecimento industrializador.','\0','\0',1,1),(191,'2903','Entrada de mercadoria remetida para industrialização e não aplicada no referido processo','E','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas em devolução de insumos remetidos para industrialização e não aplicados no referido processo.','\0','\0',1,1),(192,'2904','Retorno de remessa para venda fora do estabelecimento','E','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas em retorno de mercadorias remetidas para venda fora do estabelecimento, inclusive por meio de veículos, e não comercializadas.','\0','\0',1,1),(193,'2905','Entrada de mercadoria recebida para depósito em depósito fechado ou armazém geral','E','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas de mercadorias recebidas para depósito em depósito fechado ou armazém geral.','\0','\0',1,1),(194,'2906','Retorno de mercadoria remetida para depósito fechado ou armazém geral','E','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas em retorno de mercadorias remetidas para depósito em depósito fechado ou armazém geral.','\0','\0',1,1),(195,'2907','Retorno simbólico de mercadoria remetida para depósito fechado ou armazém geral','E','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas em retorno simbólico de mercadorias remetidas para depósito em depósito fechado ou armazém geral, quando as mercadorias depositadas tenham sido objeto de saída a qualquer título e que não tenham retornado ao estabelecimento depositante.','\0','\0',1,1),(196,'2908','Entrada de bem por conta de contrato de comodato','E','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas de bens recebidos em cumprimento de contrato de comodato.','\0','\0',1,1),(197,'2909','Retorno de bem remetido por conta de contrato de comodato','E','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas de bens recebidos em devolução após cumprido o contrato de comodato.','\0','\0',1,1),(198,'2910','Entrada de bonificação, doação ou brinde','E','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas de mercadorias recebidas a título de bonificação, doação ou brinde.','\0','\0',1,1),(199,'2911','Entrada de amostra grátis','E','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas de mercadorias recebidas a título de amostra grátis.','\0','\0',1,1),(200,'2912','Entrada de mercadoria ou bem recebido para demonstração','E','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas de mercadorias ou bens recebidos para demonstração.','\0','\0',1,1),(201,'2913','Retorno de mercadoria ou bem remetido para demonstração','E','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas em retorno de mercadorias ou bens remetidos para demonstração.','\0','\0',1,1),(202,'2914','Retorno de mercadoria ou bem remetido para exposição ou feira','E','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas em retorno de mercadorias ou bens remetidos para exposição ou feira.','\0','\0',1,1),(203,'2915','Entrada de mercadoria ou bem recebido para conserto ou reparo','E','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas de mercadorias ou bens recebidos para conserto ou reparo.','\0','\0',1,1),(204,'2916','Retorno de mercadoria ou bem remetido para conserto ou reparo','E','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas em retorno de mercadorias ou bens remetidos para conserto ou reparo.','\0','\0',1,1),(205,'2917','Entrada de mercadoria recebida em consignação mercantil ou industrial','E','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas de mercadorias recebidas a título de consignação mercantil ou industrial.','\0','\0',1,1),(206,'2918','Devolução de mercadoria remetida em consignação mercantil ou industrial','E','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas por devolução de mercadorias remetidas anteriormente a título de consignação mercantil ou industrial.','\0','\0',1,1),(207,'2919','Devolução simbólica de mercadoria vendida ou utilizada em processo industrial, remetida anteriormente em consignação mercantil ou industrial','E','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas por devolução simbólica de mercadorias vendidas ou utilizadas em processo industrial, remetidas anteriormente a título de consignação mercantil ou industrial.','\0','\0',1,1),(208,'2920','Entrada de vasilhame ou sacaria','E','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas de vasilhame ou sacaria.','\0','\0',1,1),(209,'2921','Retorno de vasilhame ou sacaria','E','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas em retorno de vasilhame ou sacaria.','\0','\0',1,1),(210,'2922','Lançamento efetuado a título de simples faturamento decorrente de compra para recebimento futuro','E','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código os registros efetuados a título de simples faturamento decorrente de compra para recebimento futuro.','\0','\0',1,1),(211,'2923','Entrada de mercadoria recebida do vendedor remetente, em venda à ordem','E','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas de mercadorias recebidas do vendedor remetente, em vendas à ordem, cuja compra do adquirente originário, foi classificada nos códigos “2.120 - Compra para industrialização, em venda à ordem, já recebida do vendedor remetente” ou “2.121 - Compra para comercialização, em venda à ordem, já recebida do vendedor remetente”.','\0','\0',1,1),(212,'2924','Entrada para industrialização por conta e ordem do adquirente da mercadoria, quando esta não transitar pelo estabelecimento do adquirente','E','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas de insumos recebidos para serem industrializados por conta e ordem do adquirente, nas hipóteses em que os insumos não tenham transitado pelo estabelecimento do adquirente dos mesmos.','\0','\0',1,1),(213,'2925','Retorno de mercadoria remetida para industrialização por conta e ordem do adquirente da mercadoria, quando esta não transitar pelo estabelecimento do adquirente','E','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código o retorno dos insumos remetidos por conta e ordem do adquirente, para industrialização e incorporados ao produto final pelo estabelecimento industrializador, nas hipóteses em que os insumos não tenham transitado pelo estabelecimento do adquirente.','\0','\0',1,1),(214,'2949','Outra entrada de mercadoria ou prestação de serviço não especificado','E','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as outras entradas de mercadorias ou prestações de serviços que não tenham sido especificados nos códigos anteriores.','\0','\0',1,1),(215,'3000','ENTRADAS OU AQUISIÇÕES DE SERVIÇOS DO EXTERIOR','E','X','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se, neste grupo, as entradas de mercadorias oriundas de outro país, inclusive as decorrentes de aquisição por arrematação, concorrência ou qualquer outra forma de alienação promovida pelo poder público, e os serviços iniciados no exterior.','','\0',1,1),(216,'3100','COMPRAS PARA INDUSTRIALIZAÇÃO, COMERCIALIZAÇÃO OU PRESTAÇÃO DE SERVIÇOS','E','X','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(217,'3101','Compra para industrialização','E','X','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras de mercadorias a serem utilizadas em processo de industrialização. Também serão classificadas neste código as entradas de mercadorias em estabelecimento industrial de cooperativa.','\0','\0',1,1),(218,'3102','Compra para comercialização','E','X','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras de mercadorias a serem comercializadas. Também serão classificadas neste código as entradas de mercadorias em estabelecimento comercial de cooperativa.','\0','\0',1,1),(219,'3126','Compra para utilização na prestação de serviço','E','X','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as entradas de mercadorias a serem utilizadas nas prestações de serviços.','\0','\0',1,1),(220,'3127','Compra para industrialização sob o regime de “drawback”','E','X','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras de mercadorias a serem utilizadas em processo de industrialização e posterior exportação do produto resultante, cujas vendas serão classificadas no código “7.127 - Venda de produção do estabelecimento sob o regime de “drawback””.','\0','\0',1,1),(221,'3200','DEVOLUÇÕES DE VENDAS DE PRODUÇÃO PRÓPRIA, DE TERCEIROS OU ANULAÇÕES DE VALORES','E','X','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(222,'3201','Devolução de venda de produção do estabelecimento','E','X','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de vendas de produtos industrializados pelo estabelecimento, cujas saídas tenham sido classificadas como “Venda de produção do estabelecimento”.','\0','\0',1,1),(223,'3202','Devolução de venda de mercadoria adquirida ou recebida de terceiros','E','X','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de vendas de mercadorias adquiridas ou recebidas de terceiros, que não tenham sido objeto de industrialização no estabelecimento, cujas saídas tenham sido classificadas como “Venda de mercadoria adquirida ou recebida de terceiros”.','\0','\0',1,1),(224,'3205','Anulação de valor relativo à prestação de serviço de comunicação','E','X','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as anulações correspondentes a valores faturados indevidamente, decorrentes de prestações de serviços de comunicação.','\0','\0',1,1),(225,'3206','Anulação de valor relativo à prestação de serviço de transporte','E','X','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as anulações correspondentes a valores faturados indevidamente, decorrentes de prestações de serviços de transporte.','\0','\0',1,1),(226,'3207','Anulação de valor relativo à venda de energia elétrica','E','X','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as anulações correspondentes a valores faturados indevidamente, decorrentes de venda de energia elétrica.','\0','\0',1,1),(227,'3211','Devolução de venda de produção do estabelecimento sob o regime de “drawback”','E','X','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de vendas de produtos industrializados pelo estabelecimento sob o regime de “drawback”.','\0','\0',1,1),(228,'3250','COMPRAS DE ENERGIA ELÉTRICA','E','X','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(229,'3251','Compra de energia elétrica para distribuição ou comercialização','E','X','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras de energia elétrica utilizada em sistema de distribuição ou comercialização. Também serão classificadas neste código as compras de energia elétrica por cooperativas para distribuição aos seus cooperados.','\0','\0',1,1),(230,'3300','AQUISIÇÕES DE SERVIÇOS DE COMUNICAÇÃO','E','X','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(231,'3301','Aquisição de serviço de comunicação para execução de serviço da mesma natureza','E','X','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as aquisições de serviços de comunicação utilizados nas prestações de serviços da mesma natureza.','\0','\0',1,1),(232,'3350','AQUISIÇÕES DE SERVIÇOS DE TRANSPORTE','E','X','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(233,'3351','Aquisição de serviço de transporte para execução de serviço da mesma natureza','E','X','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as aquisições de serviços de transporte utilizados nas prestações de serviços da mesma natureza.','\0','\0',1,1),(234,'3352','Aquisição de serviço de transporte por estabelecimento industrial','E','X','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as aquisições de serviços de transporte utilizados por estabelecimento industrial. Também serão classificadas neste código as aquisições de serviços de transporte utilizados por estabelecimento industrial de cooperativa.','\0','\0',1,1),(235,'3353','Aquisição de serviço de transporte por estabelecimento comercial','E','X','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as aquisições de serviços de transporte utilizados por estabelecimento comercial. Também serão classificadas neste código as aquisições de serviços de transporte utilizados por estabelecimento comercial de cooperativa.','\0','\0',1,1),(236,'3354','Aquisição de serviço de transporte por estabelecimento de prestador de serviço de comunicação','E','X','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as aquisições de serviços de transporte utilizados por estabelecimento prestador de serviços de comunicação.','\0','\0',1,1),(237,'3355','Aquisição de serviço de transporte por estabelecimento de geradora ou de distribuidora de energia elétrica','E','X','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as aquisições de serviços de transporte utilizados por estabelecimento de geradora ou de distribuidora de energia elétrica.','\0','\0',1,1),(238,'3356','Aquisição de serviço de transporte por estabelecimento de produtor rural','E','X','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as aquisições de serviços de transporte utilizados por estabelecimento de produtor rural.','\0','\0',1,1),(239,'3500','ENTRADAS DE MERCADORIAS REMETIDAS COM FIM ESPECÍFICO DE EXPORTAÇÃO E EVENTUAIS DEVOLUÇÕES','E','X','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(240,'3503','Devolução de mercadoria exportada que tenha sido recebida com fim específico de exportação','E','X','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de mercadorias exportadas por “trading company”, empresa comercial exportadora ou outro estabelecimento do remetente, recebidas com fim específico de exportação, cujas saídas tenham sido classificadas no código “7.501 - Exportação de mercadorias recebidas com fim específico de exportação”.','\0','\0',1,1),(241,'3550','OPERAÇÕES COM BENS DE ATIVO IMOBILIZADO E MATERIAIS PARA USO OU CONSUMO','E','X','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(242,'3551','Compra de bem para o ativo imobilizado','E','X','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras de bens destinados ao ativo imobilizado do estabelecimento.','\0','\0',1,1),(243,'3553','Devolução de venda de bem do ativo imobilizado','E','X','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de vendas de bens do ativo imobilizado, cujas saídas tenham sido classificadas no código “7.551 - Venda de bem do ativo imobilizado”.','\0','\0',1,1),(244,'3556','Compra de material para uso ou consumo','E','X','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as compras de mercadorias destinadas ao uso ou consumo do estabelecimento.','\0','\0',1,1),(245,'3900','OUTRAS ENTRADAS DE MERCADORIAS OU AQUISIÇÕES DE SERVIÇOS','E','X','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(246,'3930','Lançamento efetuado a título de entrada de bem sob amparo de regime especial aduaneiro de admissão temporária','E','X','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código os lançamentos efetuados a título de entrada de bens amparada por regime especial aduaneiro de admissão temporária.','\0','\0',1,1),(247,'3949','Outra entrada de mercadoria ou prestação de serviço não especificado','E','X','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as outras entradas de mercadorias ou prestações de serviços que não tenham sido especificados nos códigos anteriores.','\0','\0',1,1),(248,'5000','SAÍDAS OU PRESTAÇÕES DE SERVIÇOS PARA O ESTADO','S','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se, neste grupo, as operações ou prestações em que o estabelecimento remetente esteja localizado na mesma unidade da Federação do destinatário.','','\0',1,1),(249,'5100','VENDAS DE PRODUÇÃO PRÓPRIA OU DE TERCEIROS','S','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(250,'5101','Venda de produção do estabelecimento','S','E','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de produtos industrializados no estabelecimento. Também serão classificadas neste código as vendas de mercadorias por estabelecimento industrial de cooperativa destinadas a seus cooperados ou a estabelecimento de outra cooperativa.','\0','\0',1,1),(251,'5102','Venda de mercadoria adquirida ou recebida de terceiros','S','E','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de mercadorias adquiridas ou recebidas de terceiros para industrialização ou comercialização, que não tenham sido objeto de qualquer processo industrial no estabelecimento. Também serão classificadas neste código as vendas de mercadorias por estabelecimento comercial de cooperativa destinadas a seus cooperados ou estabelecimento de outra cooperativa.','\0','\0',1,1),(252,'5103','Venda de produção do estabelecimento, efetuada fora do estabelecimento','S','E','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas efetuadas fora do estabelecimento, inclusive por meio de veículo, de produtos industrializados no estabelecimento.','\0','\0',1,1),(253,'5104','Venda de mercadoria adquirida ou recebida de terceiros, efetuada fora do estabelecimento','S','E','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas efetuadas fora do estabelecimento, inclusive por meio de veículo, de mercadorias adquiridas ou recebidas de terceiros para industrialização ou comercialização, que não tenham sido objeto de qualquer processo industrial no estabelecimento.','\0','\0',1,1),(254,'5105','Venda de produção do estabelecimento que não deva por ele transitar','S','E','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de produtos industrializados no estabelecimento, armazenados em depósito fechado, armazém geral ou outro sem que haja retorno ao estabelecimento depositante.','\0','\0',1,1),(255,'5106','Venda de mercadoria adquirida ou recebida de terceiros, que não deva por ele transitar','S','E','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de mercadorias adquiridas ou recebidas de terceiros para industrialização ou comercialização, armazenadas em depósito fechado, armazém geral ou outro, que não tenham sido objeto de qualquer processo industrial no estabelecimento sem que haja retorno ao estabelecimento depositante. Também serão classificadas neste código as vendas de mercadorias importadas, cuja saída ocorra do recinto alfandegado ou da repartição alfandegária onde se processou o desembaraço aduaneiro, com destino ao estabelecimento do comprador, sem transitar pelo estabelecimento do importador.','\0','\0',1,1),(256,'5109','Venda de produção do estabelecimento, destinada à Zona Franca de Manaus ou Áreas de Livre Comércio','S','E','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de produtos industrializados pelo estabelecimento, destinados à Zona Franca de Manaus ou Áreas de Livre Comércio.','\0','\0',1,1),(257,'5110','Venda de mercadoria adquirida ou recebida de terceiros, destinada à Zona Franca de Manaus ou Áreas de Livre Comércio','S','E','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de mercadorias adquiridas ou recebidas de terceiros, que não tenham sido objeto de qualquer processo industrial no estabelecimento, destinadas à Zona Franca de Manaus ou Áreas de Livre Comércio.','\0','\0',1,1),(258,'5111','Venda de produção do estabelecimento remetida anteriormente em consignação industrial','S','E','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas efetivas de produtos industrializados no estabelecimento remetidos anteriormente a título de consignação industrial.','\0','\0',1,1),(259,'5112','Venda de mercadoria adquirida ou recebida de terceiros remetida anteriormente em consignação industrial','S','E','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas efetivas de mercadorias adquiridas ou recebidas de terceiros, que não tenham sido objeto de qualquer processo industrial no estabelecimento, remetidas anteriormente a título de consignação industrial.','\0','\0',1,1),(260,'5113','Venda de produção do estabelecimento remetida anteriormente em consignação mercantil','S','E','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas efetivas de produtos industrializados no estabelecimento remetidos anteriormente a título de consignação mercantil.','\0','\0',1,1),(261,'5114','Venda de mercadoria adquirida ou recebida de terceiros remetida anteriormente em consignação mercantil','S','E','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas efetivas de mercadorias adquiridas ou recebidas de terceiros, que não tenham sido objeto de qualquer processo industrial no estabelecimento, remetidas anteriormente a título de consignação mercantil.','\0','\0',1,1),(262,'5115','Venda de mercadoria adquirida ou recebida de terceiros, recebida anteriormente em consignação mercantil','S','E','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de mercadorias adquiridas ou recebidas de terceiros, recebidas anteriormente a título de consignação mercantil.','\0','\0',1,1),(263,'5116','Venda de produção do estabelecimento originada de encomenda para entrega futura','S','E','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de produtos industrializados pelo estabelecimento, quando da saída real do produto, cujo faturamento tenha sido classificado no código “5.922 - Lançamento efetuado a título de simples faturamento decorrente de venda para entrega futura”.','\0','\0',1,1),(264,'5117','Venda de mercadoria adquirida ou recebida de terceiros, originada de encomenda para entrega futura','S','E','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de mercadorias adquiridas ou recebidas de terceiros, que não tenham sido objeto de qualquer processo industrial no estabelecimento, quando da saída real da mercadoria, cujo faturamento tenha sido classificado no código “5.922 - Lançamento efetuado a título de simples faturamento decorrente de venda para entrega futura”.','\0','\0',1,1),(265,'5118','Venda de produção do estabelecimento entregue ao destinatário por conta e ordem do adquirente originário, em venda à ordem','S','E','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas à ordem de produtos industrializados pelo estabelecimento, entregues ao destinatário por conta e ordem do adquirente originário.','\0','\0',1,1),(266,'5119','Venda de mercadoria adquirida ou recebida de terceiros entregue ao destinatário por conta e ordem do adquirente originário, em venda à ordem','S','E','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas à ordem de mercadorias adquiridas ou recebidas de terceiros, que não tenham sido objeto de qualquer processo industrial no estabelecimento, entregues ao destinatário por conta e ordem do adquirente originário.','\0','\0',1,1),(267,'5120','Venda de mercadoria adquirida ou recebida de terceiros entregue ao destinatário pelo vendedor remetente, em venda à ordem','S','E','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas à ordem de mercadorias adquiridas ou recebidas de terceiros, que não tenham sido objeto de qualquer processo industrial no estabelecimento, entregues pelo vendedor remetente ao destinatário, cuja compra seja classificada, pelo adquirente originário, no código “1.118 - Compra de mercadoria para comercialização pelo adquirente originário, entregue pelo vendedor remetente ao destinatário, em venda à ordem”.','\0','\0',1,1),(268,'5122','Venda de produção do estabelecimento remetida para industrialização, por conta e ordem do adquirente, sem transitar pelo estabelecimento do adquirente','S','E','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de produtos industrializados no estabelecimento, remetidos para serem industrializados em outro estabelecimento, por conta e ordem do adquirente, sem que os produtos tenham transitado pelo estabelecimento do adquirente.','\0','\0',1,1),(269,'5123','Venda de mercadoria adquirida ou recebida de terceiros remetida para industrialização, por conta e ordem do adquirente, sem transitar pelo estabelecimento do adquirente','S','E','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de mercadorias adquiridas ou recebidas de terceiros, que não tenham sido objeto de qualquer processo industrial no estabelecimento, remetidas para serem industrializadas em outro estabelecimento, por conta e ordem do adquirente, sem que as mercadorias tenham transitado pelo estabelecimento do adquirente.','\0','\0',1,1),(270,'5124','Industrialização efetuada para outra empresa','S','E','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as saídas de mercadorias industrializadas para terceiros, compreendendo os valores referentes aos serviços prestados e os das mercadorias de propriedade do industrializador empregadas no processo industrial.','\0','\0',1,1),(271,'5125','Industrialização efetuada para outra empresa quando a mercadoria recebida para utilização no processo de industrialização não transitar pelo estabelecimento adquirente da mercadoria','S','E','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as saídas de mercadorias industrializadas para outras empresas, em que as mercadorias recebidas para utilização no processo de industrialização não tenham transitado pelo estabelecimento do adquirente das mercadorias, compreendendo os valores referentes aos serviços prestados e os das mercadorias de propriedade do industrializador empregadas no processo industrial.','\0','\0',1,1),(272,'5150','TRANSFERÊNCIAS DE PRODUÇÃO PRÓPRIA OU DE TERCEIROS','S','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(273,'5151','Transferência de produção do estabelecimento','S','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código os produtos industrializados no estabelecimento e transferidos para outro estabelecimento da mesma empresa.','\0','\0',1,1),(274,'5152','Transferência de mercadoria adquirida ou recebida de terceiros','S','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as mercadorias adquiridas ou recebidas de terceiros para industrialização ou comercialização e que não tenham sido objeto de qualquer processo industrial no estabelecimento, transferidas para outro estabelecimento da mesma empresa.','\0','\0',1,1),(275,'5153','Transferência de energia elétrica','S','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as transferências de energia elétrica para outro estabelecimento da mesma empresa, para distribuição.','\0','\0',1,1),(276,'5155','Transferência de produção do estabelecimento, que não deva por ele transitar','S','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as transferências para outro estabelecimento da mesma empresa, de produtos industrializados no estabelecimento que tenham sido remetidos para armazém geral, depósito fechado ou outro, sem que haja retorno ao estabelecimento depositante.','\0','\0',1,1),(277,'5156','Transferência de mercadoria adquirida ou recebida de terceiros, que não deva por ele transitar','S','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as transferências para outro estabelecimento da mesma empresa, de mercadorias adquiridas ou recebidas de terceiros para industrialização ou comercialização, que não tenham sido objeto de qualquer processo industrial, remetidas para armazém geral, depósito fechado ou outro, sem que haja retorno ao estabelecimento depositante.','\0','\0',1,1),(278,'5200','DEVOLUÇÕES DE COMPRAS PARA INDUSTRIALIZAÇÃO, COMERCIALIZAÇÃO OU ANULAÇÕES DE VALORES','S','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(279,'5201','Devolução de compra para industrialização','S','E','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de mercadorias adquiridas para serem utilizadas em processo de industrialização, cujas entradas tenham sido classificadas como “Compra para industrialização”.','\0','\0',1,1),(280,'5202','Devolução de compra para comercialização','S','E','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de mercadorias adquiridas para serem comercializadas, cujas entradas tenham sido classificadas como “Compra para comercialização”.','\0','\0',1,1),(281,'5205','Anulação de valor relativo a aquisição de serviço de comunicação','S','E','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as anulações correspondentes a valores faturados indevidamente, decorrentes das aquisições de serviços de comunicação.','\0','\0',1,1),(282,'5206','Anulação de valor relativo a aquisição de serviço de transporte','S','E','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as anulações correspondentes a valores faturados indevidamente, decorrentes das aquisições de serviços de transporte.','\0','\0',1,1),(283,'5207','Anulação de valor relativo à compra de energia elétrica','S','E','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as anulações correspondentes a valores faturados indevidamente, decorrentes da compra de energia elétrica.','\0','\0',1,1),(284,'5208','Devolução de mercadoria recebida em transferência para industrialização','S','E','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de mercadorias recebidas em transferência de outros estabelecimentos da mesma empresa, para serem utilizadas em processo de industrialização.','\0','\0',1,1),(285,'5209','Devolução de mercadoria recebida em transferência para comercialização','S','E','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de mercadorias recebidas em transferência de outro estabelecimento da mesma empresa, para serem comercializadas.','\0','\0',1,1),(286,'5210','Devolução de compra para utilização na prestação de serviço','S','E','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de mercadorias adquiridas para utilização na prestação de serviços, cujas entradas tenham sido classificadas no código “1.126 - Compra para utilização na prestação de serviço”.','\0','\0',1,1),(287,'5250','VENDAS DE ENERGIA ELÉTRICA','S','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(288,'5251','Venda de energia elétrica para distribuição ou comercialização','S','E','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de energia elétrica destinada à distribuição ou comercialização. Também serão classificadas neste código as vendas de energia elétrica destinada a cooperativas para distribuição aos seus cooperados.','\0','\0',1,1),(289,'5252','Venda de energia elétrica para estabelecimento industrial','S','E','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de energia elétrica para consumo por estabelecimento industrial. Também serão classificadas neste código as vendas de energia elétrica destinada a estabelecimento industrial de cooperativa.','\0','\0',1,1),(290,'5253','Venda de energia elétrica para estabelecimento comercial','S','E','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de energia elétrica para consumo por estabelecimento comercial. Também serão classificadas neste código as vendas de energia elétrica destinada a estabelecimento comercial de cooperativa.','\0','\0',1,1),(291,'5254','Venda de energia elétrica para estabelecimento prestador de serviço de transporte','S','E','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de energia elétrica para consumo por estabelecimento de prestador de serviços de transporte.','\0','\0',1,1),(292,'5255','Venda de energia elétrica para estabelecimento prestador de serviço de comunicação','S','E','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de energia elétrica para consumo por estabelecimento de prestador de serviços de comunicação.','\0','\0',1,1),(293,'5256','Venda de energia elétrica para estabelecimento de produtor rural','S','E','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de energia elétrica para consumo por estabelecimento de produtor rural.','\0','\0',1,1),(294,'5257','Venda de energia elétrica para consumo por demanda contratada','S','E','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de energia elétrica para consumo por demanda contratada, que prevalecerá sobre os demais códigos deste subgrupo.','\0','\0',1,1),(295,'5258','Venda de energia elétrica a não-contribuinte','S','E','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de energia elétrica a pessoas físicas ou a pessoas jurídicas não indicadas nos códigos anteriores.','\0','\0',1,1),(296,'5300','PRESTAÇÕES DE SERVIÇOS DE COMUNICAÇÃO','S','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(297,'5301','Prestação de serviço de comunicação para execução de serviço da mesma natureza','S','E','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as prestações de serviços de comunicação destinados às prestações de serviços da mesma natureza.','\0','\0',1,1),(298,'5302','Prestação de serviço de comunicação a estabelecimento industrial','S','E','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as prestações de serviços de comunicação a estabelecimento industrial. Também serão classificados neste código os serviços de comunicação prestados a estabelecimento industrial de cooperativa.','\0','\0',1,1),(299,'5303','Prestação de serviço de comunicação a estabelecimento comercial','S','E','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as prestações de serviços de comunicação a estabelecimento comercial. Também serão classificados neste código os serviços de comunicação prestados a estabelecimento comercial de cooperativa.','\0','\0',1,1),(300,'5304','Prestação de serviço de comunicação a estabelecimento de prestador de serviço de transporte','S','E','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as prestações de serviços de comunicação a estabelecimento prestador de serviço de transporte.','\0','\0',1,1),(301,'5305','Prestação de serviço de comunicação a estabelecimento de geradora ou de distribuidora de energia elétrica','S','E','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as prestações de serviços de comunicação a estabelecimento de geradora ou de distribuidora de energia elétrica.','\0','\0',1,1),(302,'5306','Prestação de serviço de comunicação a estabelecimento de produtor rural','S','E','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as prestações de serviços de comunicação a estabelecimento de produtor rural.','\0','\0',1,1),(303,'5307','Prestação de serviço de comunicação a não-contribuinte','S','E','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as prestações de serviços de comunicação a pessoas físicas ou a pessoas jurídicas não indicadas nos códigos anteriores.','\0','\0',1,1),(304,'5350','PRESTAÇÕES DE SERVIÇOS DE TRANSPORTE','S','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(305,'5351','Prestação de serviço de transporte para execução de serviço da mesma natureza','S','E','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as prestações de serviços de transporte destinados às prestações de serviços da mesma natureza.','\0','\0',1,1),(306,'5352','Prestação de serviço de transporte a estabelecimento industrial','S','E','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as prestações de serviços de transporte a estabelecimento industrial. Também serão classificados neste código os serviços de transporte prestados a estabelecimento industrial de cooperativa.','\0','\0',1,1),(307,'5353','Prestação de serviço de transporte a estabelecimento comercial','S','E','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as prestações de serviços de transporte a estabelecimento comercial. Também serão classificados neste código os serviços de transporte prestados a estabelecimento comercial de cooperativa.','\0','\0',1,1),(308,'5354','Prestação de serviço de transporte a estabelecimento de prestador de serviço de comunicação','S','E','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as prestações de serviços de transporte a estabelecimento prestador de serviços de comunicação.','\0','\0',1,1),(309,'5355','Prestação de serviço de transporte a estabelecimento de geradora ou de distribuidora de energia elétrica','S','E','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as prestações de serviços de transporte a estabelecimento de geradora ou de distribuidora de energia elétrica.','\0','\0',1,1),(310,'5356','Prestação de serviço de transporte a estabelecimento de produtor rural','S','E','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as prestações de serviços de transporte a estabelecimento de produtor rural.','\0','\0',1,1),(311,'5357','Prestação de serviço de transporte a não-contribuinte','S','E','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as prestações de serviços de transporte a pessoas físicas ou a pessoas jurídicas não indicadas nos códigos anteriores.','\0','\0',1,1),(312,'5400','SAÍDAS DE MERCADORIAS SUJEITAS AO REGIME DE SUBSTITUIÇÃO TRIBUTÁRIA','S','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(313,'5401','Venda de produção do estabelecimento em operação com produto sujeito ao regime de substituição tributária, na condição de contribuinte substituto','S','E','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de produtos industrializados no estabelecimento em operações com produtos sujeitos ao regime de substituição tributária, na condição de contribuinte substituto. Também serão classificadas neste código as vendas de produtos industrializados por estabelecimento industrial de cooperativa sujeitos ao regime de substituição tributária, na condição de contribuinte substituto.','\0','\0',1,1),(314,'5402','Venda de produção do estabelecimento de produto sujeito ao regime de substituição tributária, em operação entre contribuintes substitutos do mesmo produto','S','E','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de produtos sujeitos ao regime de substituição tributária industrializados no estabelecimento, em operações entre contribuintes substitutos do mesmo produto.','\0','\0',1,1),(315,'5403','Venda de mercadoria adquirida ou recebida de terceiros em operação com mercadoria sujeita ao regime de substituição tributária, na condição de contribuinte substituto','S','E','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de mercadorias adquiridas ou recebidas de terceiros, na condição de contribuinte substituto, em operação com mercadorias sujeitas ao regime de substituição tributária.','\0','\0',1,1),(316,'5405','Venda de mercadoria adquirida ou recebida de terceiros em operação com mercadoria sujeita ao regime de substituição tributária, na condição de contribuinte substituído','S','E','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de mercadorias adquiridas ou recebidas de terceiros em operação com mercadorias sujeitas ao regime de substituição tributária, na condição de contribuinte substituído.','\0','\0',1,1),(317,'5408','Transferência de produção do estabelecimento em operação com produto sujeito ao regime de substituição tributária','S','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código os produtos industrializados no estabelecimento e transferidos para outro estabelecimento da mesma empresa, em operações com produtos sujeitos ao regime de substituição tributária.','\0','\0',1,1),(318,'5409','Transferência de mercadoria adquirida ou recebida de terceiros em operação com mercadoria sujeita ao regime de substituição tributária','S','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as transferências para outro estabelecimento da mesma empresa, de mercadorias adquiridas ou recebidas de terceiros que não tenham sido objeto de qualquer processo industrial no estabelecimento, em operações com mercadorias sujeitas ao regime de substituição tributária.','\0','\0',1,1),(319,'5410','Devolução de compra para industrialização em operação com mercadoria sujeita ao regime de substituição tributária','S','E','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de mercadorias adquiridas para serem utilizadas em processo de industrialização cujas entradas tenham sido classificadas como “Compra para industrialização em operação com mercadoria sujeita ao regime de substituição tributária”.','\0','\0',1,1),(320,'5411','Devolução de compra para comercialização em operação com mercadoria sujeita ao regime de substituição tributária','S','E','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de mercadorias adquiridas para serem comercializadas, cujas entradas tenham sido classificadas como “Compra para comercialização em operação com mercadoria sujeita ao regime de substituição tributária”.','\0','\0',1,1),(321,'5412','Devolução de bem do ativo imobilizado, em operação com mercadoria sujeita ao regime de substituição tributária','S','E','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de bens adquiridos para integrar o ativo imobilizado do estabelecimento, cuja entrada tenha sido classificada no código “1.406 - Compra de bem para o ativo imobilizado cuja mercadoria está sujeita ao regime de substituição tributária”.','\0','\0',1,1),(322,'5413','Devolução de mercadoria destinada ao uso ou consumo, em operação com mercadoria sujeita ao regime de substituição tributária','S','E','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de mercadorias adquiridas para uso ou consumo do estabelecimento, cuja entrada tenha sido classificada no código “1.407 - Compra de mercadoria para uso ou consumo cuja mercadoria está sujeita ao regime de substituição tributária”.','\0','\0',1,1),(323,'5414','Remessa de produção do estabelecimento para venda fora do estabelecimento em operação com produto sujeito ao regime de substituição tributária','S','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as remessas de produtos industrializados pelo estabelecimento para serem vendidos fora do estabelecimento, inclusive por meio de veículos, em operações com produtos sujeitos ao regime de substituição tributária.','\0','\0',1,1),(324,'5415','Remessa de mercadoria adquirida ou recebida de terceiros para venda fora do estabelecimento, em operação com mercadoria sujeita ao regime de substituição tributária','S','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as remessas de mercadorias adquiridas ou recebidas de terceiros para serem vendidas fora do estabelecimento, inclusive por meio de veículos, em operações com mercadorias sujeitas ao regime de substituição tributária.','\0','\0',1,1),(325,'5450','SISTEMAS DE INTEGRAÇÃO','S','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(326,'5451','Remessa de animal e de insumo para estabelecimento produtor','S','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as saídas referentes à remessa de animais e de insumos para criação de animais no sistema integrado, tais como: pintos, leitões, rações e medicamentos.','\0','\0',1,1),(327,'5500','REMESSAS COM FIM ESPECÍFICO DE EXPORTAÇÃO E EVENTUAIS DEVOLUÇÕES','S','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(328,'5501','Remessa de produção do estabelecimento, com fim específico de exportação','S','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as saídas de produtos industrializados pelo estabelecimento, remetidos com fim específico de exportação a “trading company”, empresa comercial exportadora ou outro estabelecimento do remetente.','\0','\0',1,1),(329,'5502','Remessa de mercadoria adquirida ou recebida de terceiros, com fim específico de exportação','S','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as saídas de mercadorias adquiridas ou recebidas de terceiros, remetidas com fim específico de exportação a “trading company”, empresa comercial exportadora ou outro estabelecimento do remetente.','\0','\0',1,1),(330,'5503','Devolução de mercadoria recebida com fim específico de exportação','S','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções efetuadas por “trading company”, empresa comercial exportadora ou outro estabelecimento do destinatário, de mercadorias recebidas com fim específico de exportação, cujas entradas tenham sido classificadas no código “1.501 - Entrada de mercadoria recebida com fim específico de exportação”.','\0','\0',1,1),(331,'5550','OPERAÇÕES COM BENS DE ATIVO IMOBILIZADO E MATERIAIS PARA USO OU CONSUMO','S','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(332,'5551','Venda de bem do ativo imobilizado','S','E','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de bens integrantes do ativo imobilizado do estabelecimento.','\0','\0',1,1),(333,'5552','Transferência de bem do ativo imobilizado','S','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código os bens do ativo imobilizado transferidos para outro estabelecimento da mesma empresa.','\0','\0',1,1),(334,'5553','Devolução de compra de bem para o ativo imobilizado','S','E','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de bens adquiridos para integrar o ativo imobilizado do estabelecimento, cuja entrada foi classificada no código “1.551 - Compra de bem para o ativo imobilizado”.','\0','\0',1,1),(335,'5554','Remessa de bem do ativo imobilizado para uso fora do estabelecimento','S','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as remessas de bens do ativo imobilizado para uso fora do estabelecimento.','\0','\0',1,1),(336,'5555','Devolução de bem do ativo imobilizado de terceiro, recebido para uso no estabelecimento','S','E','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as saídas em devolução, de bens do ativo imobilizado de terceiros, recebidos para uso no estabelecimento, cuja entrada tenha sido classificada no código “1.555 - Entrada de bem do ativo imobilizado de terceiro, remetido para uso no estabelecimento”.','\0','\0',1,1),(337,'5556','Devolução de compra de material de uso ou consumo','S','E','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de mercadorias destinadas ao uso ou consumo do estabelecimento, cuja entrada tenha sido classificada no código “1.556 - Compra de material para uso ou consumo”.','\0','\0',1,1),(338,'5557','Transferência de material de uso ou consumo','S','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código os materiais para uso ou consumo transferidos para outro estabelecimento da mesma empresa.','\0','\0',1,1),(339,'5600','CRÉDITOS E RESSARCIMENTOS DE ICMS','S','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(340,'5601','Transferência de crédito de ICMS acumulado','S','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código os lançamentos destinados ao registro da transferência de créditos de ICMS para outras empresas.','\0','\0',1,1),(341,'5602','Transferência de saldo credor de ICMS para outro estabelecimento da mesma empresa, destinado à compensação de saldo devedor de ICMS','S','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código os lançamentos destinados ao registro da transferência de saldos credores de ICMS para outros estabelecimentos da mesma empresa, destinados à compensação do saldo devedor desses estabelecimentos.','\0','\0',1,1),(342,'5603','Ressarcimento de ICMS retido por substituição tributária','S','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código os lançamentos destinados ao registro de ressarcimento de ICMS retido por substituição tributária a contribuinte substituído, efetuado pelo contribuinte substituto, nas hipóteses previstas na legislação aplicável.','\0','\0',1,1),(343,'5900','OUTRAS SAÍDAS DE MERCADORIAS OU PRESTAÇÕES DE SERVIÇOS','S','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(344,'5901','Remessa para industrialização por encomenda','S','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as remessas de insumos remetidos para industrialização por encomenda, a ser realizada em outra empresa ou em outro estabelecimento da mesma empresa.','\0','\0',1,1),(345,'5902','Retorno de mercadoria utilizada na industrialização por encomenda','S','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as remessas, pelo estabelecimento industrializador, dos insumos recebidos para industrialização e incorporados ao produto final, por encomenda de outra empresa ou de outro estabelecimento da mesma empresa. O valor dos insumos nesta operação deverá ser igual ao valor dos insumos recebidos para industrialização.','\0','\0',1,1),(346,'5903','Retorno de mercadoria recebida para industrialização e não aplicada no referido processo','S','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as remessas em devolução de insumos recebidos para industrialização e não aplicados no referido processo.','\0','\0',1,1),(347,'5904','Remessa para venda fora do estabelecimento','S','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as remessas de mercadorias para venda fora do estabelecimento, inclusive por meio de veículos.','\0','\0',1,1),(348,'5905','Remessa para depósito fechado ou armazém geral','S','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as remessas de mercadorias para depósito em depósito fechado ou armazém geral.','\0','\0',1,1),(349,'5906','Retorno de mercadoria depositada em depósito fechado ou armazém geral','S','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código os retornos de mercadorias depositadas em depósito fechado ou armazém geral ao estabelecimento depositante.','\0','\0',1,1),(350,'5907','Retorno simbólico de mercadoria depositada em depósito fechado ou armazém geral','S','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código os retornos simbólicos de mercadorias recebidas para depósito em depósito fechado ou armazém geral, quando as mercadorias depositadas tenham sido objeto de saída a qualquer título e que não devam retornar ao estabelecimento depositante.','\0','\0',1,1),(351,'5908','Remessa de bem por conta de contrato de comodato','S','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as remessas de bens para o cumprimento de contrato de comodato.','\0','\0',1,1),(352,'5909','Retorno de bem recebido por conta de contrato de comodato','S','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as remessas de bens em devolução após cumprido o contrato de comodato.','\0','\0',1,1),(353,'5910','Remessa em bonificação, doação ou brinde','S','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as remessas de mercadorias a título de bonificação, doação ou brinde.','\0','\0',1,1),(354,'5911','Remessa de amostra grátis','S','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as remessas de mercadorias a título de amostra grátis.','\0','\0',1,1),(355,'5912','Remessa de mercadoria ou bem para demonstração','S','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as remessas de mercadorias ou bens para demonstração.','\0','\0',1,1),(356,'5913','Retorno de mercadoria ou bem recebido para demonstração','S','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as remessas em devolução de mercadorias ou bens recebidos para demonstração.','\0','\0',1,1),(357,'5914','Remessa de mercadoria ou bem para exposição ou feira','S','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as remessas de mercadorias ou bens para exposição ou feira.','\0','\0',1,1),(358,'5915','Remessa de mercadoria ou bem para conserto ou reparo','S','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as remessas de mercadorias ou bens para conserto ou reparo.','\0','\0',1,1),(359,'5916','Retorno de mercadoria ou bem recebido para conserto ou reparo','S','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as remessas em devolução de mercadorias ou bens recebidos para conserto ou reparo.','\0','\0',1,1),(360,'5917','Remessa de mercadoria em consignação mercantil ou industrial','S','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as remessas de mercadorias a título de consignação mercantil ou industrial.','\0','\0',1,1),(361,'5918','Devolução de mercadoria recebida em consignação mercantil ou industrial','S','E','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de mercadorias recebidas anteriormente a título de consignação mercantil ou industrial.','\0','\0',1,1),(362,'5919','Devolução simbólica de mercadoria vendida ou utilizada em processo industrial, recebida anteriormente em consignação mercantil ou industrial','S','E','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções simbólicas de mercadorias vendidas ou utilizadas em processo industrial, que tenham sido recebidas anteriormente a título de consignação mercantil ou industrial.','\0','\0',1,1),(363,'5920','Remessa de vasilhame ou sacaria','S','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as remessas de vasilhame ou sacaria.','\0','\0',1,1),(364,'5921','Devolução de vasilhame ou sacaria','S','E','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as saídas por devolução de vasilhame ou sacaria.','\0','\0',1,1),(365,'5922','Lançamento efetuado a título de simples faturamento decorrente de venda para entrega futura','S','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código os registros efetuados a título de simples faturamento decorrente de venda para entrega futura.','\0','\0',1,1),(366,'5923','Remessa de mercadoria por conta e ordem de terceiros, em venda à ordem','S','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as saídas correspondentes à entrega de mercadorias por conta e ordem de terceiros, em vendas à ordem, cuja venda ao adquirente originário, foi classificada nos códigos “5.118 - Venda de produção do estabelecimento entregue ao destinatário por conta e ordem do adquirente originário, em venda à ordem” ou “5.119 - Venda de mercadoria adquirida ou recebida de terceiros entregue ao destinatário por conta e ordem do adquirente originário, em venda à ordem”.','\0','\0',1,1),(367,'5924','Remessa para industrialização por conta e ordem do adquirente da mercadoria, quando esta não transitar pelo estabelecimento do adquirente','S','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as saídas de insumos com destino a estabelecimento industrializador, para serem industrializados por conta e ordem do adquirente, nas hipóteses em que os insumos não tenham transitado pelo estabelecimento do adquirente dos mesmos.','\0','\0',1,1),(368,'5925','Retorno de mercadoria recebida para industrialização por conta e ordem do adquirente da mercadoria, quando aquela não transitar pelo estabelecimento do adquirente','S','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as remessas, pelo estabelecimento industrializador, dos insumos recebidos, por conta e ordem do adquirente, para industrialização e incorporados ao produto final, nas hipóteses em que os insumos não tenham transitado pelo estabelecimento do adquirente. O valor dos insumos nesta operação deverá ser igual ao valor dos insumos recebidos para industrialização.','\0','\0',1,1),(369,'5926','Lançamento efetuado a título de reclassificação de mercadoria decorrente de formação de kit ou de sua desagregação','S','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código os registros efetuados a título de reclassificação decorrente de formação de kit de mercadorias ou de sua desagregação.','\0','\0',1,1),(370,'5927','Lançamento efetuado a título de baixa de estoque decorrente de perda, roubo ou deterioração','S','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código os registros efetuados a título de baixa de estoque decorrente de perda, roubo ou deterioração das mercadorias.','\0','\0',1,1),(371,'5928','Lançamento efetuado a título de baixa de estoque decorrente do encerramento da atividade da empresa','S','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código os registros efetuados a título de baixa de estoque decorrente do encerramento das atividades da empresa.','\0','\0',1,1),(372,'5929','Lançamento efetuado em decorrência de emissão de documento fiscal relativo a operação ou prestação também registrada em equipamento Emissor de Cupom Fiscal - ECF','S','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código os registros relativos aos documentos fiscais emitidos em operações ou prestações que também tenham sido registradas em equipamento Emissor de Cupom Fiscal - ECF.','\0','\0',1,1),(373,'5931','Lançamento efetuado em decorrência da respons. de retenção do imposto por subst. tributária, atribuída ao rem. ou alienante da merc., pelo serv. de transp. realizado por transp. autônomo ou por transp. não inscrito na UF onde iniciado o serviço','S','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código exclusivamente os lançamentos efetuados pelo remetente ou alienante da mercadoria quando lhe for atribuída a responsabilidade pelo recolhimento do imposto devido pelo serviço de transporte realizado por transportador autônomo ou por transportador não inscrito na unidade da Federação onde iniciado o serviço.','\0','\0',1,1),(374,'5932','Prestação de serviço de transporte iniciada em unidade da Federação diversa daquela onde inscrito o prestador','S','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as prestações de serviço de transporte que tenham sido iniciadas em unidade da Federação diversa daquela onde o prestador está inscrito como contribuinte.','\0','\0',1,1),(375,'5949','Outra saída de mercadoria ou prestação de serviço não especificado','S','E','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as outras saídas de mercadorias ou prestações de serviços que não tenham sido especificados nos códigos anteriores.','\0','\0',1,1),(376,'6000','SAÍDAS OU PRESTAÇÕES DE SERVIÇOS PARA OUTROS ESTADOS','S','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se, neste grupo, as operações ou prestações em que o estabelecimento remetente esteja localizado em unidade da Federação diversa daquela do destinatário.','','\0',1,1),(377,'6100','VENDAS DE PRODUÇÃO PRÓPRIA OU DE TERCEIROS','S','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(378,'6101','Venda de produção do estabelecimento','S','I','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de produtos industrializados no estabelecimento. Também serão classificadas neste código as vendas de mercadorias por estabelecimento industrial de cooperativa destinadas a seus cooperados ou a estabelecimento de outra cooperativa.','\0','\0',1,1),(379,'6102','Venda de mercadoria adquirida ou recebida de terceiros','S','I','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de mercadorias adquiridas ou recebidas de terceiros para industrialização ou comercialização, que não tenham sido objeto de qualquer processo industrial no estabelecimento. Também serão classificadas neste código as vendas de mercadorias por estabelecimento comercial de cooperativa destinadas a seus cooperados ou estabelecimento de outra cooperativa.','\0','\0',1,1),(380,'6103','Venda de produção do estabelecimento, efetuada fora do estabelecimento','S','I','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas efetuadas fora do estabelecimento, inclusive por meio de veículo, de produtos industrializados no estabelecimento.','\0','\0',1,1),(381,'6104','Venda de mercadoria adquirida ou recebida de terceiros, efetuada fora do estabelecimento','S','I','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas efetuadas fora do estabelecimento, inclusive por meio de veículo, de mercadorias adquiridas ou recebidas de terceiros para industrialização ou comercialização, que não tenham sido objeto de qualquer processo industrial no estabelecimento.','\0','\0',1,1),(382,'6105','Venda de produção do estabelecimento que não deva por ele transitar','S','I','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de produtos industrializados no estabelecimento, armazenados em depósito fechado, armazém geral ou outro sem que haja retorno ao estabelecimento depositante.','\0','\0',1,1),(383,'6106','Venda de mercadoria adquirida ou recebida de terceiros, que não deva por ele transitar','S','I','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de mercadorias adquiridas ou recebidas de terceiros para industrialização ou comercialização, armazenadas em depósito fechado, armazém geral ou outro, que não tenham sido objeto de qualquer processo industrial no estabelecimento sem que haja retorno ao estabelecimento depositante. Também serão classificadas neste código as vendas de mercadorias importadas, cuja saída ocorra do recinto alfandegado ou da repartição alfandegária onde se processou o desembaraço aduaneiro, com destino ao estabelecimento do comprador, sem transitar pelo estabelecimento do importador.','\0','\0',1,1),(384,'6107','Venda de produção do estabelecimento, destinada a não-contribuinte','S','I','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de produtos industrializados no estabelecimento, destinadas a não-contribuintes. Quaisquer operações de venda destinadas a não-contribuintes deverão ser classificadas neste código.','\0','\0',1,1),(385,'6108','Venda de mercadoria adquirida ou recebida de terceiros, destinada a não-contribuinte','S','I','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de mercadorias adquiridas ou recebidas de terceiros para industrialização ou comercialização, que não tenham sido objeto de qualquer processo industrial no estabelecimento, destinadas a não-contribuintes. Quaisquer operações de venda destinadas a não-contribuintes deverão ser classificadas neste código.','\0','\0',1,1),(386,'6109','Venda de produção do estabelecimento, destinada à Zona Franca de Manaus ou Áreas de Livre Comércio','S','I','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de produtos industrializados pelo estabelecimento, destinados à Zona Franca de Manaus ou Áreas de Livre Comércio.','\0','\0',1,1),(387,'6110','Venda de mercadoria adquirida ou recebida de terceiros, destinada à Zona Franca de Manaus ou Áreas de Livre Comércio','S','I','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de mercadorias adquiridas ou recebidas de terceiros, que não tenham sido objeto de qualquer processo industrial no estabelecimento, destinadas à Zona Franca de Manaus ou Áreas de Livre Comércio.','\0','\0',1,1),(388,'6111','Venda de produção do estabelecimento remetida anteriormente em consignação industrial','S','I','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas efetivas de produtos industrializados no estabelecimento remetidos anteriormente a título de consignação industrial.','\0','\0',1,1),(389,'6112','Venda de mercadoria adquirida ou recebida de terceiros remetida anteriormente em consignação industrial','S','I','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas efetivas de mercadorias adquiridas ou recebidas de terceiros, que não tenham sido objeto de qualquer processo industrial no estabelecimento, remetidas anteriormente a título de consignação industrial.','\0','\0',1,1),(390,'6113','Venda de produção do estabelecimento remetida anteriormente em consignação mercantil','S','I','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas efetivas de produtos industrializados no estabelecimento remetidos anteriormente a título de consignação mercantil.','\0','\0',1,1),(391,'6114','Venda de mercadoria adquirida ou recebida de terceiros remetida anteriormente em consignação mercantil','S','I','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas efetivas de mercadorias adquiridas ou recebidas de terceiros, que não tenham sido objeto de qualquer processo industrial no estabelecimento, remetidas anteriormente a título de consignação mercantil.','\0','\0',1,1),(392,'6115','Venda de mercadoria adquirida ou recebida de terceiros, recebida anteriormente em consignação mercantil','S','I','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de mercadorias adquiridas ou recebidas de terceiros, recebidas anteriormente a título de consignação mercantil.','\0','\0',1,1),(393,'6116','Venda de produção do estabelecimento originada de encomenda para entrega futura','S','I','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de produtos industrializados pelo estabelecimento, quando da saída real do produto, cujo faturamento tenha sido classificado no código “6.922 - Lançamento efetuado a título de simples faturamento decorrente de venda para entrega futura”.','\0','\0',1,1),(394,'6117','Venda de mercadoria adquirida ou recebida de terceiros, originada de encomenda para entrega futura','S','I','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de mercadorias adquiridas ou recebidas de terceiros, que não tenham sido objeto de qualquer processo industrial no estabelecimento, quando da saída real da mercadoria, cujo faturamento tenha sido classificado no código “6.922 - Lançamento efetuado a título de simples faturamento decorrente de venda para entrega futura”.','\0','\0',1,1),(395,'6118','Venda de produção do estabelecimento entregue ao destinatário por conta e ordem do adquirente originário, em venda à ordem','S','I','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas à ordem de produtos industrializados pelo estabelecimento, entregues ao destinatário por conta e ordem do adquirente originário.','\0','\0',1,1),(396,'6119','Venda de mercadoria adquirida ou recebida de terceiros entregue ao destinatário por conta e ordem do adquirente originário, em venda à ordem','S','I','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas à ordem de mercadorias adquiridas ou recebidas de terceiros, que não tenham sido objeto de qualquer processo industrial no estabelecimento, entregues ao destinatário por conta e ordem do adquirente originário.','\0','\0',1,1),(397,'6120','Venda de mercadoria adquirida ou recebida de terceiros entregue ao destinatário pelo vendedor remetente, em venda à ordem','S','I','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas à ordem de mercadorias adquiridas ou recebidas de terceiros, que não tenham sido objeto de qualquer processo industrial no estabelecimento, entregues pelo vendedor remetente ao destinatário, cuja compra seja classificada, pelo adquirente originário, no código “2.118 - Compra de mercadoria para comercialização pelo adquirente originário, entregue pelo vendedor remetente ao destinatário, em venda à ordem”.','\0','\0',1,1),(398,'6122','Venda de produção do estabelecimento remetida para industrialização, por conta e ordem do adquirente, sem transitar pelo estabelecimento do adquirente','S','I','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de produtos industrializados no estabelecimento, remetidos para serem industrializados em outro estabelecimento, por conta e ordem do adquirente, sem que os produtos tenham transitado pelo estabelecimento do adquirente.','\0','\0',1,1),(399,'6123','Venda de mercadoria adquirida ou recebida de terceiros remetida para industrialização, por conta e ordem do adquirente, sem transitar pelo estabelecimento do adquirente','S','I','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de mercadorias adquiridas ou recebidas de terceiros, que não tenham sido objeto de qualquer processo industrial no estabelecimento, remetidas para serem industrializadas em outro estabelecimento, por conta e ordem do adquirente, sem que as mercadorias tenham transitado pelo estabelecimento do adquirente.','\0','\0',1,1),(400,'6124','Industrialização efetuada para outra empresa','S','I','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as saídas de mercadorias industrializadas para terceiros, compreendendo os valores referentes aos serviços prestados e os das mercadorias de propriedade do industrializador empregadas no processo industrial.','\0','\0',1,1),(401,'6125','Industrialização efetuada para outra empresa quando a mercadoria recebida para utilização no processo de industrialização não transitar pelo estabelecimento adquirente da mercadoria','S','I','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as saídas de mercadorias industrializadas para outras empresas, em que as mercadorias recebidas para utilização no processo de industrialização não tenham transitado pelo estabelecimento do adquirente das mercadorias, compreendendo os valores referentes aos serviços prestados e os das mercadorias de propriedade do industrializador empregadas no processo industrial.','\0','\0',1,1),(402,'6150','TRANSFERÊNCIAS DE PRODUÇÃO PRÓPRIA OU DE TERCEIROS','S','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(403,'6151','Transferência de produção do estabelecimento','S','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código os produtos industrializados no estabelecimento e transferidos para outro estabelecimento da mesma empresa.','\0','\0',1,1),(404,'6152','Transferência de mercadoria adquirida ou recebida de terceiros','S','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as mercadorias adquiridas ou recebidas de terceiros para industrialização ou comercialização e que não tenham sido objeto de qualquer processo industrial no estabelecimento, transferidas para outro estabelecimento da mesma empresa.','\0','\0',1,1),(405,'6153','Transferência de energia elétrica','S','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as transferências de energia elétrica para outro estabelecimento da mesma empresa, para distribuição.','\0','\0',1,1),(406,'6155','Transferência de produção do estabelecimento, que não deva por ele transitar','S','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as transferências para outro estabelecimento da mesma empresa, de produtos industrializados no estabelecimento que tenham sido remetidos para armazém geral, depósito fechado ou outro, sem que haja retorno ao estabelecimento depositante.','\0','\0',1,1),(407,'6156','Transferência de mercadoria adquirida ou recebida de terceiros, que não deva por ele transitar','S','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as transferências para outro estabelecimento da mesma empresa, de mercadorias adquiridas ou recebidas de terceiros para industrialização ou comercialização, que não tenham sido objeto de qualquer processo industrial, remetidas para armazém geral, depósito fechado ou outro, sem que haja retorno ao estabelecimento depositante.','\0','\0',1,1),(408,'6200','DEVOLUÇÕES DE COMPRAS PARA INDUSTRIALIZAÇÃO, COMERCIALIZAÇÃO OU ANULAÇÕES DE VALORES','S','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(409,'6201','Devolução de compra para industrialização','S','I','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de mercadorias adquiridas para serem utilizadas em processo de industrialização, cujas entradas tenham sido classificadas como “Compra para industrialização”.','\0','\0',1,1),(410,'6202','Devolução de compra para comercialização','S','I','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de mercadorias adquiridas para serem comercializadas, cujas entradas tenham sido classificadas como “Compra para comercialização”.','\0','\0',1,1),(411,'6205','Anulação de valor relativo a aquisição de serviço de comunicação','S','I','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as anulações correspondentes a valores faturados indevidamente, decorrentes das aquisições de serviços de comunicação.','\0','\0',1,1),(412,'6206','Anulação de valor relativo a aquisição de serviço de transporte','S','I','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as anulações correspondentes a valores faturados indevidamente, decorrentes das aquisições de serviços de transporte.','\0','\0',1,1),(413,'6207','Anulação de valor relativo à compra de energia elétrica','S','I','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as anulações correspondentes a valores faturados indevidamente, decorrentes da compra de energia elétrica.','\0','\0',1,1),(414,'6208','Devolução de mercadoria recebida em transferência para industrialização','S','I','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de mercadorias recebidas em transferência de outros estabelecimentos da mesma empresa, para serem utilizadas em processo de industrialização.','\0','\0',1,1),(415,'6209','Devolução de mercadoria recebida em transferência para comercialização','S','I','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de mercadorias recebidas em transferência de outro estabelecimento da mesma empresa, para serem comercializadas.','\0','\0',1,1),(416,'6210','Devolução de compra para utilização na prestação de serviço','S','I','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de mercadorias adquiridas para utilização na prestação de serviços, cujas entradas tenham sido classificadas no código “2.126 - Compra para utilização na prestação de serviço”.','\0','\0',1,1),(417,'6250','VENDAS DE ENERGIA ELÉTRICA','S','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(418,'6251','Venda de energia elétrica para distribuição ou comercialização','S','I','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de energia elétrica destinada à distribuição ou comercialização. Também serão classificadas neste código as vendas de energia elétrica destinada a cooperativas para distribuição aos seus cooperados.','\0','\0',1,1),(419,'6252','Venda de energia elétrica para estabelecimento industrial','S','I','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de energia elétrica para consumo por estabelecimento industrial. Também serão classificadas neste código as vendas de energia elétrica destinada a estabelecimento industrial de cooperativa.','\0','\0',1,1),(420,'6253','Venda de energia elétrica para estabelecimento comercial','S','I','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de energia elétrica para consumo por estabelecimento comercial. Também serão classificadas neste código as vendas de energia elétrica destinada a estabelecimento comercial de cooperativa.','\0','\0',1,1),(421,'6254','Venda de energia elétrica para estabelecimento prestador de serviço de transporte','S','I','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de energia elétrica para consumo por estabelecimento de prestador de serviços de transporte.','\0','\0',1,1),(422,'6255','Venda de energia elétrica para estabelecimento prestador de serviço de comunicação','S','I','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de energia elétrica para consumo por estabelecimento de prestador de serviços de comunicação.','\0','\0',1,1),(423,'6256','Venda de energia elétrica para estabelecimento de produtor rural','S','I','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de energia elétrica para consumo por estabelecimento de produtor rural.','\0','\0',1,1),(424,'6257','Venda de energia elétrica para consumo por demanda contratada','S','I','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de energia elétrica para consumo por demanda contratada, que prevalecerá sobre os demais códigos deste subgrupo.','\0','\0',1,1),(425,'6258','Venda de energia elétrica a não-contribuinte','S','I','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de energia elétrica a pessoas físicas ou a pessoas jurídicas não indicadas nos códigos anteriores.','\0','\0',1,1),(426,'6300','PRESTAÇÕES DE SERVIÇOS DE COMUNICAÇÃO','S','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(427,'6301','Prestação de serviço de comunicação para execução de serviço da mesma natureza','S','I','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as prestações de serviços de comunicação destinados às prestações de serviços da mesma natureza.','\0','\0',1,1),(428,'6302','Prestação de serviço de comunicação a estabelecimento industrial','S','I','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as prestações de serviços de comunicação a estabelecimento industrial. Também serão classificados neste código os serviços de comunicação prestados a estabelecimento industrial de cooperativa.','\0','\0',1,1),(429,'6303','Prestação de serviço de comunicação a estabelecimento comercial','S','I','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as prestações de serviços de comunicação a estabelecimento comercial. Também serão classificados neste código os serviços de comunicação prestados a estabelecimento comercial de cooperativa.','\0','\0',1,1),(430,'6304','Prestação de serviço de comunicação a estabelecimento de prestador de serviço de transporte','S','I','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as prestações de serviços de comunicação a estabelecimento prestador de serviço de transporte.','\0','\0',1,1),(431,'6305','Prestação de serviço de comunicação a estabelecimento de geradora ou de distribuidora de energia elétrica','S','I','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as prestações de serviços de comunicação a estabelecimento de geradora ou de distribuidora de energia elétrica.','\0','\0',1,1),(432,'6306','Prestação de serviço de comunicação a estabelecimento de produtor rural','S','I','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as prestações de serviços de comunicação a estabelecimento de produtor rural.','\0','\0',1,1),(433,'6307','Prestação de serviço de comunicação a não-contribuinte','S','I','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as prestações de serviços de comunicação a pessoas físicas ou a pessoas jurídicas não indicadas nos códigos anteriores.','\0','\0',1,1),(434,'6350','PRESTAÇÕES DE SERVIÇOS DE TRANSPORTE','S','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(435,'6351','Prestação de serviço de transporte para execução de serviço da mesma natureza','S','I','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as prestações de serviços de transporte destinados às prestações de serviços da mesma natureza.','\0','\0',1,1),(436,'6352','Prestação de serviço de transporte a estabelecimento industrial','S','I','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as prestações de serviços de transporte a estabelecimento industrial. Também serão classificados neste código os serviços de transporte prestados a estabelecimento industrial de cooperativa.','\0','\0',1,1),(437,'6353','Prestação de serviço de transporte a estabelecimento comercial','S','I','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as prestações de serviços de transporte a estabelecimento comercial. Também serão classificados neste código os serviços de transporte prestados a estabelecimento comercial de cooperativa.','\0','\0',1,1),(438,'6354','Prestação de serviço de transporte a estabelecimento de prestador de serviço de comunicação','S','I','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as prestações de serviços de transporte a estabelecimento prestador de serviços de comunicação.','\0','\0',1,1),(439,'6355','Prestação de serviço de transporte a estabelecimento de geradora ou de distribuidora de energia elétrica','S','I','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as prestações de serviços de transporte a estabelecimento de geradora ou de distribuidora de energia elétrica.','\0','\0',1,1),(440,'6356','Prestação de serviço de transporte a estabelecimento de produtor rural','S','I','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as prestações de serviços de transporte a estabelecimento de produtor rural.','\0','\0',1,1),(441,'6357','Prestação de serviço de transporte a não-contribuinte','S','I','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as prestações de serviços de transporte a pessoas físicas ou a pessoas jurídicas não indicadas nos códigos anteriores.','\0','\0',1,1),(442,'6400','SAÍDAS DE MERCADORIAS SUJEITAS AO REGIME DE SUBSTITUIÇÃO TRIBUTÁRIA','S','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(443,'6401','Venda de produção do estabelecimento em operação com produto sujeito ao regime de substituição tributária, na condição de contribuinte substituto','S','I','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de produtos industrializados no estabelecimento em operações com produtos sujeitos ao regime de substituição tributária, na condição de contribuinte substituto. Também serão classificadas neste código as vendas de produtos industrializados por estabelecimento industrial de cooperativa sujeitos ao regime de substituição tributária, na condição de contribuinte substituto.','\0','\0',1,1),(444,'6402','Venda de produção do estabelecimento de produto sujeito ao regime de substituição tributária, em operação entre contribuintes substitutos do mesmo produto','S','I','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de produtos sujeitos ao regime de substituição tributária industrializados no estabelecimento, em operações entre contribuintes substitutos do mesmo produto.','\0','\0',1,1),(445,'6403','Venda de mercadoria adquirida ou recebida de terceiros em operação com mercadoria sujeita ao regime de substituição tributária, na condição de contribuinte substituto','S','I','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de mercadorias adquiridas ou recebidas de terceiros, na condição de contribuinte substituto, em operação com mercadorias sujeitas ao regime de substituição tributária.','\0','\0',1,1),(446,'6404','Venda de mercadoria sujeita ao regime de substituição tributária, cujo imposto já tenha sido retido anteriormente','S','I','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de mercadorias sujeitas ao regime de substituição tributária, na condição de substituto tributário, exclusivamente nas hipóteses em que o imposto já tenha sido retido anteriormente.','\0','\0',1,1),(447,'6408','Transferência de produção do estabelecimento em operação com produto sujeito ao regime de substituição tributária','S','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código os produtos industrializados no estabelecimento e transferidos para outro estabelecimento da mesma empresa, em operações com produtos sujeitos ao regime de substituição tributária.','\0','\0',1,1),(448,'6409','Transferência de mercadoria adquirida ou recebida de terceiros em operação com mercadoria sujeita ao regime de substituição tributária','S','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as transferências para outro estabelecimento da mesma empresa, de mercadorias adquiridas ou recebidas de terceiros que não tenham sido objeto de qualquer processo industrial no estabelecimento, em operações com mercadorias sujeitas ao regime de substituição tributária.','\0','\0',1,1),(449,'6410','Devolução de compra para industrialização em operação com mercadoria sujeita ao regime de substituição tributária','S','I','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de mercadorias adquiridas para serem utilizadas em processo de industrialização cujas entradas tenham sido classificadas como “Compra para industrialização em operação com mercadoria sujeita ao regime de substituição tributária”.','\0','\0',1,1),(450,'6411','Devolução de compra para comercialização em operação com mercadoria sujeita ao regime de substituição tributária','S','I','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de mercadorias adquiridas para serem comercializadas, cujas entradas tenham sido classificadas como “Compra para comercialização em operação com mercadoria sujeita ao regime de substituição tributária”.','\0','\0',1,1),(451,'6412','Devolução de bem do ativo imobilizado, em operação com mercadoria sujeita ao regime de substituição tributária','S','I','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de bens adquiridos para integrar o ativo imobilizado do estabelecimento, cuja entrada tenha sido classificada no código “2.406 - Compra de bem para o ativo imobilizado cuja mercadoria está sujeita ao regime de substituição tributária”.','\0','\0',1,1),(452,'6413','Devolução de mercadoria destinada ao uso ou consumo, em operação com mercadoria sujeita ao regime de substituição tributária','S','I','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de mercadorias adquiridas para uso ou consumo do estabelecimento, cuja entrada tenha sido classificada no código “2.407 - Compra de mercadoria para uso ou consumo cuja mercadoria está sujeita ao regime de substituição tributária”.','\0','\0',1,1),(453,'6414','Remessa de produção do estabelecimento para venda fora do estabelecimento em operação com produto sujeito ao regime de substituição tributária','S','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as remessas de produtos industrializados pelo estabelecimento para serem vendidos fora do estabelecimento, inclusive por meio de veículos, em operações com produtos sujeitos ao regime de substituição tributária.','\0','\0',1,1),(454,'6415','Remessa de mercadoria adquirida ou recebida de terceiros para venda fora do estabelecimento, em operação com mercadoria sujeita ao regime de substituição tributária','S','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as remessas de mercadorias adquiridas ou recebidas de terceiros para serem vendidas fora do estabelecimento, inclusive por meio de veículos, em operações com mercadorias sujeitas ao regime de substituição tributária.','\0','\0',1,1),(455,'6500','REMESSAS COM FIM ESPECÍFICO DE EXPORTAÇÃO E EVENTUAIS DEVOLUÇÕES','S','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(456,'6501','Remessa de produção do estabelecimento, com fim específico de exportação','S','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as saídas de produtos industrializados pelo estabelecimento, remetidos com fim específico de exportação a “trading company”, empresa comercial exportadora ou outro estabelecimento do remetente.','\0','\0',1,1),(457,'6502','Remessa de mercadoria adquirida ou recebida de terceiros, com fim específico de exportação','S','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as saídas de mercadorias adquiridas ou recebidas de terceiros, remetidas com fim específico de exportação a “trading company”, empresa comercial exportadora ou outro estabelecimento do remetente.','\0','\0',1,1),(458,'6503','Devolução de mercadoria recebida com fim específico de exportação','S','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções efetuadas por “trading company”, empresa comercial exportadora ou outro estabelecimento do destinatário, de mercadorias recebidas com fim específico de exportação, cujas entradas tenham sido classificadas no código “2.501 - Entrada de mercadoria recebida com fim específico de exportação”.','\0','\0',1,1),(459,'6550','OPERAÇÕES COM BENS DE ATIVO IMOBILIZADO E MATERIAIS PARA USO OU CONSUMO','S','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(460,'6551','Venda de bem do ativo imobilizado','S','I','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de bens integrantes do ativo imobilizado do estabelecimento.','\0','\0',1,1),(461,'6552','Transferência de bem do ativo imobilizado','S','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código os bens do ativo imobilizado transferidos para outro estabelecimento da mesma empresa.','\0','\0',1,1),(462,'6553','Devolução de compra de bem para o ativo imobilizado','S','I','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de bens adquiridos para integrar o ativo imobilizado do estabelecimento, cuja entrada foi classificada no código “2.551 - Compra de bem para o ativo imobilizado”.','\0','\0',1,1),(463,'6554','Remessa de bem do ativo imobilizado para uso fora do estabelecimento','S','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as remessas de bens do ativo imobilizado para uso fora do estabelecimento.','\0','\0',1,1),(464,'6555','Devolução de bem do ativo imobilizado de terceiro, recebido para uso no estabelecimento','S','I','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as saídas em devolução, de bens do ativo imobilizado de terceiros, recebidos para uso no estabelecimento, cuja entrada tenha sido classificada no código “2.555 - Entrada de bem do ativo imobilizado de terceiro, remetido para uso no estabelecimento”.','\0','\0',1,1),(465,'6556','Devolução de compra de material de uso ou consumo','S','I','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de mercadorias destinadas ao uso ou consumo do estabelecimento, cuja entrada tenha sido classificada no código “2.556 - Compra de material para uso ou consumo”.','\0','\0',1,1),(466,'6557','Transferência de material de uso ou consumo','S','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código os materiais de uso ou consumo transferidos para outro estabelecimento da mesma empresa.','\0','\0',1,1),(467,'6600','CRÉDITOS E RESSARCIMENTOS DE ICMS','S','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(468,'6603','Ressarcimento de ICMS retido por substituição tributária','S','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código os lançamentos destinados ao registro de ressarcimento de ICMS retido por substituição tributária a contribuinte substituído, efetuado pelo contribuinte substituto, nas hipóteses previstas na legislação aplicável.','\0','\0',1,1),(469,'6900','OUTRAS SAÍDAS DE MERCADORIAS OU PRESTAÇÕES DE SERVIÇOS','S','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(470,'6901','Remessa para industrialização por encomenda','S','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as remessas de insumos remetidos para industrialização por encomenda, a ser realizada em outra empresa ou em outro estabelecimento da mesma empresa.','\0','\0',1,1),(471,'6902','Retorno de mercadoria utilizada na industrialização por encomenda','S','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as remessas, pelo estabelecimento industrializador, dos insumos recebidos para industrialização e incorporados ao produto final, por encomenda de outra empresa ou de outro estabelecimento da mesma empresa. O valor dos insumos nesta operação deverá ser igual ao valor dos insumos recebidos para industrialização.','\0','\0',1,1),(472,'6903','Retorno de mercadoria recebida para industrialização e não aplicada no referido processo','S','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as remessas em devolução de insumos recebidos para industrialização e não aplicados no referido processo.','\0','\0',1,1),(473,'6904','Remessa para venda fora do estabelecimento','S','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as remessas de mercadorias para venda fora do estabelecimento, inclusive por meio de veículos.','\0','\0',1,1),(474,'6905','Remessa para depósito fechado ou armazém geral','S','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as remessas de mercadorias para depósito em depósito fechado ou armazém geral.','\0','\0',1,1),(475,'6906','Retorno de mercadoria depositada em depósito fechado ou armazém geral','S','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código os retornos de mercadorias depositadas em depósito fechado ou armazém geral ao estabelecimento depositante.','\0','\0',1,1),(476,'6907','Retorno simbólico de mercadoria depositada em depósito fechado ou armazém geral','S','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código os retornos simbólicos de mercadorias recebidas para depósito em depósito fechado ou armazém geral, quando as mercadorias depositadas tenham sido objeto de saída a qualquer título e que não devam retornar ao estabelecimento depositante.','\0','\0',1,1),(477,'6908','Remessa de bem por conta de contrato de comodato','S','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as remessas de bens para o cumprimento de contrato de comodato.','\0','\0',1,1),(478,'6909','Retorno de bem recebido por conta de contrato de comodato','S','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as remessas de bens em devolução após cumprido o contrato de comodato.','\0','\0',1,1),(479,'6910','Remessa em bonificação, doação ou brinde','S','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as remessas de mercadorias a título de bonificação, doação ou brinde.','\0','\0',1,1),(480,'6911','Remessa de amostra grátis','S','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as remessas de mercadorias a título de amostra grátis.','\0','\0',1,1),(481,'6912','Remessa de mercadoria ou bem para demonstração','S','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as remessas de mercadorias ou bens para demonstração.','\0','\0',1,1),(482,'6913','Retorno de mercadoria ou bem recebido para demonstração','S','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as remessas em devolução de mercadorias ou bens recebidos para demonstração.','\0','\0',1,1),(483,'6914','Remessa de mercadoria ou bem para exposição ou feira','S','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as remessas de mercadorias ou bens para exposição ou feira.','\0','\0',1,1),(484,'6915','Remessa de mercadoria ou bem para conserto ou reparo','S','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as remessas de mercadorias ou bens para conserto ou reparo.','\0','\0',1,1),(485,'6916','Retorno de mercadoria ou bem recebido para conserto ou reparo','S','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as remessas em devolução de mercadorias ou bens recebidos para conserto ou reparo.','\0','\0',1,1),(486,'6917','Remessa de mercadoria em consignação mercantil ou industrial','S','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as remessas de mercadorias a título de consignação mercantil ou industrial.','\0','\0',1,1),(487,'6918','Devolução de mercadoria recebida em consignação mercantil ou industrial','S','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de mercadorias recebidas anteriormente a título de consignação mercantil ou industrial.','\0','\0',1,1),(488,'6919','Devolução simbólica de mercadoria vendida ou utilizada em processo industrial, recebida anteriormente em consignação mercantil ou industrial','S','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções simbólicas de mercadorias vendidas ou utilizadas em processo industrial, que tenham sido recebidas anteriormente a título de consignação mercantil ou industrial.','\0','\0',1,1),(489,'6920','Remessa de vasilhame ou sacaria','S','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as remessas de vasilhame ou sacaria.','\0','\0',1,1),(490,'6921','Devolução de vasilhame ou sacaria','S','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as saídas por devolução de vasilhame ou sacaria.','\0','\0',1,1),(491,'6922','Lançamento efetuado a título de simples faturamento decorrente de venda para entrega futura','S','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código os registros efetuados a título de simples faturamento decorrente de venda para entrega futura.','\0','\0',1,1),(492,'6923','Remessa de mercadoria por conta e ordem de terceiros, em venda à ordem','S','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as saídas correspondentes à entrega de mercadorias por conta e ordem de terceiros, em vendas à ordem, cuja venda ao adquirente originário, foi classificada nos códigos “6.118 - Venda de produção do estabelecimento entregue ao destinatário por conta e ordem do adquirente originário, em venda à ordem” ou “6.119 - Venda de mercadoria adquirida ou recebida de terceiros entregue ao destinatário por conta e ordem do adquirente originário, em venda à ordem”.','\0','\0',1,1),(493,'6924','Remessa para industrialização por conta e ordem do adquirente da mercadoria, quando esta não transitar pelo estabelecimento do adquirente','S','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as saídas de insumos com destino a estabelecimento industrializador, para serem industrializados por conta e ordem do adquirente, nas hipóteses em que os insumos não tenham transitado pelo estabelecimento do adquirente dos mesmos.','\0','\0',1,1),(494,'6925','Retorno de mercadoria recebida para industrialização por conta e ordem do adquirente da mercadoria, quando aquela não transitar pelo estabelecimento do adquirente','S','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as remessas, pelo estabelecimento industrializador, dos insumos recebidos, por conta e ordem do adquirente, para industrialização e incorporados ao produto final, nas hipóteses em que os insumos não tenham transitado pelo estabelecimento do adquirente. O valor dos insumos nesta operação deverá ser igual ao valor dos insumos recebidos para industrialização.','\0','\0',1,1),(495,'6929','Lançamento efetuado em decorrência de emissão de documento fiscal relativo a operação ou prestação também registrada em equipamento Emissor de Cupom Fiscal - ECF','S','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código os registros relativos aos documentos fiscais emitidos em operações ou prestações que também tenham sido registradas em equipamento Emissor de Cupom Fiscal - ECF.','\0','\0',1,1),(496,'6931','Lançamento efetuado em decorrência da respons. de retenção do imposto por subst. tributária, atribuída ao rem. ou alienante da merc., pelo serv. de transp. realizado por transp. autônomo ou por transp. não inscrito na UF onde iniciado o serviço','S','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código exclusivamente os lançamentos efetuados pelo remetente ou alienante da mercadoria quando lhe for atribuída a responsabilidade pelo recolhimento do imposto devido pelo serviço de transporte realizado por transportador autônomo ou por transportador não inscrito na unidade da Federação onde iniciado o serviço.','\0','\0',1,1),(497,'6932','Prestação de serviço de transporte iniciada em unidade da Federação diversa daquela onde inscrito o prestador','S','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as prestações de serviço de transporte que tenham sido iniciadas em unidade da Federação diversa daquela onde o prestador está inscrito como contribuinte.','\0','\0',1,1),(498,'6949','Outra saída de mercadoria ou prestação de serviço não especificado','S','I','N','\0','\0','PV','REM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as outras saídas de mercadorias ou prestações de serviços que não tenham sido especificados nos códigos anteriores.','\0','\0',1,1),(499,'7000','SAÍDAS OU PRESTAÇÕES DE SERVIÇOS PARA O EXTERIOR','S','X','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se, neste grupo, as operações ou prestações em que o destinatário esteja localizado em outro país. ','','\0',1,1),(500,'7100','VENDAS DE PRODUÇÃO PRÓPRIA OU DE TERCEIROS','S','X','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(501,'7101','Venda de produção do estabelecimento','S','X','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de produtos industrializados no estabelecimento. Também serão classificadas neste código as vendas de mercadorias por estabelecimento industrial de cooperativa.','\0','\0',1,1),(502,'7102','Venda de mercadoria adquirida ou recebida de terceiros','S','X','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de mercadorias adquiridas ou recebidas de terceiros para industrialização ou comercialização, que não tenham sido objeto de qualquer processo industrial no estabelecimento. Também serão classificadas neste código as vendas de mercadorias por estabelecimento comercial de cooperativa.','\0','\0',1,1),(503,'7105','Venda de produção do estabelecimento, que não deva por ele transitar','S','X','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de produtos industrializados no estabelecimento, armazenados em depósito fechado, armazém geral ou outro sem que haja retorno ao estabelecimento depositante.','\0','\0',1,1),(504,'7106','Venda de mercadoria adquirida ou recebida de terceiros, que não deva por ele transitar','S','X','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de mercadorias adquiridas ou recebidas de terceiros para industrialização ou comercialização, armazenadas em depósito fechado, armazém geral ou outro, que não tenham sido objeto de qualquer processo industrial no estabelecimento sem que haja retorno ao estabelecimento depositante. Também serão classificadas neste código as vendas de mercadorias importadas, cuja saída ocorra do recinto alfandegado ou da repartição alfandegária onde se processou o desembaraço aduaneiro, com destino ao estabelecimento do comprador, sem transitar pelo estabelecimento do importador.','\0','\0',1,1),(505,'7127','Venda de produção do estabelecimento sob o regime de “drawback”','S','X','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de produtos industrializados no estabelecimento sob o regime de “drawback”, cujas compras foram classificadas no código “3.127 - Compra para industrialização sob o regime de “drawback””.','\0','\0',1,1),(506,'7200','DEVOLUÇÕES DE COMPRAS PARA INDUSTRIALIZAÇÃO, COMERCIALIZAÇÃO OU ANULAÇÕES DE VALORES','S','X','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(507,'7201','Devolução de compra para industrialização','S','X','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de mercadorias adquiridas para serem utilizadas em processo de industrialização, cujas entradas tenham sido classificadas como “Compra para industrialização”.','\0','\0',1,1),(508,'7202','Devolução de compra para comercialização','S','X','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de mercadorias adquiridas para serem comercializadas, cujas entradas tenham sido classificadas como “Compra para comercialização”.','\0','\0',1,1),(509,'7205','Anulação de valor relativo à aquisição de serviço de comunicação','S','X','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as anulações correspondentes a valores faturados indevidamente, decorrentes das aquisições de serviços de comunicação.','\0','\0',1,1),(510,'7206','Anulação de valor relativo a aquisição de serviço de transporte','S','X','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as anulações correspondentes a valores faturados indevidamente, decorrentes das aquisições de serviços de transporte.','\0','\0',1,1),(511,'7207','Anulação de valor relativo à compra de energia elétrica','S','X','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as anulações correspondentes a valores faturados indevidamente, decorrentes da compra de energia elétrica.','\0','\0',1,1),(512,'7210','Devolução de compra para utilização na prestação de serviço','S','X','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de mercadorias adquiridas para utilização na prestação de serviços, cujas entradas tenham sido classificadas no código “3.126 - Compra para utilização na prestação de serviço”.','\0','\0',1,1),(513,'7211','Devolução de compras para industrialização sob o regime de “drawback”','S','X','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de mercadorias adquiridas para serem utilizadas em processo de industrialização sob o regime de “drawback” e não utilizadas no referido processo, cujas entradas tenham sido classificadas no código “3.127 - Compra para industrialização sob o regime de “drawback””.','\0','\0',1,1),(514,'7250','VENDAS DE ENERGIA ELÉTRICA','S','X','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(515,'7251','Venda de energia elétrica para o exterior','S','X','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de energia elétrica para o exterior.','\0','\0',1,1),(516,'7300','PRESTAÇÕES DE SERVIÇOS DE COMUNICAÇÃO','S','X','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(517,'7301','Prestação de serviço de comunicação para execução de serviço da mesma natureza','S','X','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as prestações de serviços de comunicação destinados às prestações de serviços da mesma natureza.','\0','\0',1,1),(518,'7350','PRESTAÇÕES DE SERVIÇO DE TRANSPORTE','S','X','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(519,'7358','Prestação de serviço de transporte','S','X','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as prestações de serviços de transporte destinado a estabelecimento no exterior.','\0','\0',1,1),(520,'7500','EXPORTAÇÃO DE MERCADORIAS RECEBIDAS COM FIM ESPECÍFICO DE EXPORTAÇÃO','S','X','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(521,'7501','Exportação de mercadorias recebidas com fim específico de exportação','S','X','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as exportações das mercadorias recebidas anteriormente com finalidade específica de exportação, cujas entradas tenham sido classificadas nos códigos “1.501 - Entrada de mercadoria recebida com fim específico de exportação” ou “2.501 - Entrada de mercadoria recebida com fim específico de exportação”.','\0','\0',1,1),(522,'7550','OPERAÇÕES COM BENS DE ATIVO IMOBILIZADO E MATERIAIS PARA USO OU CONSUMO','S','X','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(523,'7551','Venda de bem do ativo imobilizado','S','X','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as vendas de bens integrantes do ativo imobilizado do estabelecimento.','\0','\0',1,1),(524,'7553','Devolução de compra de bem para o ativo imobilizado','S','X','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de bens adquiridos para integrar o ativo imobilizado do estabelecimento, cuja entrada foi classificada no código “3.551 - Compra de bem para o ativo imobilizado”.','\0','\0',1,1),(525,'7556','Devolução de compra de material de uso ou consumo','S','X','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as devoluções de mercadorias destinadas ao uso ou consumo do estabelecimento, cuja entrada tenha sido classificada no código “3.556 - Compra de material para uso ou consumo”.','\0','\0',1,1),(526,'7900','OUTRAS SAÍDAS DE MERCADORIAS OU PRESTAÇÕES DE SERVIÇOS','S','X','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'','\0',1,1),(527,'7930','Lançamento efetuado a título de devolução de bem cuja entrada tenha ocorrido sob amparo de regime especial aduaneiro de admissão temporária','S','X','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código os lançamentos efetuados a título de saída em devolução de bens cuja entrada tenha ocorrido sob amparo de regime especial aduaneiro de admissão temporária.','\0','\0',1,1),(528,'7949','Outra saída de mercadoria ou prestação de serviço não especificado','S','X','N','\0','\0','PV','DEV','\0','\0','\0','\0','\0','\0','\0',NULL,'Classificam-se neste código as outras saídas de mercadorias ou prestações de serviços que não tenham sido especificados nos códigos anteriores.','\0','\0',1,1),(529,'5124','Retorno de Mão de Obra / Industrialização','S','E','N','\0','\0','PV','COM','\0','\0','\0','\0','\0','\0','\0',NULL,'PROVISÓRIO','\0','\0',1,1),(530,'5667','Venda de combustível ou lubrificante a consumidor ou usuário final estabelecido em outra unidade da Federação','S','E','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'\0','\0',1,1),(531,'6667','Venda de combustível ou lubrificante a consumidor ou usuário final estabelecido em outra unidade da Federação diferente da que ocorrer o consumo','S','I','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'\0','\0',1,1),(532,'7667','Venda de combustível ou lubrificante a consumidor ou usuário final','S','X','N','\0','\0','PV','OUT','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,'\0','\0',1,1);
/*!40000 ALTER TABLE `cfop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id` bigint(20) NOT NULL,
  `retem_iss` bit(1) NOT NULL DEFAULT b'0',
  `retem_pis` bit(1) NOT NULL DEFAULT b'0',
  `retem_cofins` bit(1) NOT NULL DEFAULT b'0',
  `iss_sede_cliente` bit(1) NOT NULL DEFAULT b'0',
  `id_categoria` int(11) DEFAULT NULL,
  `id_vendedor` bigint(20) DEFAULT NULL,
  `id_empresa` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Cliente_Vendedor` (`id_vendedor`),
  KEY `Cliente_CategoriaCliente` (`id_categoria`),
  KEY `Cliente_Empresa` (`id_empresa`),
  CONSTRAINT `Cliente_CategoriaCliente` FOREIGN KEY (`id_categoria`) REFERENCES `categoriacliente` (`id`),
  CONSTRAINT `Cliente_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`),
  CONSTRAINT `Cliente_Pessoa` FOREIGN KEY (`id`) REFERENCES `pessoa` (`id`),
  CONSTRAINT `Cliente_Vendedor` FOREIGN KEY (`id_vendedor`) REFERENCES `vendedor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coletakmhora`
--

DROP TABLE IF EXISTS `coletakmhora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coletakmhora` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data_hora` datetime DEFAULT NULL,
  `kmhora` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coletakmhora`
--

LOCK TABLES `coletakmhora` WRITE;
/*!40000 ALTER TABLE `coletakmhora` DISABLE KEYS */;
/*!40000 ALTER TABLE `coletakmhora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comissao`
--

DROP TABLE IF EXISTS `comissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comissao` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_funcionario` bigint(20) NOT NULL,
  `data` datetime NOT NULL,
  `valor` float DEFAULT NULL,
  `credito_debito` char(1) NOT NULL,
  `comentario` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Comissao_Funcionario` (`id_funcionario`),
  CONSTRAINT `comissao_ibfk_1` FOREIGN KEY (`id_funcionario`) REFERENCES `pessoa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comissao`
--

LOCK TABLES `comissao` WRITE;
/*!40000 ALTER TABLE `comissao` DISABLE KEYS */;
/*!40000 ALTER TABLE `comissao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concorrente`
--

DROP TABLE IF EXISTS `concorrente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concorrente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` char(255) DEFAULT NULL,
  `ativo` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concorrente`
--

LOCK TABLES `concorrente` WRITE;
/*!40000 ALTER TABLE `concorrente` DISABLE KEYS */;
/*!40000 ALTER TABLE `concorrente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `condicaopagto`
--

DROP TABLE IF EXISTS `condicaopagto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `condicaopagto` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `id_empresa` bigint(20) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `tipo_titulo` char(4) NOT NULL,
  `entrada` bit(1) NOT NULL DEFAULT b'0',
  `n_parcelas` int(11) DEFAULT NULL,
  `custo_operacao` float DEFAULT NULL,
  `custo_financeiro` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `CondicaoPagto_Empresa` (`id_empresa`),
  CONSTRAINT `CondicaoPagto_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `condicaopagto`
--

LOCK TABLES `condicaopagto` WRITE;
/*!40000 ALTER TABLE `condicaopagto` DISABLE KEYS */;
/*!40000 ALTER TABLE `condicaopagto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conf_natureza`
--

DROP TABLE IF EXISTS `conf_natureza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conf_natureza` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` bigint(20) NOT NULL,
  `cmv` bigint(20) DEFAULT NULL,
  `ajusteestoque` bigint(20) DEFAULT NULL,
  `emprestimo_adiantamento_recebimento` bigint(20) DEFAULT NULL,
  `emprestimo_adiantamento_pagamento` bigint(20) DEFAULT NULL,
  `simples_nacional` bigint(20) DEFAULT NULL,
  `iss` bigint(20) DEFAULT NULL,
  `iss_retido` bigint(20) DEFAULT NULL,
  `icms` bigint(20) DEFAULT NULL,
  `ipi` bigint(20) DEFAULT NULL,
  `pis` bigint(20) DEFAULT NULL,
  `cofins` bigint(20) DEFAULT NULL,
  `csl` bigint(20) DEFAULT NULL,
  `irpj` bigint(20) DEFAULT NULL,
  `receita_detalhar` bigint(20) DEFAULT NULL,
  `despesa_detalhar` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ConfNatureza_Empresa` (`id_empresa`),
  CONSTRAINT `ConfNatureza_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conf_natureza`
--

LOCK TABLES `conf_natureza` WRITE;
/*!40000 ALTER TABLE `conf_natureza` DISABLE KEYS */;
INSERT INTO `conf_natureza` VALUES (1,1,71,72,65,64,73,74,75,76,77,78,79,80,81,84,85);
/*!40000 ALTER TABLE `conf_natureza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conf_nfe`
--

DROP TABLE IF EXISTS `conf_nfe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conf_nfe` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_empresa` bigint(20) NOT NULL,
  `num_prox_nota` bigint(20) DEFAULT NULL,
  `num_versao` float DEFAULT NULL,
  `num_serie` bigint(20) DEFAULT NULL,
  `dados_adicionais` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Conf_nfe_Empresa` (`id_empresa`),
  CONSTRAINT `Conf_nfe_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conf_nfe`
--

LOCK TABLES `conf_nfe` WRITE;
/*!40000 ALTER TABLE `conf_nfe` DISABLE KEYS */;
/*!40000 ALTER TABLE `conf_nfe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conf_nfse`
--

DROP TABLE IF EXISTS `conf_nfse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conf_nfse` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_empresa` bigint(20) NOT NULL,
  `num_lote` bigint(20) DEFAULT NULL,
  `num_rps` bigint(20) DEFAULT NULL,
  `num_serie` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Conf_nfse_Empresa` (`id_empresa`),
  CONSTRAINT `Conf_nfse_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conf_nfse`
--

LOCK TABLES `conf_nfse` WRITE;
/*!40000 ALTER TABLE `conf_nfse` DISABLE KEYS */;
/*!40000 ALTER TABLE `conf_nfse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conffaturamento`
--

DROP TABLE IF EXISTS `conffaturamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conffaturamento` (
  `id_empresa` bigint(20) NOT NULL,
  `agrupamento` bit(1) DEFAULT NULL,
  `id_servico` bigint(20) NOT NULL,
  PRIMARY KEY (`id_empresa`),
  KEY `FK_conffaturamento_Servico` (`id_servico`),
  KEY `FK_conffaturamento_Empresa` (`id_empresa`),
  CONSTRAINT `FK_conffaturamento_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`),
  CONSTRAINT `FK_conffaturamento_Servico` FOREIGN KEY (`id_servico`) REFERENCES `servico` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conffaturamento`
--

LOCK TABLES `conffaturamento` WRITE;
/*!40000 ALTER TABLE `conffaturamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `conffaturamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_contrato`
--

DROP TABLE IF EXISTS `config_contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_contrato` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_empresa` bigint(20) NOT NULL,
  `id_cobranca` int(11) NOT NULL,
  `dia_vencto` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_config_contrato_Empresa` (`id_empresa`),
  KEY `FK_config_contrato_configuracaofinanceiro` (`id_cobranca`),
  CONSTRAINT `FK_config_contrato_ConfigCobranca` FOREIGN KEY (`id_cobranca`) REFERENCES `configcobranca` (`id`),
  CONSTRAINT `FK_config_contrato_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_contrato`
--

LOCK TABLES `config_contrato` WRITE;
/*!40000 ALTER TABLE `config_contrato` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_contrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_entrada`
--

DROP TABLE IF EXISTS `config_entrada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_entrada` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` bigint(20) NOT NULL,
  `metodo_atualizacao_preco` char(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Config_Fatura_Empresa` (`id_empresa`),
  CONSTRAINT `FK_Config_Fatura_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_entrada`
--

LOCK TABLES `config_entrada` WRITE;
/*!40000 ALTER TABLE `config_entrada` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_entrada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_ordemservico`
--

DROP TABLE IF EXISTS `config_ordemservico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_ordemservico` (
  `id_empresa` bigint(20) NOT NULL,
  `valores_os` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_empresa`),
  KEY `FK_config_ordemservico_Empresa` (`id_empresa`),
  CONSTRAINT `FK_config_ordemservico_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_ordemservico`
--

LOCK TABLES `config_ordemservico` WRITE;
/*!40000 ALTER TABLE `config_ordemservico` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_ordemservico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configcobranca`
--

DROP TABLE IF EXISTS `configcobranca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configcobranca` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_conta` int(11) NOT NULL,
  `id_carteira` int(11) NOT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  `instrucao1` varchar(200) DEFAULT NULL,
  `instrucao2` varchar(200) DEFAULT NULL,
  `instrucao3` varchar(200) DEFAULT NULL,
  `juros` float DEFAULT NULL,
  `multa` float DEFAULT NULL,
  `diasprotesto` int(11) DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT NULL,
  `mensagem` varchar(200) DEFAULT NULL,
  `demonstrativo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ConfigCobranca_ContaBanco` (`id_conta`),
  KEY `FK_ConfigCobranca_Carteira` (`id_carteira`),
  CONSTRAINT `FK_ConfigCobranca_Carteira` FOREIGN KEY (`id_carteira`) REFERENCES `carteira` (`id`),
  CONSTRAINT `FK_ConfigCobranca_ContaBanco` FOREIGN KEY (`id_conta`) REFERENCES `contabanco` (`id_conta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configcobranca`
--

LOCK TABLES `configcobranca` WRITE;
/*!40000 ALTER TABLE `configcobranca` DISABLE KEYS */;
/*!40000 ALTER TABLE `configcobranca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configproposta`
--

DROP TABLE IF EXISTS `configproposta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configproposta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_empresa` bigint(20) NOT NULL,
  `analise_preco_alcada` bit(1) NOT NULL DEFAULT b'0',
  `analise_credito` bit(1) NOT NULL DEFAULT b'0',
  `analise_credito_inadimplente` bit(1) NOT NULL DEFAULT b'0',
  `valor_analise_credito_adimplente` float DEFAULT NULL,
  `formalizacao_contrato` varchar(15) DEFAULT NULL,
  `id_unidade_estoque_venda` bigint(20) DEFAULT NULL,
  `id_unidade_estoque_locacao` bigint(20) DEFAULT NULL,
  `analise_credito_adimplente` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Configproposta_Empresa` (`id_empresa`),
  KEY `FK_Configproposta_Unidadeestoque` (`id_unidade_estoque_venda`),
  KEY `FK_Configproposta_UnidadeestoqueLocacao` (`id_unidade_estoque_locacao`),
  CONSTRAINT `FK_Configproposta_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`),
  CONSTRAINT `FK_Configproposta_Unidadeestoque` FOREIGN KEY (`id_unidade_estoque_venda`) REFERENCES `unidadeestoque` (`id`),
  CONSTRAINT `FK_Configproposta_UnidadeestoqueLocacao` FOREIGN KEY (`id_unidade_estoque_locacao`) REFERENCES `unidadeestoque` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configproposta`
--

LOCK TABLES `configproposta` WRITE;
/*!40000 ALTER TABLE `configproposta` DISABLE KEYS */;
INSERT INTO `configproposta` VALUES (1,1,'\0','\0','\0',0,'ordemservico',1,2,'\0');
/*!40000 ALTER TABLE `configproposta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuracaofinanceiro`
--

DROP TABLE IF EXISTS `configuracaofinanceiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuracaofinanceiro` (
  `id` tinyint(4) NOT NULL,
  `perc_juro_atraso` float NOT NULL DEFAULT '0',
  `perc_multa_atraso` float NOT NULL DEFAULT '0',
  `perc_desconto_vp` float NOT NULL DEFAULT '0',
  `id_empresa` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ConfiguracaoFinanceiro_Empresa` (`id_empresa`),
  CONSTRAINT `configuracaofinanceiro_ibfk_1` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuracaofinanceiro`
--

LOCK TABLES `configuracaofinanceiro` WRITE;
/*!40000 ALTER TABLE `configuracaofinanceiro` DISABLE KEYS */;
INSERT INTO `configuracaofinanceiro` VALUES (1,2,0,0,NULL);
/*!40000 ALTER TABLE `configuracaofinanceiro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conta`
--

DROP TABLE IF EXISTS `conta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conta` (
  `id_conta` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `id_empresa` bigint(20) NOT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  `saldo_real` float NOT NULL,
  `discr` varchar(100) DEFAULT NULL,
  `ativa` bit(1) DEFAULT NULL,
  `saldo_conciliado` float NOT NULL DEFAULT '0',
  `sistema` bit(1) NOT NULL DEFAULT b'0',
  `ultimo_fechamento` datetime DEFAULT NULL,
  PRIMARY KEY (`id_conta`),
  KEY `FK_Conta_Empresa` (`id_empresa`),
  CONSTRAINT `FK_Conta_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conta`
--

LOCK TABLES `conta` WRITE;
/*!40000 ALTER TABLE `conta` DISABLE KEYS */;
INSERT INTO `conta` VALUES (1,'Caixa geral',1,'caixa',0,'contacaixa','',0,'',NULL);
/*!40000 ALTER TABLE `conta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conta_alarme`
--

DROP TABLE IF EXISTS `conta_alarme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conta_alarme` (
  `id` bigint(20) NOT NULL,
  `batente` varchar(10) DEFAULT NULL,
  `id_endereco` bigint(20) DEFAULT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `id_simcard` bigint(20) DEFAULT NULL,
  `telefone` varchar(18) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ContaAlarme_Endereco` (`id_endereco`),
  KEY `FK_ContaAlarme_Simcard` (`id_simcard`),
  CONSTRAINT `FK_ContaAlarme_Endereco` FOREIGN KEY (`id_endereco`) REFERENCES `endereco` (`id`),
  CONSTRAINT `FK_ContaAlarme_Simcard` FOREIGN KEY (`id_simcard`) REFERENCES `simcard` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conta_alarme`
--

LOCK TABLES `conta_alarme` WRITE;
/*!40000 ALTER TABLE `conta_alarme` DISABLE KEYS */;
/*!40000 ALTER TABLE `conta_alarme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conta_contrato`
--

DROP TABLE IF EXISTS `conta_contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conta_contrato` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data_entrada` datetime DEFAULT NULL,
  `id_contrato` bigint(20) DEFAULT NULL,
  `id_aditivo` bigint(20) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `data_saida` datetime DEFAULT NULL,
  `discr` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ContaContrato_Contrato` (`id_contrato`),
  KEY `FK_ContaContrato_Aditivo` (`id_aditivo`),
  CONSTRAINT `FK_ContaContrato_Aditivo` FOREIGN KEY (`id_aditivo`) REFERENCES `aditivo` (`id`),
  CONSTRAINT `FK_ContaContrato_Contrato` FOREIGN KEY (`id_contrato`) REFERENCES `contrato` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conta_contrato`
--

LOCK TABLES `conta_contrato` WRITE;
/*!40000 ALTER TABLE `conta_contrato` DISABLE KEYS */;
/*!40000 ALTER TABLE `conta_contrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conta_veiculo`
--

DROP TABLE IF EXISTS `conta_veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conta_veiculo` (
  `id` bigint(20) NOT NULL,
  `placa` varchar(8) DEFAULT NULL,
  `marca` varchar(45) DEFAULT NULL,
  `modelo` varchar(45) DEFAULT NULL,
  `ano` varchar(4) DEFAULT NULL,
  `cor` varchar(45) DEFAULT NULL,
  `renavam` varchar(25) DEFAULT NULL,
  `id_simcard` bigint(20) DEFAULT NULL,
  `imei` varchar(15) DEFAULT NULL,
  `descricao` varchar(256) DEFAULT NULL,
  `fabricante` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ContaVeiculo_Simcard` (`id_simcard`),
  CONSTRAINT `FK_ContaVeiculo_Simcard` FOREIGN KEY (`id_simcard`) REFERENCES `simcard` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conta_veiculo`
--

LOCK TABLES `conta_veiculo` WRITE;
/*!40000 ALTER TABLE `conta_veiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `conta_veiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contabanco`
--

DROP TABLE IF EXISTS `contabanco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contabanco` (
  `id_conta` int(11) NOT NULL AUTO_INCREMENT,
  `agencia` varchar(15) DEFAULT NULL,
  `conta_corrente` varchar(20) DEFAULT NULL,
  `dac_agencia` char(2) DEFAULT NULL,
  `dac_conta_corrente` char(2) DEFAULT NULL,
  `nosso_numero` varchar(20) DEFAULT NULL,
  `num_banco` char(3) DEFAULT NULL,
  `numsequencialremessa` int(11) DEFAULT NULL,
  `numsequencialboleto` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_conta`),
  KEY `FK_ContaBanco_Conta` (`id_conta`),
  CONSTRAINT `FK_ContaBanco_Conta` FOREIGN KEY (`id_conta`) REFERENCES `conta` (`id_conta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contabanco`
--

LOCK TABLES `contabanco` WRITE;
/*!40000 ALTER TABLE `contabanco` DISABLE KEYS */;
/*!40000 ALTER TABLE `contabanco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacaixa`
--

DROP TABLE IF EXISTS `contacaixa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacaixa` (
  `id_conta` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_conta`),
  KEY `FK_ContaCaixa_Conta` (`id_conta`),
  CONSTRAINT `FK_ContaCaixa_Conta` FOREIGN KEY (`id_conta`) REFERENCES `conta` (`id_conta`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacaixa`
--

LOCK TABLES `contacaixa` WRITE;
/*!40000 ALTER TABLE `contacaixa` DISABLE KEYS */;
INSERT INTO `contacaixa` VALUES (1);
/*!40000 ALTER TABLE `contacaixa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contato`
--

DROP TABLE IF EXISTS `contato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(256) NOT NULL,
  `telefone` varchar(18) DEFAULT NULL,
  `email` varchar(500) DEFAULT NULL,
  `recebe_nf` bit(1) NOT NULL DEFAULT b'0',
  `recebe_cobranca` bit(1) NOT NULL DEFAULT b'0',
  `id_gestor` bigint(20) DEFAULT NULL,
  `cargo` varchar(40) DEFAULT NULL,
  `id_nextel` varchar(40) DEFAULT NULL,
  `celular` varchar(18) DEFAULT NULL,
  `data_nascimento` datetime DEFAULT NULL,
  `outros` varchar(255) DEFAULT NULL,
  `permissao_abriros` bit(1) DEFAULT NULL,
  `permissao_autorizarorcamento` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contato`
--

LOCK TABLES `contato` WRITE;
/*!40000 ALTER TABLE `contato` DISABLE KEYS */;
/*!40000 ALTER TABLE `contato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contatopessoa`
--

DROP TABLE IF EXISTS `contatopessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contatopessoa` (
  `id_pessoa` bigint(20) NOT NULL,
  `id_contato` int(11) NOT NULL,
  PRIMARY KEY (`id_pessoa`,`id_contato`),
  KEY `ContatoPessoa_Contato` (`id_contato`),
  CONSTRAINT `ContatoPessoa_Contato` FOREIGN KEY (`id_contato`) REFERENCES `contato` (`id`),
  CONSTRAINT `ContatoPessoa_Pessoa` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contatopessoa`
--

LOCK TABLES `contatopessoa` WRITE;
/*!40000 ALTER TABLE `contatopessoa` DISABLE KEYS */;
/*!40000 ALTER TABLE `contatopessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contextotag`
--

DROP TABLE IF EXISTS `contextotag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contextotag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_os` bigint(20) DEFAULT NULL,
  `tag_item` bigint(20) DEFAULT NULL,
  `tag_cliente` bigint(20) DEFAULT NULL,
  `tag_titulo` bigint(20) DEFAULT NULL,
  `tag_fornecedor` bigint(20) DEFAULT NULL,
  `tag_funcionario` bigint(20) DEFAULT NULL,
  `tag_vendedor` bigint(20) DEFAULT NULL,
  `tag_motorista` bigint(20) DEFAULT NULL,
  `tag_os_instalacao` bigint(20) DEFAULT NULL,
  `tag_lead` bigint(20) DEFAULT NULL,
  `tag_proposta` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contextotag`
--

LOCK TABLES `contextotag` WRITE;
/*!40000 ALTER TABLE `contextotag` DISABLE KEYS */;
INSERT INTO `contextotag` VALUES (1,-1,-2,-3,-4,-5,-6,-7,-8,-9,-10,-11);
/*!40000 ALTER TABLE `contextotag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contrato`
--

DROP TABLE IF EXISTS `contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contrato` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_cliente` bigint(20) DEFAULT NULL,
  `id_empresa` bigint(20) DEFAULT NULL,
  `id_indice` int(11) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `dia_vencto` int(11) DEFAULT NULL,
  `status` char(2) DEFAULT NULL,
  `prox_reajuste` datetime DEFAULT NULL,
  `id_unidade_negocio` int(11) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `observacao` varchar(255) DEFAULT NULL,
  `periodicidade_manut_prev` int(11) DEFAULT NULL,
  `num_manut_corretiva` int(11) DEFAULT NULL,
  `id_configcobranca` int(11) DEFAULT NULL,
  `id_gestor` bigint(20) DEFAULT NULL,
  `cobranca` char(1) DEFAULT NULL,
  `numero_contrato` varchar(15) DEFAULT NULL,
  `id_tipo_contrato` int(11) DEFAULT NULL,
  `pre_pos` char(3) NOT NULL,
  `carteira_banco_cartao` char(2) NOT NULL,
  `dados_adicionais` varchar(1500) DEFAULT NULL,
  `formalizar` tinyint(1) DEFAULT NULL,
  `detalhe_agrupa` char(1) DEFAULT 'D',
  `id_modelo_contrato` int(11) DEFAULT NULL,
  `id_cartao_credito` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Contrato_Cliente` (`id_cliente`),
  KEY `FK_Contrato_Empresa` (`id_empresa`),
  KEY `FK_Contrato_UnidadeNegocio` (`id_unidade_negocio`),
  KEY `FK_Contrato_ConfigCobranca` (`id_configcobranca`),
  KEY `FK_Contrato_Indice` (`id_indice`),
  KEY `FK_Contrato_Tipo_contrato` (`id_tipo_contrato`),
  KEY `FK_Contrato_ModeloContrato` (`id_modelo_contrato`),
  KEY `FK_Contrato_CartaoCredito` (`id_cartao_credito`),
  CONSTRAINT `FK_Contrato_CartaoCredito` FOREIGN KEY (`id_cartao_credito`) REFERENCES `cartaocredito` (`id_conta`),
  CONSTRAINT `FK_Contrato_Cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`),
  CONSTRAINT `FK_Contrato_ConfigCobranca` FOREIGN KEY (`id_configcobranca`) REFERENCES `configcobranca` (`id`),
  CONSTRAINT `FK_Contrato_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`),
  CONSTRAINT `FK_Contrato_Indice` FOREIGN KEY (`id_indice`) REFERENCES `gw_global`.`gw_indice` (`id`),
  CONSTRAINT `FK_Contrato_ModeloContrato` FOREIGN KEY (`id_modelo_contrato`) REFERENCES `modelocontrato` (`id`),
  CONSTRAINT `FK_Contrato_Tipo_contrato` FOREIGN KEY (`id_tipo_contrato`) REFERENCES `tipo_contrato` (`id`),
  CONSTRAINT `FK_Contrato_UnidadeNegocio` FOREIGN KEY (`id_unidade_negocio`) REFERENCES `unidadenegocio` (`id_unidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contrato`
--

LOCK TABLES `contrato` WRITE;
/*!40000 ALTER TABLE `contrato` DISABLE KEYS */;
/*!40000 ALTER TABLE `contrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `convidadoscotacao`
--

DROP TABLE IF EXISTS `convidadoscotacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `convidadoscotacao` (
  `id_cotacao` bigint(20) NOT NULL,
  `id_fornecedor` bigint(20) NOT NULL,
  PRIMARY KEY (`id_cotacao`,`id_fornecedor`),
  KEY `FK_ConvidadosCotacao_Fornecedor` (`id_fornecedor`),
  CONSTRAINT `FK_ConvidadosCotacao_Cotacao` FOREIGN KEY (`id_cotacao`) REFERENCES `cotacao` (`id`),
  CONSTRAINT `FK_ConvidadosCotacao_Fornecedor` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `convidadoscotacao`
--

LOCK TABLES `convidadoscotacao` WRITE;
/*!40000 ALTER TABLE `convidadoscotacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `convidadoscotacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cotacao`
--

DROP TABLE IF EXISTS `cotacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cotacao` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data` datetime DEFAULT NULL,
  `id_empresa` bigint(20) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `descricao` varchar(500) DEFAULT NULL,
  `prazo_entrega` int(11) DEFAULT NULL,
  `valor_frete` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Cotacao_Empresa` (`id_empresa`),
  CONSTRAINT `FK_Cotacao_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cotacao`
--

LOCK TABLES `cotacao` WRITE;
/*!40000 ALTER TABLE `cotacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `cotacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cotacaofornecedor`
--

DROP TABLE IF EXISTS `cotacaofornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cotacaofornecedor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_cotacao` bigint(20) DEFAULT NULL,
  `id_fornecedor` bigint(20) DEFAULT NULL,
  `finalizada` bit(1) DEFAULT NULL,
  `prazo_entrega` int(11) DEFAULT NULL,
  `condicao_pagamento` varchar(40) DEFAULT NULL,
  `valor_frete` float DEFAULT NULL,
  `outras_despesas` float DEFAULT NULL,
  `comentario` char(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_CotacaoFornecedor_Cotacao` (`id_cotacao`),
  KEY `FK_CotacaoFornecedor_Fornecedor` (`id_fornecedor`),
  CONSTRAINT `FK_CotacaoFornecedor_Cotacao` FOREIGN KEY (`id_cotacao`) REFERENCES `cotacao` (`id`),
  CONSTRAINT `FK_CotacaoFornecedor_Fornecedor` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cotacaofornecedor`
--

LOCK TABLES `cotacaofornecedor` WRITE;
/*!40000 ALTER TABLE `cotacaofornecedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `cotacaofornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custo_instalacao`
--

DROP TABLE IF EXISTS `custo_instalacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custo_instalacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `custo` varchar(18) DEFAULT NULL,
  `id_servico` bigint(20) DEFAULT NULL,
  `id_empresa` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_CustoInstalacao_Servico` (`id_servico`),
  KEY `FK_CustoInstalacao_Empresa` (`id_empresa`),
  CONSTRAINT `FK_CustoInstalacao_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`),
  CONSTRAINT `FK_CustoInstalacao_Servico` FOREIGN KEY (`id_servico`) REFERENCES `servico` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custo_instalacao`
--

LOCK TABLES `custo_instalacao` WRITE;
/*!40000 ALTER TABLE `custo_instalacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `custo_instalacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devolucao_os`
--

DROP TABLE IF EXISTS `devolucao_os`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devolucao_os` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` datetime DEFAULT NULL,
  `id_empresa` bigint(20) NOT NULL,
  `id_os` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_DevolucaoOs_Empresa` (`id_empresa`),
  KEY `FK_DevolucaoOs_Ordemservico` (`id_os`),
  CONSTRAINT `FK_DevolucaoOs_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`),
  CONSTRAINT `FK_DevolucaoOs_Ordemservico` FOREIGN KEY (`id_os`) REFERENCES `ordemservico` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devolucao_os`
--

LOCK TABLES `devolucao_os` WRITE;
/*!40000 ALTER TABLE `devolucao_os` DISABLE KEYS */;
/*!40000 ALTER TABLE `devolucao_os` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctocliente`
--

DROP TABLE IF EXISTS `doctocliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctocliente` (
  `id_cliente` bigint(20) NOT NULL,
  `id_docto` bigint(20) NOT NULL,
  PRIMARY KEY (`id_cliente`,`id_docto`),
  KEY `DoctoCliente_Cliente` (`id_cliente`),
  KEY `DoctoCliente_Documento` (`id_docto`),
  CONSTRAINT `DoctoCliente_Cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`),
  CONSTRAINT `DoctoCliente_Documento` FOREIGN KEY (`id_docto`) REFERENCES `documento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctocliente`
--

LOCK TABLES `doctocliente` WRITE;
/*!40000 ALTER TABLE `doctocliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctocliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctocontrato`
--

DROP TABLE IF EXISTS `doctocontrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctocontrato` (
  `id_contrato` bigint(20) NOT NULL,
  `id_docto` bigint(20) NOT NULL,
  PRIMARY KEY (`id_contrato`,`id_docto`),
  KEY `FK_DoctoContrato_Documento` (`id_docto`),
  CONSTRAINT `FK_DoctoContrato_Contrato` FOREIGN KEY (`id_contrato`) REFERENCES `contrato` (`id`),
  CONSTRAINT `FK_DoctoContrato_Documento` FOREIGN KEY (`id_docto`) REFERENCES `documento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctocontrato`
--

LOCK TABLES `doctocontrato` WRITE;
/*!40000 ALTER TABLE `doctocontrato` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctocontrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctofornecedor`
--

DROP TABLE IF EXISTS `doctofornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctofornecedor` (
  `id_fornecedor` bigint(20) NOT NULL,
  `id_docto` bigint(20) NOT NULL,
  PRIMARY KEY (`id_fornecedor`,`id_docto`),
  KEY `DoctoFornecedor_Fornecedor` (`id_fornecedor`),
  KEY `DoctoFornecedor_Documento` (`id_docto`),
  CONSTRAINT `DoctoFornecedor_Documento` FOREIGN KEY (`id_docto`) REFERENCES `documento` (`id`),
  CONSTRAINT `DoctoFornecedor_Fornecedor` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctofornecedor`
--

LOCK TABLES `doctofornecedor` WRITE;
/*!40000 ALTER TABLE `doctofornecedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctofornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctoordemservico`
--

DROP TABLE IF EXISTS `doctoordemservico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctoordemservico` (
  `id_Ordemservico` bigint(20) NOT NULL,
  `id_docto` bigint(20) NOT NULL,
  PRIMARY KEY (`id_Ordemservico`,`id_docto`),
  KEY `DoctoOrdemservico_Ordemservico` (`id_Ordemservico`),
  KEY `DoctoOrdemservico_Documento` (`id_docto`),
  CONSTRAINT `DoctoOrdemservico_Documento` FOREIGN KEY (`id_docto`) REFERENCES `documento` (`id`),
  CONSTRAINT `DoctoOrdemservico_Ordemservico` FOREIGN KEY (`id_Ordemservico`) REFERENCES `ordemservico` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctoordemservico`
--

LOCK TABLES `doctoordemservico` WRITE;
/*!40000 ALTER TABLE `doctoordemservico` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctoordemservico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctopessoa`
--

DROP TABLE IF EXISTS `doctopessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctopessoa` (
  `id_pessoa` bigint(20) NOT NULL,
  `id_docto` bigint(20) NOT NULL,
  PRIMARY KEY (`id_pessoa`,`id_docto`),
  KEY `FK_DoctoPessoa_Pessoa` (`id_pessoa`),
  KEY `FK_DoctoPessoa_Documento` (`id_docto`),
  CONSTRAINT `FK_DoctoPessoa_Documento` FOREIGN KEY (`id_docto`) REFERENCES `documento` (`id`),
  CONSTRAINT `FK_DoctoPessoa_Pessoa` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctopessoa`
--

LOCK TABLES `doctopessoa` WRITE;
/*!40000 ALTER TABLE `doctopessoa` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctopessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctoproduto`
--

DROP TABLE IF EXISTS `doctoproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctoproduto` (
  `id_produto` bigint(20) NOT NULL,
  `id_docto` bigint(20) NOT NULL,
  PRIMARY KEY (`id_produto`,`id_docto`),
  KEY `FK_DoctoProduto_Documento` (`id_docto`),
  CONSTRAINT `FK_DoctoProduto_Documento` FOREIGN KEY (`id_docto`) REFERENCES `documento` (`id`),
  CONSTRAINT `FK_DoctoProduto_Produto` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctoproduto`
--

LOCK TABLES `doctoproduto` WRITE;
/*!40000 ALTER TABLE `doctoproduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctoproduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctoproposta`
--

DROP TABLE IF EXISTS `doctoproposta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctoproposta` (
  `id_proposta` bigint(20) NOT NULL,
  `id_docto` bigint(20) NOT NULL,
  PRIMARY KEY (`id_proposta`,`id_docto`),
  KEY `DoctoProposta_Proposta` (`id_proposta`),
  KEY `DoctoProposta_Documento` (`id_docto`),
  CONSTRAINT `DoctoProposta_Documento` FOREIGN KEY (`id_docto`) REFERENCES `documento` (`id`),
  CONSTRAINT `DoctoProposta_Proposta` FOREIGN KEY (`id_proposta`) REFERENCES `proposta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctoproposta`
--

LOCK TABLES `doctoproposta` WRITE;
/*!40000 ALTER TABLE `doctoproposta` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctoproposta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctoveiculo`
--

DROP TABLE IF EXISTS `doctoveiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctoveiculo` (
  `id_veiculo` bigint(20) NOT NULL,
  `id_docto` bigint(20) NOT NULL,
  PRIMARY KEY (`id_veiculo`,`id_docto`),
  KEY `FK_DoctoVeiculo_Veiculo` (`id_veiculo`),
  KEY `FK_DoctoVeiculo_Documento` (`id_docto`),
  CONSTRAINT `FK_DoctoVeiculo_Documento` FOREIGN KEY (`id_docto`) REFERENCES `documento` (`id`),
  CONSTRAINT `FK_DoctoVeiculo_Veiculo` FOREIGN KEY (`id_veiculo`) REFERENCES `veiculo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctoveiculo`
--

LOCK TABLES `doctoveiculo` WRITE;
/*!40000 ALTER TABLE `doctoveiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctoveiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documento`
--

DROP TABLE IF EXISTS `documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documento` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_empresa` bigint(20) DEFAULT NULL,
  `nome` varchar(100) NOT NULL,
  `caminho` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Documento_Empresa` (`id_empresa`),
  CONSTRAINT `FK_Documento_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documento`
--

LOCK TABLES `documento` WRITE;
/*!40000 ALTER TABLE `documento` DISABLE KEYS */;
/*!40000 ALTER TABLE `documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eixo`
--

DROP TABLE IF EXISTS `eixo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eixo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_veiculo` bigint(20) DEFAULT NULL,
  `num_eixo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Eixo_Veiculo` (`id_veiculo`),
  CONSTRAINT `FK_Eixo_Veiculo` FOREIGN KEY (`id_veiculo`) REFERENCES `veiculo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eixo`
--

LOCK TABLES `eixo` WRITE;
/*!40000 ALTER TABLE `eixo` DISABLE KEYS */;
/*!40000 ALTER TABLE `eixo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email`
--

DROP TABLE IF EXISTS `email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email` (
  `id` bigint(20) NOT NULL,
  `anexos` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_Email_Mensagem` FOREIGN KEY (`id`) REFERENCES `mensagem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email`
--

LOCK TABLES `email` WRITE;
/*!40000 ALTER TABLE `email` DISABLE KEYS */;
/*!40000 ALTER TABLE `email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresa` (
  `id` bigint(20) NOT NULL,
  `logomarca` varchar(250) DEFAULT NULL,
  `smtp` varchar(100) DEFAULT NULL,
  `porta_smtp` varchar(10) DEFAULT NULL,
  `login_smtp` varchar(100) DEFAULT NULL,
  `senha_smtp` varchar(100) DEFAULT NULL,
  `id_regimetributario` int(11) DEFAULT NULL,
  `tls` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `Empresa_Pessoa` FOREIGN KEY (`id`) REFERENCES `pessoa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES (1,NULL,NULL,NULL,NULL,NULL,1,NULL);
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa_usuario`
--

DROP TABLE IF EXISTS `empresa_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresa_usuario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_empresa` bigint(20) NOT NULL,
  `id_usuario` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_EmpresaUsuario_Empresa` (`id_empresa`),
  CONSTRAINT `FK_EmpresaUsuario_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa_usuario`
--

LOCK TABLES `empresa_usuario` WRITE;
/*!40000 ALTER TABLE `empresa_usuario` DISABLE KEYS */;
INSERT INTO `empresa_usuario` VALUES (1,1,12),(2,1,20);
/*!40000 ALTER TABLE `empresa_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `endereco` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `logradouro` varchar(45) DEFAULT NULL,
  `numero` varchar(11) DEFAULT NULL,
  `complemento` varchar(60) DEFAULT NULL,
  `bairro` varchar(45) DEFAULT NULL,
  `cep` char(9) DEFAULT NULL,
  `cidade` int(11) NOT NULL,
  `cobranca` bit(1) NOT NULL,
  `faturamento` bit(1) NOT NULL,
  `entrega` bit(1) NOT NULL,
  `correspondencia` bit(1) NOT NULL,
  `id_gestor` bigint(20) DEFAULT NULL,
  `ponto_de_referencia` varchar(250) DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enderecopessoa`
--

DROP TABLE IF EXISTS `enderecopessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enderecopessoa` (
  `id_pessoa` bigint(20) NOT NULL,
  `id_endereco` bigint(20) NOT NULL,
  PRIMARY KEY (`id_pessoa`,`id_endereco`),
  KEY `EnderecoPessoa_Endereco` (`id_endereco`),
  CONSTRAINT `EnderecoPessoa_Endereco` FOREIGN KEY (`id_endereco`) REFERENCES `endereco` (`id`),
  CONSTRAINT `EnderecoPessoa_Pessoa` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enderecopessoa`
--

LOCK TABLES `enderecopessoa` WRITE;
/*!40000 ALTER TABLE `enderecopessoa` DISABLE KEYS */;
/*!40000 ALTER TABLE `enderecopessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipe`
--

DROP TABLE IF EXISTS `equipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipe` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) NOT NULL,
  `descricao` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipe`
--

LOCK TABLES `equipe` WRITE;
/*!40000 ALTER TABLE `equipe` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estoque` (
  `id_item` bigint(20) NOT NULL,
  `id_unidade_estoque` bigint(20) NOT NULL,
  `id_empresa` bigint(20) NOT NULL,
  `saldo` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_item`,`id_unidade_estoque`),
  KEY `FK_Estoque_Empresa` (`id_empresa`),
  KEY `FK_Estoque_UnidadeEstoque` (`id_unidade_estoque`),
  KEY `FK_Estoque_Item` (`id_item`),
  CONSTRAINT `FK_Estoque_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`),
  CONSTRAINT `FK_Estoque_Item` FOREIGN KEY (`id_item`) REFERENCES `item` (`id`),
  CONSTRAINT `FK_Estoque_UnidadeEstoque` FOREIGN KEY (`id_unidade_estoque`) REFERENCES `unidadeestoque` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expedicao`
--

DROP TABLE IF EXISTS `expedicao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expedicao` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_pedido_venda` bigint(20) DEFAULT NULL,
  `status` char(3) DEFAULT NULL,
  `id_tecnico` bigint(20) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `data_retirada` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Expedicao_PedidoVenda` (`id_pedido_venda`),
  KEY `FK_Expedicao_Tecnico` (`id_tecnico`),
  CONSTRAINT `FK_Expedicao_PedidoVenda` FOREIGN KEY (`id_pedido_venda`) REFERENCES `pedidovenda` (`id`),
  CONSTRAINT `FK_Expedicao_Tecnico` FOREIGN KEY (`id_tecnico`) REFERENCES `pessoa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expedicao`
--

LOCK TABLES `expedicao` WRITE;
/*!40000 ALTER TABLE `expedicao` DISABLE KEYS */;
/*!40000 ALTER TABLE `expedicao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fatura`
--

DROP TABLE IF EXISTS `fatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fatura` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data_entrada` date DEFAULT NULL,
  `data_nota` date DEFAULT NULL,
  `id_empresa` bigint(20) DEFAULT NULL,
  `id_pessoa` bigint(20) DEFAULT NULL,
  `numero_nota` int(11) DEFAULT NULL,
  `numero_nfe` int(11) DEFAULT NULL,
  `numero_nfse` int(11) DEFAULT NULL,
  `total_nota` float DEFAULT NULL,
  `entrada_saida` char(1) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `devolvida` bit(1) DEFAULT b'0',
  `comentarios` varchar(8000) DEFAULT NULL,
  `dados_adicionais_nfse` varchar(1500) DEFAULT NULL,
  `dados_adicionais_nfe` varchar(5000) DEFAULT NULL,
  `numero_ordem_debito` bigint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Fatura_Empresa` (`id_empresa`),
  KEY `FK_Fatura_Pessoa` (`id_pessoa`),
  CONSTRAINT `FK_Fatura_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`),
  CONSTRAINT `FK_Fatura_Pessoa` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fatura`
--

LOCK TABLES `fatura` WRITE;
/*!40000 ALTER TABLE `fatura` DISABLE KEYS */;
/*!40000 ALTER TABLE `fatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faturaexpedicao`
--

DROP TABLE IF EXISTS `faturaexpedicao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faturaexpedicao` (
  `id_expedicao` bigint(20) NOT NULL,
  `id_fatura` bigint(20) NOT NULL,
  PRIMARY KEY (`id_expedicao`,`id_fatura`),
  KEY `FK_FaturaExpedicao_Expedicao` (`id_expedicao`),
  KEY `FK_FaturaExpedicao_Fatura` (`id_fatura`),
  CONSTRAINT `FK_FaturaExpedicao_Expedicao` FOREIGN KEY (`id_expedicao`) REFERENCES `expedicao` (`id`),
  CONSTRAINT `FK_FaturaExpedicao_Fatura` FOREIGN KEY (`id_fatura`) REFERENCES `fatura` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faturaexpedicao`
--

LOCK TABLES `faturaexpedicao` WRITE;
/*!40000 ALTER TABLE `faturaexpedicao` DISABLE KEYS */;
/*!40000 ALTER TABLE `faturaexpedicao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faturamento`
--

DROP TABLE IF EXISTS `faturamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faturamento` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mes` int(11) DEFAULT NULL,
  `ano` int(11) DEFAULT NULL,
  `id_contrato` bigint(20) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `id_titulo` bigint(20) DEFAULT NULL,
  `bonificacao` bit(1) DEFAULT b'0',
  `id_pessoa` bigint(20) DEFAULT NULL,
  `id_fatura` bigint(20) DEFAULT NULL,
  `bonificacao_total` bit(1) NOT NULL DEFAULT b'0',
  `id_empresa` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Faturamento_Contrato` (`id_contrato`),
  KEY `Fk_Faturamento_Titulo` (`id_titulo`),
  KEY `fk_faturamento_pessoa` (`id_pessoa`),
  KEY `FK_Faturamento_Empresa` (`id_empresa`),
  CONSTRAINT `faturamento_ibfk_1` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`),
  CONSTRAINT `FK_Faturamento_Contrato` FOREIGN KEY (`id_contrato`) REFERENCES `contrato` (`id`),
  CONSTRAINT `fk_faturamento_pessoa` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id`),
  CONSTRAINT `Fk_Faturamento_Titulo` FOREIGN KEY (`id_titulo`) REFERENCES `titulo` (`id_titulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faturamento`
--

LOCK TABLES `faturamento` WRITE;
/*!40000 ALTER TABLE `faturamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `faturamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faturas`
--

DROP TABLE IF EXISTS `faturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faturas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_fatura` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Faturas_Fatura` (`id_fatura`),
  CONSTRAINT `Faturas_Fatura` FOREIGN KEY (`id_fatura`) REFERENCES `fatura` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faturas`
--

LOCK TABLES `faturas` WRITE;
/*!40000 ALTER TABLE `faturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `faturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feriado`
--

DROP TABLE IF EXISTS `feriado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feriado` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Data` datetime NOT NULL,
  `Motivo` varchar(200) NOT NULL,
  `id_localidade` int(11) NOT NULL,
  `Anual` bit(1) NOT NULL DEFAULT b'0',
  `id_empresa` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Feriado_Localidade` (`id_localidade`),
  KEY `FK_Feriado_modulo` (`id_empresa`),
  CONSTRAINT `FK_Feriado_Localidade` FOREIGN KEY (`id_localidade`) REFERENCES `gw_global`.`gw_localidade` (`id`),
  CONSTRAINT `FK_Feriado_modulo` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feriado`
--

LOCK TABLES `feriado` WRITE;
/*!40000 ALTER TABLE `feriado` DISABLE KEYS */;
/*!40000 ALTER TABLE `feriado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fontecaptacaocliente`
--

DROP TABLE IF EXISTS `fontecaptacaocliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fontecaptacaocliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` char(255) DEFAULT NULL,
  `ativo` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fontecaptacaocliente`
--

LOCK TABLES `fontecaptacaocliente` WRITE;
/*!40000 ALTER TABLE `fontecaptacaocliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `fontecaptacaocliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fornecedor` (
  `id` bigint(20) NOT NULL,
  `id_empresa` bigint(20) NOT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Fornecedor_Empresa` (`id_empresa`),
  KEY `Fornecedor_CategoriaFornecedor` (`id_categoria`),
  CONSTRAINT `Fornecedor_CategoriaFornecedor` FOREIGN KEY (`id_categoria`) REFERENCES `categoriafornecedor` (`id`),
  CONSTRAINT `Fornecedor_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`),
  CONSTRAINT `Fornecedor_Pessoa` FOREIGN KEY (`id`) REFERENCES `pessoa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcao`
--

DROP TABLE IF EXISTS `funcao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) DEFAULT NULL,
  `descricao` varchar(2000) DEFAULT NULL,
  `sistema` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcao`
--

LOCK TABLES `funcao` WRITE;
/*!40000 ALTER TABLE `funcao` DISABLE KEYS */;
INSERT INTO `funcao` VALUES (1,'Gerente administrativo','Gerencia operacional da empresa',''),(2,'Gerente de vendas','Coordenar a equipe de vendas',''),(3,'Vendedor','Prospectar clientes e realizar negócios',''),(4,'Técnico','Realizar instalação e manutenção em clientes',''),(5,'Diretor','Direção da empresa',''),(6,'Monitor','Monitoramento de alarmes',''),(7,'Inspetor de monitoramento','Inspeção de alarmes',''),(8,'Supervisor monitoramento','Supervisiona os monitores',''),(9,'TI','Respnsável pelo TI da empresa',''),(10,'Gerente financeiro','Gerencia o departamento financeiro',''),(11,'Auxiliar admnistrativo','Auxilia a administração da empresa',''),(12,'Almoxarife','Responsável pelo almoxarifado',''),(13,'Motorista','Motorista',''),(14,'Diretor','Diretor geral','\0');
/*!40000 ALTER TABLE `funcao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcionario` (
  `id` bigint(20) NOT NULL,
  `id_empresa` bigint(20) NOT NULL,
  `tecnico` bit(1) NOT NULL DEFAULT b'0',
  `motorista` bit(1) NOT NULL DEFAULT b'0',
  `vendedor` bit(1) NOT NULL DEFAULT b'0',
  `gerentevendas` bit(1) NOT NULL DEFAULT b'0',
  `almoxarife` bit(1) NOT NULL DEFAULT b'0',
  `inspetor` bit(1) NOT NULL DEFAULT b'0',
  `id_funcao` int(11) DEFAULT NULL,
  `monitor` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Funcionario_Empresa` (`id_empresa`),
  KEY `Funcionario_Funcao` (`id_funcao`),
  CONSTRAINT `Funcionario_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`),
  CONSTRAINT `Funcionario_Funcao` FOREIGN KEY (`id_funcao`) REFERENCES `funcao` (`id`),
  CONSTRAINT `Funcionario_Pessoa` FOREIGN KEY (`id`) REFERENCES `pessoa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionarioequipe`
--

DROP TABLE IF EXISTS `funcionarioequipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcionarioequipe` (
  `id_equipe` bigint(20) NOT NULL,
  `id_funcionario` bigint(20) NOT NULL,
  PRIMARY KEY (`id_equipe`,`id_funcionario`),
  KEY `FK_Funcionarioequipe_Equipe` (`id_equipe`),
  KEY `FK_Funcionarioequipe_Funcionario` (`id_funcionario`),
  CONSTRAINT `FK_Funcionarioequipe_Equipe` FOREIGN KEY (`id_equipe`) REFERENCES `equipe` (`id`),
  CONSTRAINT `FK_Funcionarioequipe_Funcionario` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionarioequipe`
--

LOCK TABLES `funcionarioequipe` WRITE;
/*!40000 ALTER TABLE `funcionarioequipe` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcionarioequipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gerentevendas`
--

DROP TABLE IF EXISTS `gerentevendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gerentevendas` (
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `GerenteVendas_Pessoa` FOREIGN KEY (`id`) REFERENCES `pessoa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gerentevendas`
--

LOCK TABLES `gerentevendas` WRITE;
/*!40000 ALTER TABLE `gerentevendas` DISABLE KEYS */;
INSERT INTO `gerentevendas` VALUES (2);
/*!40000 ALTER TABLE `gerentevendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo_usuario`
--

DROP TABLE IF EXISTS `grupo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo_usuario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `descricao` varchar(500) DEFAULT NULL,
  `count_users` bigint(20) NOT NULL DEFAULT '0',
  `sistema` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo_usuario`
--

LOCK TABLES `grupo_usuario` WRITE;
/*!40000 ALTER TABLE `grupo_usuario` DISABLE KEYS */;
INSERT INTO `grupo_usuario` VALUES (1,'Administradores de sistema','Usuário com permissão total de acesso ao sistema',0,'');
/*!40000 ALTER TABLE `grupo_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inspetor`
--

DROP TABLE IF EXISTS `inspetor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inspetor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `FK_Inspetor_Pessoa` (`id`),
  CONSTRAINT `FK_Inspetor_Pessoa` FOREIGN KEY (`id`) REFERENCES `pessoa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inspetor`
--

LOCK TABLES `inspetor` WRITE;
/*!40000 ALTER TABLE `inspetor` DISABLE KEYS */;
/*!40000 ALTER TABLE `inspetor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instrucaoaobanco`
--

DROP TABLE IF EXISTS `instrucaoaobanco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instrucaoaobanco` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_nossainstrucao` int(11) NOT NULL,
  `id_titulo` bigint(20) NOT NULL,
  `id_statusinstrucao` int(11) NOT NULL,
  `id_lote` int(11) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `diasprotesto` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_InstrucaoAoBanco_NossaInstrucao` (`id_nossainstrucao`),
  KEY `FK_InstrucaoAoBanco_Titulo` (`id_titulo`),
  CONSTRAINT `FK_InstrucaoAoBanco_NossaInstrucao` FOREIGN KEY (`id_nossainstrucao`) REFERENCES `nossainstrucao` (`id`),
  CONSTRAINT `FK_InstrucaoAoBanco_Titulo` FOREIGN KEY (`id_titulo`) REFERENCES `titulo` (`id_titulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instrucaoaobanco`
--

LOCK TABLES `instrucaoaobanco` WRITE;
/*!40000 ALTER TABLE `instrucaoaobanco` DISABLE KEYS */;
/*!40000 ALTER TABLE `instrucaoaobanco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` bigint(20) NOT NULL,
  `data` date NOT NULL,
  `status` char(1) DEFAULT NULL,
  `abertura` tinyint(1) DEFAULT NULL,
  `id_unidade_estoque` bigint(20) NOT NULL,
  `id_unidade_negocio` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Inventario_UnidadeEstoque` (`id_unidade_estoque`),
  KEY `FK_Inventario_UnidadeNegocio` (`id_unidade_negocio`),
  KEY `FK_Inventario_Empresa` (`id_empresa`),
  CONSTRAINT `FK_Inventario_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`),
  CONSTRAINT `FK_Inventario_UnidadeEstoque` FOREIGN KEY (`id_unidade_estoque`) REFERENCES `unidadeestoque` (`id`),
  CONSTRAINT `FK_Inventario_UnidadeNegocio` FOREIGN KEY (`id_unidade_negocio`) REFERENCES `unidadenegocio` (`id_unidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `especificacao` varchar(120) NOT NULL,
  `categoria` bigint(20) DEFAULT NULL,
  `ativo` bit(1) NOT NULL DEFAULT b'1',
  `produto` bit(1) NOT NULL DEFAULT b'0',
  `patrimonio` bit(1) NOT NULL DEFAULT b'0',
  `servico` bit(1) NOT NULL DEFAULT b'0',
  `peso` float DEFAULT NULL,
  `observacao` text,
  `id_unidade_medida` int(11) DEFAULT NULL,
  `ncm` varchar(11) DEFAULT NULL,
  `discr` varchar(50) DEFAULT NULL,
  `peso_bruto` float DEFAULT NULL,
  `marca` varchar(45) DEFAULT NULL,
  `fabricante` varchar(45) DEFAULT NULL,
  `imagem` varchar(100) DEFAULT NULL,
  `id_gestor` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Item_CategoriaItem` (`categoria`),
  CONSTRAINT `Item_CategoriaItem` FOREIGN KEY (`categoria`) REFERENCES `categoriaitem` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (-5,'Locação',26,'','\0','\0','',0,'Serviço de locação padrão do sistema.',NULL,NULL,'servico',NULL,NULL,NULL,NULL,NULL),(-4,'Gás',NULL,'','','\0','\0',NULL,'Combustível - Gás',NULL,NULL,'produto',NULL,NULL,NULL,NULL,NULL),(-3,'Etanol',NULL,'','','\0','\0',NULL,'Combustível - Etanol',NULL,NULL,'produto',NULL,NULL,NULL,NULL,NULL),(-2,'Diesel',NULL,'','','\0','\0',NULL,'Combustível - Diesel',NULL,NULL,'produto',NULL,NULL,NULL,NULL,NULL),(-1,'Gasolina',NULL,'','','\0','\0',NULL,'Combustível - Gasolina',NULL,NULL,'produto',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_devolucao_os`
--

DROP TABLE IF EXISTS `item_devolucao_os`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_devolucao_os` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_devolucao_os` int(11) NOT NULL,
  `id_item` bigint(20) NOT NULL,
  `id_mov_item` bigint(20) NOT NULL,
  `id_unidade_estoque` bigint(20) NOT NULL,
  `quantidade` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ItemDevoluvaoOs_Item` (`id_item`),
  KEY `ItemDevoluvaoOs_DevolucaoOs` (`id_devolucao_os`),
  KEY `ItemDevoluvaoOs_MovItem` (`id_mov_item`),
  KEY `ItemDevoluvaoOs_UnidadeEstoque` (`id_unidade_estoque`),
  CONSTRAINT `ItemDevoluvaoOs_DevolucaoOs` FOREIGN KEY (`id_devolucao_os`) REFERENCES `devolucao_os` (`id`),
  CONSTRAINT `ItemDevoluvaoOs_Item` FOREIGN KEY (`id_item`) REFERENCES `item` (`id`),
  CONSTRAINT `ItemDevoluvaoOs_MovItem` FOREIGN KEY (`id_mov_item`) REFERENCES `movitem` (`id`),
  CONSTRAINT `ItemDevoluvaoOs_UnidadeEstoque` FOREIGN KEY (`id_unidade_estoque`) REFERENCES `unidadeestoque` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_devolucao_os`
--

LOCK TABLES `item_devolucao_os` WRITE;
/*!40000 ALTER TABLE `item_devolucao_os` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_devolucao_os` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_subsistema`
--

DROP TABLE IF EXISTS `item_subsistema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_subsistema` (
  `id_subsistema` bigint(20) NOT NULL,
  `id_produto` bigint(20) NOT NULL,
  PRIMARY KEY (`id_subsistema`,`id_produto`),
  KEY `Itemsubsistema_Produto` (`id_produto`),
  CONSTRAINT `Itemsubsistema_Produto` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`),
  CONSTRAINT `Itemsubsistema_Subsistema` FOREIGN KEY (`id_subsistema`) REFERENCES `subsistema` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_subsistema`
--

LOCK TABLES `item_subsistema` WRITE;
/*!40000 ALTER TABLE `item_subsistema` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_subsistema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemaplicacao`
--

DROP TABLE IF EXISTS `itemaplicacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemaplicacao` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_item` bigint(20) DEFAULT NULL,
  `quantidade` float NOT NULL,
  `kmhora_aplicacao` int(18) DEFAULT NULL,
  `preco` float DEFAULT NULL,
  `kmhora_utilizado` int(18) DEFAULT NULL,
  `abastecimento` bit(1) NOT NULL,
  `nota` int(18) DEFAULT NULL,
  `data` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ItemAplicacao_Item` (`id_item`),
  CONSTRAINT `FK_ItemAplicacao_Item` FOREIGN KEY (`id_item`) REFERENCES `item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemaplicacao`
--

LOCK TABLES `itemaplicacao` WRITE;
/*!40000 ALTER TABLE `itemaplicacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `itemaplicacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemcontrato`
--

DROP TABLE IF EXISTS `itemcontrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemcontrato` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_contrato` bigint(20) DEFAULT NULL,
  `id_item` bigint(20) DEFAULT NULL,
  `quantidade` float DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `valor_locacao` float DEFAULT NULL,
  `sla` int(11) DEFAULT NULL,
  `id_gestor` bigint(20) DEFAULT NULL,
  `valor_bonificacao` float DEFAULT NULL,
  `qtdparcelas` int(11) DEFAULT NULL,
  `id_conta_contrato` bigint(20) DEFAULT NULL,
  `loc_cli_com_serv` char(2) DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id`),
  KEY `FK_ItemContrato_Contrato` (`id_contrato`),
  KEY `FK_ItemContrato_Item` (`id_item`),
  KEY `FK_Itemcontrato_Contacontrato` (`id_conta_contrato`),
  CONSTRAINT `FK_Itemcontrato_Contacontrato` FOREIGN KEY (`id_conta_contrato`) REFERENCES `conta_contrato` (`id`),
  CONSTRAINT `FK_ItemContrato_Contrato` FOREIGN KEY (`id_contrato`) REFERENCES `contrato` (`id`),
  CONSTRAINT `FK_ItemContrato_Item` FOREIGN KEY (`id_item`) REFERENCES `item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemcontrato`
--

LOCK TABLES `itemcontrato` WRITE;
/*!40000 ALTER TABLE `itemcontrato` DISABLE KEYS */;
/*!40000 ALTER TABLE `itemcontrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemcotacao`
--

DROP TABLE IF EXISTS `itemcotacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemcotacao` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_cotacao` bigint(20) DEFAULT NULL,
  `id_item` bigint(20) DEFAULT NULL,
  `quantidade` float DEFAULT NULL,
  `comentario` varchar(500) DEFAULT NULL,
  `descricao_item` char(200) DEFAULT NULL,
  `status` char(3) DEFAULT NULL,
  `id_pedido_compra` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ItemCotacao_Cotacao` (`id_cotacao`),
  KEY `FK_ItemCotacao_Item` (`id_item`),
  KEY `FK_ItemCotacao_PedidoCompra` (`id_pedido_compra`),
  CONSTRAINT `FK_ItemCotacao_Cotacao` FOREIGN KEY (`id_cotacao`) REFERENCES `cotacao` (`id`),
  CONSTRAINT `FK_ItemCotacao_Item` FOREIGN KEY (`id_item`) REFERENCES `item` (`id`),
  CONSTRAINT `itemcotacao_ibfk_1` FOREIGN KEY (`id_pedido_compra`) REFERENCES `pedidocompra` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemcotacao`
--

LOCK TABLES `itemcotacao` WRITE;
/*!40000 ALTER TABLE `itemcotacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `itemcotacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemcotacaofornecedor`
--

DROP TABLE IF EXISTS `itemcotacaofornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemcotacaofornecedor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_item_cotacao` bigint(20) NOT NULL,
  `id_cotacao_fornecedor` bigint(20) NOT NULL,
  `quantidade` float DEFAULT NULL,
  `preco` float DEFAULT NULL,
  `comentario` varchar(500) DEFAULT NULL,
  `disponibilidade` int(11) DEFAULT NULL,
  `prazoentrega` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ItemCotacaoFornecedor_ItemCotacao` (`id_item_cotacao`),
  KEY `FK_ItemCotacaoFornecedor_CotacaoFornecedor` (`id_cotacao_fornecedor`),
  CONSTRAINT `FK_ItemCotacaoFornecedor_CotacaoFornecedor` FOREIGN KEY (`id_cotacao_fornecedor`) REFERENCES `cotacaofornecedor` (`id`),
  CONSTRAINT `FK_ItemCotacaoFornecedor_ItemCotacao` FOREIGN KEY (`id_item_cotacao`) REFERENCES `itemcotacao` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemcotacaofornecedor`
--

LOCK TABLES `itemcotacaofornecedor` WRITE;
/*!40000 ALTER TABLE `itemcotacaofornecedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `itemcotacaofornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemempresa`
--

DROP TABLE IF EXISTS `itemempresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemempresa` (
  `id_item` bigint(20) NOT NULL,
  `id_empresa` bigint(20) NOT NULL,
  `comissao_vendas` float DEFAULT NULL,
  `custo_nota` float DEFAULT NULL,
  `preco_venda` float DEFAULT NULL,
  `encargos` float DEFAULT NULL,
  `cmv` float DEFAULT NULL,
  `margemBruta` float DEFAULT NULL,
  `id_regra_federal` int(11) DEFAULT NULL,
  `taxa_locacao` float DEFAULT NULL,
  `estoqueminimo` float DEFAULT NULL,
  PRIMARY KEY (`id_item`,`id_empresa`),
  KEY `FK_ItemEmpresa_RegraTributacaoFederal` (`id_regra_federal`),
  KEY `FK_ItemEmpresa_Item` (`id_item`),
  KEY `FK_ItemEmpresa_Empresa` (`id_empresa`),
  CONSTRAINT `FK_ItemEmpresa_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ItemEmpresa_Item` FOREIGN KEY (`id_item`) REFERENCES `item` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ItemEmpresa_RegraTributacaoFederal` FOREIGN KEY (`id_regra_federal`) REFERENCES `regratributacaofederal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemempresa`
--

LOCK TABLES `itemempresa` WRITE;
/*!40000 ALTER TABLE `itemempresa` DISABLE KEYS */;
INSERT INTO `itemempresa` VALUES (-5,1,0,0,0,0,0,0,NULL,NULL,NULL),(-4,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(-3,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(-2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(-1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `itemempresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemexpedicao`
--

DROP TABLE IF EXISTS `itemexpedicao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemexpedicao` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_expedicao` bigint(20) DEFAULT NULL,
  `id_item` bigint(20) DEFAULT NULL,
  `quantidade_expedida` float DEFAULT NULL,
  `venda_locacao` char(1) DEFAULT NULL,
  `id_unidade_estoque` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ItemExpedicao_Expedicao` (`id_expedicao`),
  KEY `FK_ItemExpedicao_Item` (`id_item`),
  KEY `FK_ItemExpedicao_Unidadeestoque` (`id_unidade_estoque`),
  CONSTRAINT `FK_ItemExpedicao_Expedicao` FOREIGN KEY (`id_expedicao`) REFERENCES `expedicao` (`id`),
  CONSTRAINT `FK_ItemExpedicao_Item` FOREIGN KEY (`id_item`) REFERENCES `item` (`id`),
  CONSTRAINT `FK_ItemExpedicao_Unidadeestoque` FOREIGN KEY (`id_unidade_estoque`) REFERENCES `unidadeestoque` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemexpedicao`
--

LOCK TABLES `itemexpedicao` WRITE;
/*!40000 ALTER TABLE `itemexpedicao` DISABLE KEYS */;
/*!40000 ALTER TABLE `itemexpedicao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemfatura`
--

DROP TABLE IF EXISTS `itemfatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemfatura` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_fatura` bigint(20) DEFAULT NULL,
  `id_item` bigint(20) DEFAULT NULL,
  `quantidade` float DEFAULT NULL,
  `preco` float DEFAULT NULL,
  `icms` float DEFAULT NULL,
  `ipi` float DEFAULT NULL,
  `id_cfop` int(11) DEFAULT NULL,
  `iss` float DEFAULT NULL,
  `pis` float DEFAULT NULL,
  `cofins` float DEFAULT NULL,
  `red_bas_cal_icms` float DEFAULT NULL,
  `mls` float DEFAULT NULL,
  `icms_substituto` float DEFAULT NULL,
  `id_unidade_estoque` bigint(20) DEFAULT NULL,
  `cmv` float DEFAULT NULL,
  `preco_tabela` float DEFAULT NULL,
  `custo` float DEFAULT NULL,
  `comissao` float DEFAULT NULL,
  `iss_retido` float DEFAULT NULL,
  `id_nota` int(11) DEFAULT NULL,
  `simples_nacional` float DEFAULT NULL,
  `desconto` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ItemFatura_Fatura` (`id_fatura`),
  KEY `FK_ItemFatura_Item` (`id_item`),
  KEY `FK_ItemFatura_Cfop` (`id_cfop`),
  KEY `FK_ItemFatura_UnidadeEstoque` (`id_unidade_estoque`),
  CONSTRAINT `FK_ItemFatura_Cfop` FOREIGN KEY (`id_cfop`) REFERENCES `cfop` (`id`),
  CONSTRAINT `FK_ItemFatura_Fatura` FOREIGN KEY (`id_fatura`) REFERENCES `fatura` (`id`),
  CONSTRAINT `FK_ItemFatura_Item` FOREIGN KEY (`id_item`) REFERENCES `item` (`id`),
  CONSTRAINT `FK_ItemFatura_UnidadeEstoque` FOREIGN KEY (`id_unidade_estoque`) REFERENCES `unidadeestoque` (`id`),
  CONSTRAINT `itemfatura_ibfk_1` FOREIGN KEY (`id_unidade_estoque`) REFERENCES `unidadeestoque` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemfatura`
--

LOCK TABLES `itemfatura` WRITE;
/*!40000 ALTER TABLE `itemfatura` DISABLE KEYS */;
/*!40000 ALTER TABLE `itemfatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iteminventario`
--

DROP TABLE IF EXISTS `iteminventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iteminventario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_item` bigint(20) NOT NULL,
  `id_inventario` int(11) NOT NULL,
  `id_mov` bigint(20) DEFAULT NULL,
  `inventario` float DEFAULT NULL,
  `estoque` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Inventario_Item` (`id_item`),
  KEY `FK_ItemInventario_Iventario` (`id_inventario`),
  KEY `FK_ItemInventario_MovItem` (`id_mov`),
  CONSTRAINT `FK_Inventario_Item` FOREIGN KEY (`id_item`) REFERENCES `item` (`id`),
  CONSTRAINT `FK_ItemInventario_Iventario` FOREIGN KEY (`id_inventario`) REFERENCES `inventario` (`id`),
  CONSTRAINT `FK_ItemInventario_MovItem` FOREIGN KEY (`id_mov`) REFERENCES `movitem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iteminventario`
--

LOCK TABLES `iteminventario` WRITE;
/*!40000 ALTER TABLE `iteminventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `iteminventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemos`
--

DROP TABLE IF EXISTS `itemos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_item` bigint(20) DEFAULT NULL,
  `id_os` bigint(20) DEFAULT NULL,
  `qtd_vendida` float DEFAULT NULL,
  `qtd_pedida` float DEFAULT NULL,
  `qtd_expedida` float DEFAULT NULL,
  `qtd_entregue` float DEFAULT NULL,
  `qtd_devolvida` float DEFAULT NULL,
  `qtd_manutencao` float DEFAULT NULL,
  `qtd_faturada` float DEFAULT NULL,
  `preco_venda` float DEFAULT NULL,
  `id_motivo_bonificacao` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ItemOS_Item` (`id_item`),
  KEY `FK_ItemOS_OrdemServico` (`id_os`),
  KEY `FK_ItemOS_MotivoBonificacao` (`id_motivo_bonificacao`),
  CONSTRAINT `FK_ItemOS_Item` FOREIGN KEY (`id_item`) REFERENCES `item` (`id`),
  CONSTRAINT `FK_ItemOS_MotivoBonificacao` FOREIGN KEY (`id_motivo_bonificacao`) REFERENCES `motivobonificacao` (`id`),
  CONSTRAINT `FK_ItemOS_OrdemServico` FOREIGN KEY (`id_os`) REFERENCES `ordemservico` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemos`
--

LOCK TABLES `itemos` WRITE;
/*!40000 ALTER TABLE `itemos` DISABLE KEYS */;
/*!40000 ALTER TABLE `itemos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemosmovitem`
--

DROP TABLE IF EXISTS `itemosmovitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemosmovitem` (
  `id_itemos` bigint(20) NOT NULL,
  `id_movitem` bigint(20) NOT NULL,
  PRIMARY KEY (`id_itemos`,`id_movitem`),
  KEY `FK_ItemOsMovItem_ItemOS` (`id_itemos`),
  KEY `FK_ItemOsMovItem_MovItem` (`id_movitem`),
  CONSTRAINT `FK_ItemOsMovItem_ItemOS` FOREIGN KEY (`id_itemos`) REFERENCES `itemos` (`id`),
  CONSTRAINT `FK_ItemOsMovItem_MovItem` FOREIGN KEY (`id_movitem`) REFERENCES `movitem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemosmovitem`
--

LOCK TABLES `itemosmovitem` WRITE;
/*!40000 ALTER TABLE `itemosmovitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `itemosmovitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itempedidocompra`
--

DROP TABLE IF EXISTS `itempedidocompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itempedidocompra` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_pedido_compra` bigint(20) DEFAULT NULL,
  `id_item` bigint(20) DEFAULT NULL,
  `quantidade` float DEFAULT NULL,
  `preco` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ItemPedidoCompra_PedidoCompra` (`id_pedido_compra`),
  KEY `FK_ItemPedidoCompra_Item` (`id_item`),
  CONSTRAINT `FK_ItemPedidoCompra_Item` FOREIGN KEY (`id_item`) REFERENCES `item` (`id`),
  CONSTRAINT `FK_ItemPedidoCompra_PedidoCompra` FOREIGN KEY (`id_pedido_compra`) REFERENCES `pedidocompra` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itempedidocompra`
--

LOCK TABLES `itempedidocompra` WRITE;
/*!40000 ALTER TABLE `itempedidocompra` DISABLE KEYS */;
/*!40000 ALTER TABLE `itempedidocompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itempedidovenda`
--

DROP TABLE IF EXISTS `itempedidovenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itempedidovenda` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_pedido_venda` bigint(20) DEFAULT NULL,
  `quantidade` float DEFAULT NULL,
  `preco_venda_com_acrescimo` float DEFAULT NULL,
  `desconto` float DEFAULT NULL,
  `quantidade_expedida` float DEFAULT NULL,
  `venda_locacao` char(1) DEFAULT NULL,
  `id_item` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ItemPedidoVenda_PedidoVenda` (`id_pedido_venda`),
  KEY `FK_ItemPedidoVenda_Item` (`id_item`),
  CONSTRAINT `FK_ItemPedidoVenda_Item` FOREIGN KEY (`id_item`) REFERENCES `item` (`id`),
  CONSTRAINT `FK_ItemPedidoVenda_PedidoVenda` FOREIGN KEY (`id_pedido_venda`) REFERENCES `pedidovenda` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itempedidovenda`
--

LOCK TABLES `itempedidovenda` WRITE;
/*!40000 ALTER TABLE `itempedidovenda` DISABLE KEYS */;
/*!40000 ALTER TABLE `itempedidovenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemproposta`
--

DROP TABLE IF EXISTS `itemproposta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemproposta` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `id_proposta` bigint(20) NOT NULL,
  `id_item` bigint(20) NOT NULL,
  `quantidade` bigint(20) NOT NULL,
  `venda_locacao` char(1) DEFAULT NULL,
  `preco_tabela` decimal(14,2) DEFAULT NULL,
  `custo_operacao` decimal(14,2) DEFAULT NULL,
  `custo_financeiro` decimal(14,2) DEFAULT NULL,
  `custo_real` decimal(14,2) DEFAULT NULL,
  `desconto` decimal(14,2) DEFAULT NULL,
  `acrescimo` decimal(14,2) DEFAULT NULL,
  `preco_venda` decimal(14,2) DEFAULT NULL,
  `margem_lucro` decimal(14,2) DEFAULT NULL,
  `justificativa` varchar(500) DEFAULT NULL,
  `servico_instalacao` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ItemProposta_Proposta` (`id_proposta`),
  KEY `ItemProposta_Item` (`id_item`),
  CONSTRAINT `ItemProposta_Item` FOREIGN KEY (`id_item`) REFERENCES `item` (`id`),
  CONSTRAINT `ItemProposta_Proposta` FOREIGN KEY (`id_proposta`) REFERENCES `proposta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemproposta`
--

LOCK TABLES `itemproposta` WRITE;
/*!40000 ALTER TABLE `itemproposta` DISABLE KEYS */;
/*!40000 ALTER TABLE `itemproposta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemrequisicaocompra`
--

DROP TABLE IF EXISTS `itemrequisicaocompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemrequisicaocompra` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_requisicao_compra` bigint(20) DEFAULT NULL,
  `id_item` bigint(20) DEFAULT NULL,
  `qtd_requisitada` float DEFAULT NULL,
  `qtd_aprovada` float DEFAULT NULL,
  `qtd_rejeitada` float DEFAULT NULL,
  `descricao_item` char(200) DEFAULT NULL,
  `status` char(3) DEFAULT NULL,
  `id_cotacao` bigint(20) DEFAULT NULL,
  `comentario` char(200) DEFAULT NULL,
  `id_unidade_estoque` bigint(20) DEFAULT NULL,
  `id_pedido_compra` bigint(20) DEFAULT NULL,
  `tipo` char(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ItemRequisicaoCompra_RequisicaoCompra` (`id_requisicao_compra`),
  KEY `FK_ItemRequisicaoCompra_Item` (`id_item`),
  KEY `FK_ItemRequisicaoCompra_Cotacao` (`id_cotacao`),
  KEY `FK_ItemRequisicaoCompra_Unidadeestoque` (`id_unidade_estoque`),
  KEY `FK_ItemRequisicaoCompra_PedidoCompra` (`id_pedido_compra`),
  CONSTRAINT `FK_ItemRequisicaoCompra_Cotacao` FOREIGN KEY (`id_cotacao`) REFERENCES `cotacao` (`id`),
  CONSTRAINT `FK_ItemRequisicaoCompra_Item` FOREIGN KEY (`id_item`) REFERENCES `item` (`id`),
  CONSTRAINT `FK_ItemRequisicaoCompra_PedidoCompra` FOREIGN KEY (`id_pedido_compra`) REFERENCES `pedidocompra` (`id`),
  CONSTRAINT `FK_ItemRequisicaoCompra_RequisicaoCompra` FOREIGN KEY (`id_requisicao_compra`) REFERENCES `requisicaocompra` (`id`),
  CONSTRAINT `FK_ItemRequisicaoCompra_Unidadeestoque` FOREIGN KEY (`id_unidade_estoque`) REFERENCES `unidadeestoque` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemrequisicaocompra`
--

LOCK TABLES `itemrequisicaocompra` WRITE;
/*!40000 ALTER TABLE `itemrequisicaocompra` DISABLE KEYS */;
/*!40000 ALTER TABLE `itemrequisicaocompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemtransferenciaunidadeestoque`
--

DROP TABLE IF EXISTS `itemtransferenciaunidadeestoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemtransferenciaunidadeestoque` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_item` bigint(20) NOT NULL,
  `id_transferencia` bigint(20) NOT NULL,
  `quantidade` float DEFAULT NULL,
  `id_mov_entrada` bigint(20) DEFAULT NULL,
  `id_mov_saida` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ItemTransferenciaUnidadeEstoque_Item` (`id_item`),
  KEY `FK_ItemTransferenciaUnidadeEstoque_Transferencia` (`id_transferencia`),
  KEY `FK_ItemTransferenciaUnidadeEstoqueEntrada_Movitem` (`id_mov_entrada`),
  KEY `FK_ItemTransferenciaUnidadeEstoqueSaida_Movitem` (`id_mov_saida`),
  CONSTRAINT `FK_ItemTransferenciaUnidadeEstoqueEntrada_Movitem` FOREIGN KEY (`id_mov_entrada`) REFERENCES `movitem` (`id`),
  CONSTRAINT `FK_ItemTransferenciaUnidadeEstoqueSaida_Movitem` FOREIGN KEY (`id_mov_saida`) REFERENCES `movitem` (`id`),
  CONSTRAINT `FK_ItemTransferenciaUnidadeEstoque_Item` FOREIGN KEY (`id_item`) REFERENCES `item` (`id`),
  CONSTRAINT `FK_ItemTransferenciaUnidadeEstoque_Transferencia` FOREIGN KEY (`id_transferencia`) REFERENCES `transferenciaunidadeestoque` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemtransferenciaunidadeestoque`
--

LOCK TABLES `itemtransferenciaunidadeestoque` WRITE;
/*!40000 ALTER TABLE `itemtransferenciaunidadeestoque` DISABLE KEYS */;
/*!40000 ALTER TABLE `itemtransferenciaunidadeestoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lancto`
--

DROP TABLE IF EXISTS `lancto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lancto` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_unidade_negocio` int(11) NOT NULL,
  `id_natureza` int(11) NOT NULL,
  `valor` float DEFAULT NULL,
  `debito_credito` char(1) NOT NULL,
  `data` datetime NOT NULL,
  `historico` varchar(500) NOT NULL,
  `classe_geradora` varchar(150) NOT NULL,
  `id_classe_geradora` bigint(20) NOT NULL,
  `discr` varchar(50) DEFAULT NULL,
  `id_empresa` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK_Lancto_UnidadeNegocio` (`id_unidade_negocio`),
  KEY `FK_Lancto_Natureza` (`id_natureza`),
  KEY `FK_Lancto_Empresa` (`id_empresa`),
  CONSTRAINT `FK_Lancto_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`),
  CONSTRAINT `FK_Lancto_Natureza` FOREIGN KEY (`id_natureza`) REFERENCES `natureza` (`id_natureza`),
  CONSTRAINT `FK_Lancto_UnidadeNegocio` FOREIGN KEY (`id_unidade_negocio`) REFERENCES `unidadenegocio` (`id_unidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lancto`
--

LOCK TABLES `lancto` WRITE;
/*!40000 ALTER TABLE `lancto` DISABLE KEYS */;
/*!40000 ALTER TABLE `lancto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lanctoregimecaixa`
--

DROP TABLE IF EXISTS `lanctoregimecaixa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lanctoregimecaixa` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  CONSTRAINT `lanctoregimecaixa_ibfk_1` FOREIGN KEY (`id`) REFERENCES `lancto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lanctoregimecaixa`
--

LOCK TABLES `lanctoregimecaixa` WRITE;
/*!40000 ALTER TABLE `lanctoregimecaixa` DISABLE KEYS */;
/*!40000 ALTER TABLE `lanctoregimecaixa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lanctoregimecompetencia`
--

DROP TABLE IF EXISTS `lanctoregimecompetencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lanctoregimecompetencia` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  CONSTRAINT `lanctoregimecompetencia_ibfk_1` FOREIGN KEY (`id`) REFERENCES `lancto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lanctoregimecompetencia`
--

LOCK TABLES `lanctoregimecompetencia` WRITE;
/*!40000 ALTER TABLE `lanctoregimecompetencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `lanctoregimecompetencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead`
--

DROP TABLE IF EXISTS `lead`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lead` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data` datetime NOT NULL,
  `id_empresa` bigint(20) NOT NULL,
  `id_pessoa` bigint(20) NOT NULL,
  `id_proprietario` bigint(20) NOT NULL,
  `descricao` varchar(1000) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `motivo_cancelamento` varchar(200) DEFAULT NULL,
  `id_motivoperdavenda` int(11) DEFAULT NULL,
  `id_tipolead` int(11) DEFAULT NULL,
  `confianca` int(11) DEFAULT NULL,
  `fechamento` datetime DEFAULT NULL,
  `id_concorrente` int(11) DEFAULT NULL,
  `id_motivo_fechamento` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Lead_Empresa` (`id_empresa`),
  KEY `FK_Lead_PessoaClienteFornecedor` (`id_pessoa`),
  KEY `FK_Lead_PessoaFuncionario` (`id_proprietario`),
  KEY `FK_Lead_MotivoPerdaVenda` (`id_motivoperdavenda`),
  KEY `FK_Lead_TipoLead` (`id_tipolead`),
  KEY `FK_Lead_Concorrente` (`id_concorrente`),
  KEY `FK_Lead_Motivofechamento` (`id_motivo_fechamento`),
  CONSTRAINT `FK_Lead_Concorrente` FOREIGN KEY (`id_concorrente`) REFERENCES `concorrente` (`id`),
  CONSTRAINT `FK_Lead_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`),
  CONSTRAINT `FK_Lead_Motivofechamento` FOREIGN KEY (`id_motivo_fechamento`) REFERENCES `motivo_fechamento_venda` (`id`),
  CONSTRAINT `FK_Lead_PessoaClienteFornecedor` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id`),
  CONSTRAINT `FK_Lead_PessoaFuncionario` FOREIGN KEY (`id_proprietario`) REFERENCES `pessoa` (`id`),
  CONSTRAINT `lead_ibfk_1` FOREIGN KEY (`id_motivoperdavenda`) REFERENCES `motivoperdavenda` (`id`),
  CONSTRAINT `lead_ibfk_2` FOREIGN KEY (`id_tipolead`) REFERENCES `tipolead` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead`
--

LOCK TABLES `lead` WRITE;
/*!40000 ALTER TABLE `lead` DISABLE KEYS */;
/*!40000 ALTER TABLE `lead` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logcnab`
--

DROP TABLE IF EXISTS `logcnab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logcnab` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data` datetime DEFAULT NULL,
  `id_titulo` bigint(20) NOT NULL,
  `tipomovimentacao` char(5) DEFAULT NULL,
  `id_instrucaoaobanco` int(11) NOT NULL,
  `id_lote` int(11) DEFAULT NULL,
  `id_motivorejeicaobanco` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_LogCNAB_Titulo` (`id_titulo`),
  KEY `FK_LogCNAB_Instrucaoaobanco` (`id_instrucaoaobanco`),
  KEY `FK_LogCNAB_LoteRemessa` (`id_lote`),
  KEY `FK_Logcnab__MotivoRejeicaoBanco` (`id_motivorejeicaobanco`),
  CONSTRAINT `logcnab_ibfk_1` FOREIGN KEY (`id_titulo`) REFERENCES `titulo` (`id_titulo`),
  CONSTRAINT `logcnab_ibfk_2` FOREIGN KEY (`id_instrucaoaobanco`) REFERENCES `instrucaoaobanco` (`id`),
  CONSTRAINT `logcnab_ibfk_3` FOREIGN KEY (`id_lote`) REFERENCES `loteremessa` (`id`),
  CONSTRAINT `logcnab_ibfk_4` FOREIGN KEY (`id_motivorejeicaobanco`) REFERENCES `gw_global`.`gw_motivo_rejeicao_banco` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logcnab`
--

LOCK TABLES `logcnab` WRITE;
/*!40000 ALTER TABLE `logcnab` DISABLE KEYS */;
/*!40000 ALTER TABLE `logcnab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lote`
--

DROP TABLE IF EXISTS `lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` bigint(20) NOT NULL,
  `data` datetime DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `tipoNf` varchar(15) DEFAULT NULL,
  `enviaEmail` bit(1) DEFAULT NULL,
  `justificativa_cancelamento` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_lote_empresa` (`id_empresa`),
  CONSTRAINT `fk_lote_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lote`
--

LOCK TABLES `lote` WRITE;
/*!40000 ALTER TABLE `lote` DISABLE KEYS */;
/*!40000 ALTER TABLE `lote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lotemensagem`
--

DROP TABLE IF EXISTS `lotemensagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lotemensagem` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_empresa` bigint(20) NOT NULL,
  `data_hora` datetime DEFAULT NULL,
  `tipo` char(1) DEFAULT NULL,
  `user_login` bigint(20) DEFAULT NULL,
  `avulsa_lote` char(1) DEFAULT NULL,
  `assunto` varchar(500) DEFAULT NULL,
  `numero_msg` bigint(20) DEFAULT NULL,
  `total_sucesso` int(11) DEFAULT NULL,
  `total_falha` int(11) DEFAULT NULL,
  `total_confirmado` int(11) DEFAULT NULL,
  `status_lote` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_LoteMensagem_Empresa` (`id_empresa`),
  CONSTRAINT `FK_LoteMensagem_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lotemensagem`
--

LOCK TABLES `lotemensagem` WRITE;
/*!40000 ALTER TABLE `lotemensagem` DISABLE KEYS */;
/*!40000 ALTER TABLE `lotemensagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lotenota`
--

DROP TABLE IF EXISTS `lotenota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lotenota` (
  `id_lote` int(11) NOT NULL,
  `id_fatura` bigint(20) NOT NULL,
  `xmlPath` varchar(255) NOT NULL,
  `processada` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id_lote`,`id_fatura`),
  KEY `FK_Lotenota_Fatura` (`id_fatura`),
  KEY `FK_Lotenota_Lote` (`id_lote`),
  CONSTRAINT `FK_Lotenota_Fatura` FOREIGN KEY (`id_fatura`) REFERENCES `fatura` (`id`),
  CONSTRAINT `FK_Lotenota_Lote` FOREIGN KEY (`id_lote`) REFERENCES `lote` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lotenota`
--

LOCK TABLES `lotenota` WRITE;
/*!40000 ALTER TABLE `lotenota` DISABLE KEYS */;
/*!40000 ALTER TABLE `lotenota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loteremessa`
--

DROP TABLE IF EXISTS `loteremessa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loteremessa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_conta` int(11) NOT NULL,
  `nomearquivo` varchar(50) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_LoteRemessa_ContaBanco` (`id_conta`),
  CONSTRAINT `FK_LoteRemessa_ContaBanco` FOREIGN KEY (`id_conta`) REFERENCES `contabanco` (`id_conta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loteremessa`
--

LOCK TABLES `loteremessa` WRITE;
/*!40000 ALTER TABLE `loteremessa` DISABLE KEYS */;
/*!40000 ALTER TABLE `loteremessa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcafogo`
--

DROP TABLE IF EXISTS `marcafogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marcafogo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data` datetime DEFAULT NULL,
  `id_item` bigint(20) DEFAULT NULL,
  `id_pneu` bigint(20) DEFAULT NULL,
  `id_mov_item` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Marcafogo_Item` (`id_item`),
  KEY `FK_Marcafogo_Pneu` (`id_pneu`),
  KEY `FK_Marcafogo_Movitem` (`id_mov_item`),
  CONSTRAINT `FK_Marcafogo_Item` FOREIGN KEY (`id_item`) REFERENCES `item` (`id`),
  CONSTRAINT `FK_Marcafogo_Movitem` FOREIGN KEY (`id_mov_item`) REFERENCES `movitem` (`id`),
  CONSTRAINT `FK_Marcafogo_Pneu` FOREIGN KEY (`id_pneu`) REFERENCES `pneu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcafogo`
--

LOCK TABLES `marcafogo` WRITE;
/*!40000 ALTER TABLE `marcafogo` DISABLE KEYS */;
/*!40000 ALTER TABLE `marcafogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensagem`
--

DROP TABLE IF EXISTS `mensagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mensagem` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data_hora_envio` datetime DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `nome_remetente` varchar(250) DEFAULT NULL,
  `nome_destinatario` varchar(250) DEFAULT NULL,
  `tipo` char(1) DEFAULT NULL,
  `msg_from` varchar(250) DEFAULT NULL,
  `msg_to` varchar(250) DEFAULT NULL,
  `discr` varchar(100) DEFAULT NULL,
  `id_lote` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Mensagem_LoteMensagem` (`id_lote`),
  CONSTRAINT `FK_Mensagem_LoteMensagem` FOREIGN KEY (`id_lote`) REFERENCES `lotemensagem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensagem`
--

LOCK TABLES `mensagem` WRITE;
/*!40000 ALTER TABLE `mensagem` DISABLE KEYS */;
/*!40000 ALTER TABLE `mensagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelocarta`
--

DROP TABLE IF EXISTS `modelocarta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modelocarta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) DEFAULT NULL,
  `modelo` varchar(100) DEFAULT NULL,
  `ativo` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelocarta`
--

LOCK TABLES `modelocarta` WRITE;
/*!40000 ALTER TABLE `modelocarta` DISABLE KEYS */;
/*!40000 ALTER TABLE `modelocarta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelocontrato`
--

DROP TABLE IF EXISTS `modelocontrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modelocontrato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) DEFAULT NULL,
  `modelo` varchar(100) DEFAULT NULL,
  `ativo` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelocontrato`
--

LOCK TABLES `modelocontrato` WRITE;
/*!40000 ALTER TABLE `modelocontrato` DISABLE KEYS */;
INSERT INTO `modelocontrato` VALUES (1,'Modelo de contrato padrão','repository/modelos/modelocontrato.html','');
/*!40000 ALTER TABLE `modelocontrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monitor`
--

DROP TABLE IF EXISTS `monitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monitor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_fila` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_Monitor_Pessoa` FOREIGN KEY (`id`) REFERENCES `pessoa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monitor`
--

LOCK TABLES `monitor` WRITE;
/*!40000 ALTER TABLE `monitor` DISABLE KEYS */;
/*!40000 ALTER TABLE `monitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motivo_fechamento_venda`
--

DROP TABLE IF EXISTS `motivo_fechamento_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `motivo_fechamento_venda` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(200) NOT NULL,
  `id_empresa` bigint(20) DEFAULT NULL,
  `ativo` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`),
  KEY `MotivoFechamento_Empresa` (`id_empresa`),
  CONSTRAINT `MotivoFechamento_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motivo_fechamento_venda`
--

LOCK TABLES `motivo_fechamento_venda` WRITE;
/*!40000 ALTER TABLE `motivo_fechamento_venda` DISABLE KEYS */;
/*!40000 ALTER TABLE `motivo_fechamento_venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motivobonificacao`
--

DROP TABLE IF EXISTS `motivobonificacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `motivobonificacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` bigint(20) NOT NULL,
  `motivo` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_MotivoBonificacao_Empresa` (`id_empresa`),
  CONSTRAINT `FK_MotivoBonificacao_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motivobonificacao`
--

LOCK TABLES `motivobonificacao` WRITE;
/*!40000 ALTER TABLE `motivobonificacao` DISABLE KEYS */;
INSERT INTO `motivobonificacao` VALUES (1,1,'Cliente antigo'),(2,1,'Contrato com margem'),(3,1,'Empresa com pendências com o cliente'),(4,1,'Outros');
/*!40000 ALTER TABLE `motivobonificacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motivoperdavenda`
--

DROP TABLE IF EXISTS `motivoperdavenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `motivoperdavenda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` char(255) DEFAULT NULL,
  `ativo` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motivoperdavenda`
--

LOCK TABLES `motivoperdavenda` WRITE;
/*!40000 ALTER TABLE `motivoperdavenda` DISABLE KEYS */;
/*!40000 ALTER TABLE `motivoperdavenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motivorejeicaoinstrucaoaobanco`
--

DROP TABLE IF EXISTS `motivorejeicaoinstrucaoaobanco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `motivorejeicaoinstrucaoaobanco` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_instrucaoaobanco` int(11) NOT NULL,
  `id_motivorejeicaobanco` int(11) NOT NULL,
  `observacao` char(100) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_MotivoRejeicaoInstrucaoAoBanco_InstrucaoAoBanco` (`id_instrucaoaobanco`),
  KEY `FK_MotivoRejeicaoInstrucaoAoBanco_MotivoRejeicaoBanco` (`id_motivorejeicaobanco`),
  CONSTRAINT `FK_MotivoRejeicaoInstrucaoAoBanco_InstrucaoAoBanco` FOREIGN KEY (`id_instrucaoaobanco`) REFERENCES `instrucaoaobanco` (`id`),
  CONSTRAINT `FK_MotivoRejeicaoInstrucaoAoBanco_MotivoRejeicaoBanco` FOREIGN KEY (`id_motivorejeicaobanco`) REFERENCES `gw_global`.`gw_motivo_rejeicao_banco` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motivorejeicaoinstrucaoaobanco`
--

LOCK TABLES `motivorejeicaoinstrucaoaobanco` WRITE;
/*!40000 ALTER TABLE `motivorejeicaoinstrucaoaobanco` DISABLE KEYS */;
/*!40000 ALTER TABLE `motivorejeicaoinstrucaoaobanco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motorista`
--

DROP TABLE IF EXISTS `motorista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `motorista` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `FK_Motorista_Pessoa` (`id`),
  CONSTRAINT `FK_Motorista_Pessoa` FOREIGN KEY (`id`) REFERENCES `pessoa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motorista`
--

LOCK TABLES `motorista` WRITE;
/*!40000 ALTER TABLE `motorista` DISABLE KEYS */;
/*!40000 ALTER TABLE `motorista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movcaixa`
--

DROP TABLE IF EXISTS `movcaixa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movcaixa` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_empresa` bigint(20) NOT NULL,
  `data` datetime NOT NULL,
  `descricao` varchar(500) NOT NULL,
  `id_conta` int(11) NOT NULL,
  `id_titulo` bigint(20) NOT NULL,
  `credito_debito` char(1) NOT NULL,
  `valor` float NOT NULL,
  `conciliado` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `FK_Movcaixa_Conta` (`id_conta`),
  KEY `FK_Movcaixa_Empresa` (`id_empresa`),
  KEY `FK_Movcaixa_Titulo` (`id_titulo`),
  CONSTRAINT `FK_Movcaixa_Conta` FOREIGN KEY (`id_conta`) REFERENCES `conta` (`id_conta`),
  CONSTRAINT `FK_Movcaixa_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`),
  CONSTRAINT `FK_Movcaixa_Titulo` FOREIGN KEY (`id_titulo`) REFERENCES `titulo` (`id_titulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movcaixa`
--

LOCK TABLES `movcaixa` WRITE;
/*!40000 ALTER TABLE `movcaixa` DISABLE KEYS */;
/*!40000 ALTER TABLE `movcaixa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movconta`
--

DROP TABLE IF EXISTS `movconta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movconta` (
  `id_mov_conta` bigint(20) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(500) NOT NULL,
  `valor` float NOT NULL,
  `credito_debito` char(1) NOT NULL,
  `id_empresa` bigint(20) NOT NULL,
  `id_conta` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `conciliado` bit(1) NOT NULL DEFAULT b'0',
  `id_mov_financeira` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_mov_conta`),
  KEY `FK_MovConta_Conta` (`id_conta`),
  KEY `FK_MovConta_Empresa` (`id_empresa`),
  KEY `FK_MovConta_MovFinanceira` (`id_mov_financeira`),
  CONSTRAINT `FK_MovConta_Conta` FOREIGN KEY (`id_conta`) REFERENCES `conta` (`id_conta`),
  CONSTRAINT `FK_MovConta_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`),
  CONSTRAINT `FK_MovConta_MovFinanceira` FOREIGN KEY (`id_mov_financeira`) REFERENCES `movfinanceira` (`id_mov_financeira`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movconta`
--

LOCK TABLES `movconta` WRITE;
/*!40000 ALTER TABLE `movconta` DISABLE KEYS */;
/*!40000 ALTER TABLE `movconta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movcontrato`
--

DROP TABLE IF EXISTS `movcontrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movcontrato` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_aditivo` bigint(20) NOT NULL,
  `id_item` bigint(20) DEFAULT NULL,
  `quantidade` float DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `valor_locacao` float DEFAULT NULL,
  `entrada_saida` char(1) DEFAULT NULL,
  `comentario` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_MovAditivo_Aditivo` (`id_aditivo`),
  KEY `FK_MovAditivo_Item` (`id_item`),
  CONSTRAINT `FK_MovAditivo_Aditivo` FOREIGN KEY (`id_aditivo`) REFERENCES `aditivo` (`id`),
  CONSTRAINT `FK_MovAditivo_Item` FOREIGN KEY (`id_item`) REFERENCES `item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movcontrato`
--

LOCK TABLES `movcontrato` WRITE;
/*!40000 ALTER TABLE `movcontrato` DISABLE KEYS */;
/*!40000 ALTER TABLE `movcontrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movfinanceira`
--

DROP TABLE IF EXISTS `movfinanceira`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movfinanceira` (
  `id_mov_financeira` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_titulo` bigint(20) NOT NULL,
  `data` datetime NOT NULL,
  `tipo_ocorrencia` varchar(4) NOT NULL,
  `historico` varchar(500) NOT NULL,
  `valor` float NOT NULL,
  `debito_credito` char(1) NOT NULL,
  `id_empresa` bigint(20) NOT NULL,
  `id_conta_ocorrencia` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_mov_financeira`),
  KEY `FK_MovFinanceira_Titulo` (`id_titulo`),
  KEY `FK_MovFinanceira_TipoOcorrencia` (`tipo_ocorrencia`),
  KEY `FK_MovFinanceira_Empresa` (`id_empresa`),
  CONSTRAINT `FK_MovFinanceira_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`),
  CONSTRAINT `FK_MovFinanceira_TipoOcorrencia` FOREIGN KEY (`tipo_ocorrencia`) REFERENCES `tipoocorrencia` (`tipo_ocorrencia`),
  CONSTRAINT `FK_MovFinanceira_Titulo` FOREIGN KEY (`id_titulo`) REFERENCES `titulo` (`id_titulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movfinanceira`
--

LOCK TABLES `movfinanceira` WRITE;
/*!40000 ALTER TABLE `movfinanceira` DISABLE KEYS */;
/*!40000 ALTER TABLE `movfinanceira` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movitem`
--

DROP TABLE IF EXISTS `movitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movitem` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data` datetime NOT NULL,
  `id_empresa` bigint(20) NOT NULL,
  `entrada_saida` bit(1) NOT NULL,
  `historico` varchar(500) NOT NULL,
  `quantidade` float NOT NULL,
  `id_unidade_estoque` bigint(20) DEFAULT NULL,
  `id_item` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_MovItem_UnidadeEstoque` (`id_unidade_estoque`),
  KEY `FK_MovItem_Item` (`id_item`),
  KEY `FK_MovItem_Empresa` (`id_empresa`),
  CONSTRAINT `FK_MovItem_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`),
  CONSTRAINT `FK_MovItem_Item` FOREIGN KEY (`id_item`) REFERENCES `item` (`id`),
  CONSTRAINT `FK_MovItem_UnidadeEstoque` FOREIGN KEY (`id_unidade_estoque`) REFERENCES `unidadeestoque` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movitem`
--

LOCK TABLES `movitem` WRITE;
/*!40000 ALTER TABLE `movitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `movitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movitemos`
--

DROP TABLE IF EXISTS `movitemos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movitemos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_MovOs` bigint(20) NOT NULL,
  `id_item` bigint(20) NOT NULL,
  `quantidade_solicitada` float DEFAULT NULL,
  `id_unidade_estoque` bigint(20) DEFAULT NULL,
  `valor_bonificado` float DEFAULT NULL,
  `preco` float DEFAULT NULL,
  `quantidade_aprovada` float DEFAULT '0',
  `id_motivo_bonificacao` int(11) DEFAULT NULL,
  `finalidade` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `MovItemOS_MovOS` (`id_MovOs`),
  KEY `MovItemOS_Item` (`id_item`),
  KEY `MovItemOS_UnidadeEstoque` (`id_unidade_estoque`),
  KEY `FK_MovItemOs_MotivoBonificacao` (`id_motivo_bonificacao`),
  CONSTRAINT `FK_MovItemOs_MotivoBonificacao` FOREIGN KEY (`id_motivo_bonificacao`) REFERENCES `motivobonificacao` (`id`),
  CONSTRAINT `MovItemOS_Item` FOREIGN KEY (`id_item`) REFERENCES `item` (`id`),
  CONSTRAINT `MovItemOS_MovOS` FOREIGN KEY (`id_MovOs`) REFERENCES `movos` (`id`),
  CONSTRAINT `MovItemOS_UnidadeEstoque` FOREIGN KEY (`id_unidade_estoque`) REFERENCES `unidadeestoque` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movitemos`
--

LOCK TABLES `movitemos` WRITE;
/*!40000 ALTER TABLE `movitemos` DISABLE KEYS */;
/*!40000 ALTER TABLE `movitemos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movos`
--

DROP TABLE IF EXISTS `movos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_os` bigint(20) NOT NULL,
  `data` datetime DEFAULT NULL,
  `id_tecnico` bigint(20) DEFAULT NULL,
  `saida_entrada` char(1) DEFAULT NULL,
  `id_almoxarife` bigint(20) DEFAULT NULL,
  `retirado` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `MovOS_OS` (`id_os`),
  KEY `MovOS_Tecnico` (`id_tecnico`),
  KEY `MovOS_Pessoa` (`id_almoxarife`),
  CONSTRAINT `MovOS_OS` FOREIGN KEY (`id_os`) REFERENCES `ordemservico` (`id`),
  CONSTRAINT `MovOS_Pessoa` FOREIGN KEY (`id_almoxarife`) REFERENCES `pessoa` (`id`),
  CONSTRAINT `MovOS_Tecnico` FOREIGN KEY (`id_tecnico`) REFERENCES `pessoa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movos`
--

LOCK TABLES `movos` WRITE;
/*!40000 ALTER TABLE `movos` DISABLE KEYS */;
/*!40000 ALTER TABLE `movos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `natureza`
--

DROP TABLE IF EXISTS `natureza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `natureza` (
  `id_natureza` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) DEFAULT NULL,
  `id_natureza_pai` int(11) DEFAULT NULL,
  `ativa` bit(1) DEFAULT NULL,
  `num_natureza` varchar(5000) DEFAULT NULL,
  `count_classificacao` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_natureza`),
  KEY `FK_Natureza_Natureza` (`id_natureza_pai`),
  CONSTRAINT `FK_Natureza_Natureza` FOREIGN KEY (`id_natureza_pai`) REFERENCES `natureza` (`id_natureza`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `natureza`
--

LOCK TABLES `natureza` WRITE;
/*!40000 ALTER TABLE `natureza` DISABLE KEYS */;
INSERT INTO `natureza` VALUES (1,'Receitas',NULL,'','00001',0),(2,'Despesas',NULL,'','00002',0),(3,'Empréstimo/Adiantamentos',NULL,'','00003',0),(4,'Venda de produtos',1,'','00001.00001',0),(5,'Pessoal',2,'','00002.00001',0),(6,'Prestação de Serviços',1,'','00001.00002',0),(7,'Financeira',2,'','00002.00002',0),(8,'Financeira',1,'','00001.00003',0),(9,'Administrativas',2,'','00002.00003',0),(10,'Expediente',2,'','00002.00004',0),(11,'Veículos',2,'','00002.00005',0),(12,'Marketing',2,'','00002.00006',0),(13,'Telefonia e internet',2,'','00002.00007',0),(14,'Salário',5,'','00002.00001.00001',0),(15,'13o. Salário',5,'','00002.00001.00002',0),(16,'FGTS',5,'','00002.00001.00003',0),(17,'Rescisão',5,'','00002.00001.00004',0),(18,'Convênio médico',5,'','00002.00001.00005',0),(19,'Viagens e estadias',5,'','00002.00001.00006',0),(20,'Vale alimentação',5,'','00002.00001.00007',0),(21,'Férias',5,'','00002.00001.00008',0),(22,'Juros',7,'','00002.00002.00001',0),(23,'Multas',7,'','00002.00002.00002',0),(24,'Aplicações',7,'','00002.00002.00003',0),(25,'Seguro',9,'','00002.00003.00001',0),(26,'Material de limpeza',9,'','00002.00003.00002',0),(27,'Material de escritório',9,'','00002.00003.00003',0),(28,'Telefonia fixa',13,'','00002.00007.00001',0),(29,'Telefonia móvel',13,'','00002.00007.00002',0),(30,'Link',13,'','00002.00007.00003',0),(31,'Rádio e TV',12,'','00002.00006.00001',0),(32,'Patrocínio',12,'','00002.00006.00002',0),(33,'Google',12,'','00002.00006.00003',0),(34,'Carros',11,'','00002.00005.00001',0),(35,'Motos',11,'','00002.00005.00002',0),(36,'Oficina',34,'','00002.00005.00001.00001',0),(37,'Combustível',34,'','00002.00005.00001.00002',0),(38,'Outras despesas com carros',34,'','00002.00005.00001.00003',0),(39,'Oficina',35,'','00002.00005.00002.00001',0),(40,'Combustível',35,'','00002.00005.00002.00002',0),(41,'Outras despesas com motos',35,'','00002.00005.00002.00003',0),(42,'Tarifas bancárias',7,'','00002.00002.00004',0),(43,'Vale transporte',5,'','00002.00001.00009',0),(44,'Correios',9,'','00002.00003.00004',0),(45,'Fretes',9,'','00002.00003.00005',0),(46,'Energia',9,'','00002.00003.00006',0),(47,'Água e esgoto',9,'','00002.00003.00007',0),(48,'Honorários contábeis',9,'','00002.00003.00008',0),(49,'Bonificações',5,'','00002.00001.00010',0),(50,'Consultas SERASA',9,'','00002.00003.00009',0),(51,'Estacionamento',9,'','00002.00003.00010',0),(52,'Cursos e eventos',5,'','00002.00001.00011',0),(53,'Aquisição de bens',2,'','00002.00008',0),(54,'Móveis e equipamentos',53,'','00002.00008.00001',0),(55,'Veículos',53,'','00002.00008.00002',0),(56,'Lista telefônica',12,'','00002.00006.00004',0),(57,'Uniformes',5,'','00002.00001.00012',0),(58,'Chips GPRS',13,'','00002.00007.00004',0),(59,'IOF',7,'','00002.00002.00005',0),(60,'DOC/TED',7,'','00002.00002.00006',0),(61,'Geral',9,'','00002.00003.00011',0),(62,'Juros recebidos',8,'','00001.00003.00001',0),(63,'Empréstimo',3,'','00003.00001',0),(64,'A pagar',63,'','00003.00001.00001',0),(65,'A receber',63,'','00003.00001.00002',0),(69,'Estoque',2,'','00002.00009',0),(70,'Impostos',2,'','00002.00010',0),(71,'CMV',69,'','00002.00009.00001',0),(72,'Inventário',69,'','00002.00009.00002',0),(73,'Simples nacional',70,'','00002.00010.00001',0),(74,'ISS',70,'','00002.00010.00002',0),(75,'ISS retido',70,'','00002.00010.00003',0),(76,'ICMS',70,'','00002.00010.00004',0),(77,'IPI',70,'','00002.00010.00005',0),(78,'PIS',70,'','00002.00010.00006',0),(79,'COFINS',70,'','00002.00010.00007',0),(80,'CSLL',70,'','00002.00010.00008',0),(81,'IRPJ',70,'','00002.00010.00009',0),(82,'Outros',4,'','00001.00001.00001',0),(83,'Outros',6,'','00001.00002.00001',0),(84,'Receitas a detalhar',8,'','00001.00003.00002',0),(85,'Despesas a detalhar',7,'','00002.00002.00007',0),(86,'Descontos concedidos',8,'','00001.00003.00003',0),(87,'Descontos recebidos',7,'','00002.00002.00008',0),(88,'Juros recebidos',8,'','00001.00003.00004',0),(89,'Juros pagos',7,'','00002.00002.00009',0),(90,'Multas recebidas',8,'','00001.00003.00005',0),(91,'Multas pagas',7,'','00002.00002.00010',0);
/*!40000 ALTER TABLE `natureza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nossainstrucao`
--

DROP TABLE IF EXISTS `nossainstrucao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nossainstrucao` (
  `id` int(11) NOT NULL,
  `descricao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nossainstrucao`
--

LOCK TABLES `nossainstrucao` WRITE;
/*!40000 ALTER TABLE `nossainstrucao` DISABLE KEYS */;
INSERT INTO `nossainstrucao` VALUES (1,'envio de cobrança registrado'),(2,'prorrogação ou alteração de vencimento'),(3,'quitação ou cancelamento'),(4,'sustar protesto'),(5,'alteração de outros dados'),(6,'envio de cobrança não registrado'),(7,'protesto');
/*!40000 ALTER TABLE `nossainstrucao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nota`
--

DROP TABLE IF EXISTS `nota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nota` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_empresa` bigint(20) NOT NULL,
  `num_nota` bigint(20) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `xml_envio` text,
  `xml_recibo` text,
  `recibo` varchar(200) DEFAULT NULL,
  `discr` varchar(100) DEFAULT NULL,
  `sucesso` bit(1) DEFAULT NULL,
  `id_fatura` bigint(20) DEFAULT NULL,
  `xml_cancelamento` text,
  `data_geracao` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Nota_Empresa` (`id_empresa`),
  KEY `FK_Nota_Fatura` (`id_fatura`),
  CONSTRAINT `FK_Nota_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`),
  CONSTRAINT `nota_ibfk_1` FOREIGN KEY (`id_fatura`) REFERENCES `fatura` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nota`
--

LOCK TABLES `nota` WRITE;
/*!40000 ALTER TABLE `nota` DISABLE KEYS */;
/*!40000 ALTER TABLE `nota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notaproduto`
--

DROP TABLE IF EXISTS `notaproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notaproduto` (
  `id` bigint(20) NOT NULL,
  `ident_nfe` varchar(44) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_NotaProduto_Nota` FOREIGN KEY (`id`) REFERENCES `nota` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notaproduto`
--

LOCK TABLES `notaproduto` WRITE;
/*!40000 ALTER TABLE `notaproduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `notaproduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notaservico`
--

DROP TABLE IF EXISTS `notaservico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notaservico` (
  `id` bigint(20) NOT NULL,
  `numero_lote` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_NotaServico_Nota` FOREIGN KEY (`id`) REFERENCES `nota` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notaservico`
--

LOCK TABLES `notaservico` WRITE;
/*!40000 ALTER TABLE `notaservico` DISABLE KEYS */;
/*!40000 ALTER TABLE `notaservico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordemservico`
--

DROP TABLE IF EXISTS `ordemservico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordemservico` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_empresa` bigint(20) NOT NULL,
  `data` datetime NOT NULL,
  `id_tecnico_proprietario` bigint(20) DEFAULT NULL,
  `id_unidade_negocio` int(11) DEFAULT NULL,
  `id_cliente` bigint(20) NOT NULL,
  `status` varchar(100) NOT NULL,
  `contato_local` varchar(100) DEFAULT NULL,
  `descricao` varchar(500) DEFAULT NULL,
  `sla` int(11) DEFAULT NULL,
  `status_cobranca` char(1) DEFAULT NULL,
  `id_proposta` bigint(20) DEFAULT NULL,
  `id_contrato` bigint(20) DEFAULT NULL,
  `id_fatura` bigint(20) DEFAULT NULL,
  `inicio_atendimento` datetime DEFAULT NULL,
  `id_tipoos` int(11) DEFAULT NULL,
  `id_responsavel` int(11) DEFAULT NULL,
  `id_contaalarme` bigint(20) DEFAULT NULL,
  `id_contaveiculo` bigint(20) DEFAULT NULL,
  `id_pedido_venda` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_OrdemServico_Empresa` (`id_empresa`),
  KEY `FK_OrdemServico_Tecnico` (`id_tecnico_proprietario`),
  KEY `FK_OrdemServico_UnidadeNegocio` (`id_unidade_negocio`),
  KEY `FK_OrdemServico_Cliente` (`id_cliente`),
  KEY `FK_OrdemServico_Proposta` (`id_proposta`),
  KEY `FK_Ordemservico_Contrato` (`id_contrato`),
  KEY `FK_OrdemServico_Fatura` (`id_fatura`),
  KEY `FK_OrdemServico_Conta_alarme` (`id_contaalarme`),
  KEY `FK_OrdemServico_Conta_veiculo` (`id_contaveiculo`),
  KEY `FK_OrdemServico_PedidoVenda` (`id_pedido_venda`),
  CONSTRAINT `FK_OrdemServico_Cliente` FOREIGN KEY (`id_cliente`) REFERENCES `pessoa` (`id`),
  CONSTRAINT `FK_OrdemServico_Conta_alarme` FOREIGN KEY (`id_contaalarme`) REFERENCES `conta_alarme` (`id`),
  CONSTRAINT `FK_OrdemServico_Conta_veiculo` FOREIGN KEY (`id_contaveiculo`) REFERENCES `conta_veiculo` (`id`),
  CONSTRAINT `FK_Ordemservico_Contrato` FOREIGN KEY (`id_contrato`) REFERENCES `contrato` (`id`),
  CONSTRAINT `FK_OrdemServico_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`),
  CONSTRAINT `FK_OrdemServico_Fatura` FOREIGN KEY (`id_fatura`) REFERENCES `fatura` (`id`),
  CONSTRAINT `FK_OrdemServico_PedidoVenda` FOREIGN KEY (`id_pedido_venda`) REFERENCES `pedidovenda` (`id`),
  CONSTRAINT `FK_OrdemServico_Proposta` FOREIGN KEY (`id_proposta`) REFERENCES `proposta` (`id`),
  CONSTRAINT `FK_OrdemServico_Tecnico` FOREIGN KEY (`id_tecnico_proprietario`) REFERENCES `pessoa` (`id`),
  CONSTRAINT `FK_OrdemServico_UnidadeNegocio` FOREIGN KEY (`id_unidade_negocio`) REFERENCES `unidadenegocio` (`id_unidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordemservico`
--

LOCK TABLES `ordemservico` WRITE;
/*!40000 ALTER TABLE `ordemservico` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordemservico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paginadocto`
--

DROP TABLE IF EXISTS `paginadocto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paginadocto` (
  `id_documento` bigint(20) NOT NULL,
  `arquivo` varchar(200) NOT NULL,
  PRIMARY KEY (`id_documento`),
  KEY `FK_PaginaDocto_Documento` (`id_documento`),
  CONSTRAINT `FK_PaginaDocto_Documento` FOREIGN KEY (`id_documento`) REFERENCES `documento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paginadocto`
--

LOCK TABLES `paginadocto` WRITE;
/*!40000 ALTER TABLE `paginadocto` DISABLE KEYS */;
/*!40000 ALTER TABLE `paginadocto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parcelaproposta`
--

DROP TABLE IF EXISTS `parcelaproposta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parcelaproposta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_proposta` bigint(20) NOT NULL,
  `valor` float DEFAULT NULL,
  `prazo_dias` bigint(20) NOT NULL DEFAULT '30',
  `tipo_documento` varchar(45) NOT NULL,
  KEY `id` (`id`),
  KEY `Parcelaproposta_Proposta` (`id_proposta`),
  CONSTRAINT `Parcelaproposta_Proposta` FOREIGN KEY (`id_proposta`) REFERENCES `proposta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parcelaproposta`
--

LOCK TABLES `parcelaproposta` WRITE;
/*!40000 ALTER TABLE `parcelaproposta` DISABLE KEYS */;
/*!40000 ALTER TABLE `parcelaproposta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patrimonio`
--

DROP TABLE IF EXISTS `patrimonio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patrimonio` (
  `id` bigint(20) NOT NULL,
  `permite_locacao` bit(1) NOT NULL DEFAULT b'0',
  `veiculo` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`),
  CONSTRAINT `Patrimonio_Item` FOREIGN KEY (`id`) REFERENCES `item` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patrimonio`
--

LOCK TABLES `patrimonio` WRITE;
/*!40000 ALTER TABLE `patrimonio` DISABLE KEYS */;
/*!40000 ALTER TABLE `patrimonio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidocompra`
--

DROP TABLE IF EXISTS `pedidocompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidocompra` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data` datetime DEFAULT NULL,
  `id_empresa` bigint(20) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `id_fornecedor` bigint(20) DEFAULT NULL,
  `id_cotacao` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_PedidoCompra_Empresa` (`id_empresa`),
  KEY `FK_PedidoCompra_Fornecedor` (`id_fornecedor`),
  KEY `FK_PedidoCompra_Cotacao` (`id_cotacao`),
  CONSTRAINT `FK_PedidoCompra_Cotacao` FOREIGN KEY (`id_cotacao`) REFERENCES `cotacao` (`id`),
  CONSTRAINT `FK_PedidoCompra_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`),
  CONSTRAINT `FK_PedidoCompra_Fornecedor` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidocompra`
--

LOCK TABLES `pedidocompra` WRITE;
/*!40000 ALTER TABLE `pedidocompra` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidocompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidocomprafatura`
--

DROP TABLE IF EXISTS `pedidocomprafatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidocomprafatura` (
  `id_pedido_compra` bigint(20) NOT NULL,
  `id_fatura` bigint(20) NOT NULL,
  PRIMARY KEY (`id_pedido_compra`,`id_fatura`),
  KEY `FK_PC_ES_Fatura` (`id_fatura`),
  CONSTRAINT `FK_PC_ES_Fatura` FOREIGN KEY (`id_fatura`) REFERENCES `fatura` (`id`),
  CONSTRAINT `FK_PC_ES_PedidoCompra` FOREIGN KEY (`id_pedido_compra`) REFERENCES `pedidocompra` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidocomprafatura`
--

LOCK TABLES `pedidocomprafatura` WRITE;
/*!40000 ALTER TABLE `pedidocomprafatura` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidocomprafatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidoos`
--

DROP TABLE IF EXISTS `pedidoos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidoos` (
  `id_os` bigint(20) NOT NULL,
  `id_pedido_venda` bigint(20) NOT NULL,
  PRIMARY KEY (`id_os`,`id_pedido_venda`),
  KEY `FK_PedidoOS_Ordemservico` (`id_os`),
  KEY `FK_PedidoOS_Pedidovenda` (`id_pedido_venda`),
  CONSTRAINT `FK_PedidoOS_Ordemservico` FOREIGN KEY (`id_os`) REFERENCES `ordemservico` (`id`),
  CONSTRAINT `FK_PedidoOS_Pedidovenda` FOREIGN KEY (`id_pedido_venda`) REFERENCES `pedidovenda` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidoos`
--

LOCK TABLES `pedidoos` WRITE;
/*!40000 ALTER TABLE `pedidoos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidoos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidovenda`
--

DROP TABLE IF EXISTS `pedidovenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidovenda` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data` datetime DEFAULT NULL,
  `id_vendedor` bigint(20) DEFAULT NULL,
  `status_faturamento` char(3) DEFAULT NULL,
  `id_cliente` bigint(20) DEFAULT NULL,
  `id_conta_contrato` bigint(20) DEFAULT NULL,
  `id_proposta` bigint(20) DEFAULT NULL,
  `id_os` bigint(20) DEFAULT NULL,
  `previsao_disponibilidade` datetime DEFAULT NULL,
  `saldo_adiantamento` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_PedidoVenda_Vendedor` (`id_vendedor`),
  KEY `FK_PedidoVenda_Cliente` (`id_cliente`),
  KEY `FK_PedidoVenda_Proposta` (`id_proposta`),
  KEY `FK_PedidoVenda_OrdemServico` (`id_os`),
  KEY `fk_pedidovenda_contacontrato` (`id_conta_contrato`),
  CONSTRAINT `FK_PedidoVenda_Cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`),
  CONSTRAINT `fk_pedidovenda_contacontrato` FOREIGN KEY (`id_conta_contrato`) REFERENCES `conta_contrato` (`id`),
  CONSTRAINT `FK_PedidoVenda_OrdemServico` FOREIGN KEY (`id_os`) REFERENCES `ordemservico` (`id`),
  CONSTRAINT `FK_PedidoVenda_Proposta` FOREIGN KEY (`id_proposta`) REFERENCES `proposta` (`id`),
  CONSTRAINT `FK_PedidoVenda_Vendedor` FOREIGN KEY (`id_vendedor`) REFERENCES `pessoa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidovenda`
--

LOCK TABLES `pedidovenda` WRITE;
/*!40000 ALTER TABLE `pedidovenda` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidovenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissoes`
--

DROP TABLE IF EXISTS `permissoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_grupo` int(11) DEFAULT NULL,
  `id_resource` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissoes`
--

LOCK TABLES `permissoes` WRITE;
/*!40000 ALTER TABLE `permissoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoa` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome_razao_social` varchar(130) NOT NULL,
  `nome_fantasia` varchar(130) DEFAULT NULL,
  `cliente` bit(1) NOT NULL DEFAULT b'0',
  `fornecedor` bit(1) NOT NULL DEFAULT b'0',
  `funcionario` bit(1) NOT NULL DEFAULT b'0',
  `prospect` bit(1) NOT NULL DEFAULT b'0',
  `ativo` bit(1) NOT NULL DEFAULT b'1',
  `observacao` varchar(1000) DEFAULT NULL,
  `cnpj` varchar(18) DEFAULT NULL,
  `rg` varchar(18) DEFAULT NULL,
  `cpf` varchar(18) DEFAULT NULL,
  `discr` varchar(50) DEFAULT NULL,
  `fisicajuridica` char(1) DEFAULT NULL,
  `telefone` varchar(18) DEFAULT NULL,
  `email` varchar(500) DEFAULT NULL,
  `cnh` varchar(18) DEFAULT NULL,
  `validade_cnh` datetime DEFAULT NULL,
  `id_gestor` bigint(20) DEFAULT NULL,
  `cli_gestor` bigint(20) DEFAULT NULL,
  `id_fontecaptacaocliente` int(11) DEFAULT NULL,
  `id_conta` int(11) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `data_cadastro` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Pessoa_FonteCaptacaoCliente` (`id_fontecaptacaocliente`),
  KEY `FK_Pessoa_Conta` (`id_conta`),
  CONSTRAINT `FK_Pessoa_Conta` FOREIGN KEY (`id_conta`) REFERENCES `conta` (`id_conta`),
  CONSTRAINT `pessoa_ibfk_1` FOREIGN KEY (`id_fontecaptacaocliente`) REFERENCES `fontecaptacaocliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES (1,'Techsec','Techsec','\0','\0','\0','\0','',NULL,NULL,NULL,NULL,'empresa','J','(067)3029-7004','techsec@techsec.com.br',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoacomercial`
--

DROP TABLE IF EXISTS `pessoacomercial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoacomercial` (
  `id` bigint(20) NOT NULL,
  `inscr_municipal` varchar(15) DEFAULT NULL,
  `inscr_estadual` varchar(15) DEFAULT NULL,
  `end_faturamento` bigint(20) DEFAULT NULL,
  `end_entrega` bigint(20) DEFAULT NULL,
  `end_cobranca` bigint(20) DEFAULT NULL,
  `end_correspondencia` bigint(20) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `PessoaComercial_fat_Endereco` (`end_faturamento`),
  KEY `PessoaComercial_ent_Endereco` (`end_entrega`),
  KEY `PessoaComercial_cob_Endereco` (`end_cobranca`),
  KEY `PessoaComercial_cor_Endereco` (`end_correspondencia`),
  CONSTRAINT `PessoaComercial_cob_Endereco` FOREIGN KEY (`end_cobranca`) REFERENCES `endereco` (`id`),
  CONSTRAINT `PessoaComercial_cor_Endereco` FOREIGN KEY (`end_correspondencia`) REFERENCES `endereco` (`id`),
  CONSTRAINT `PessoaComercial_ent_Endereco` FOREIGN KEY (`end_entrega`) REFERENCES `endereco` (`id`),
  CONSTRAINT `PessoaComercial_fat_Endereco` FOREIGN KEY (`end_faturamento`) REFERENCES `endereco` (`id`),
  CONSTRAINT `PessoaComercial_Pessoa` FOREIGN KEY (`id`) REFERENCES `pessoa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoacomercial`
--

LOCK TABLES `pessoacomercial` WRITE;
/*!40000 ALTER TABLE `pessoacomercial` DISABLE KEYS */;
INSERT INTO `pessoacomercial` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `pessoacomercial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pneu`
--

DROP TABLE IF EXISTS `pneu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pneu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `marca_fogo` varchar(256) DEFAULT NULL,
  `data_marca` datetime DEFAULT NULL,
  `id_item` bigint(20) DEFAULT NULL,
  `vida` varchar(1) DEFAULT NULL,
  `km_rodado` int(11) DEFAULT NULL,
  `id_posicao` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Pneu_Item` (`id_item`),
  KEY `FK_Pneu_Posicao` (`id_posicao`),
  CONSTRAINT `FK_Pneu_Item` FOREIGN KEY (`id_item`) REFERENCES `item` (`id`),
  CONSTRAINT `FK_Pneu_Posicao` FOREIGN KEY (`id_posicao`) REFERENCES `posicao` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pneu`
--

LOCK TABLES `pneu` WRITE;
/*!40000 ALTER TABLE `pneu` DISABLE KEYS */;
/*!40000 ALTER TABLE `pneu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posicao`
--

DROP TABLE IF EXISTS `posicao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posicao` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_eixo` bigint(20) DEFAULT NULL,
  `num_posicao` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Posicao_Eixo` (`id_eixo`),
  CONSTRAINT `FK_Posicao_Eixo` FOREIGN KEY (`id_eixo`) REFERENCES `eixo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posicao`
--

LOCK TABLES `posicao` WRITE;
/*!40000 ALTER TABLE `posicao` DISABLE KEYS */;
/*!40000 ALTER TABLE `posicao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posicaoveiculo`
--

DROP TABLE IF EXISTS `posicaoveiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posicaoveiculo` (
  `id_veiculo` bigint(20) NOT NULL,
  `id_posicao` bigint(20) NOT NULL AUTO_INCREMENT,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL,
  `datahora` datetime NOT NULL,
  PRIMARY KEY (`id_posicao`),
  KEY `FK_PosicaoVeiculo_Veiculo` (`id_veiculo`),
  CONSTRAINT `FK_PosicaoVeiculo_Veiculo` FOREIGN KEY (`id_veiculo`) REFERENCES `veiculo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posicaoveiculo`
--

LOCK TABLES `posicaoveiculo` WRITE;
/*!40000 ALTER TABLE `posicaoveiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `posicaoveiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `precovenda`
--

DROP TABLE IF EXISTS `precovenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `precovenda` (
  `idItem` bigint(20) NOT NULL,
  `custo_nota` float DEFAULT NULL,
  `markup` float DEFAULT NULL,
  `preco_venda` float DEFAULT NULL,
  PRIMARY KEY (`idItem`),
  CONSTRAINT `PrecoVenda_Item` FOREIGN KEY (`idItem`) REFERENCES `item` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `precovenda`
--

LOCK TABLES `precovenda` WRITE;
/*!40000 ALTER TABLE `precovenda` DISABLE KEYS */;
/*!40000 ALTER TABLE `precovenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto` (
  `id` bigint(20) NOT NULL,
  `nome_fantasia` varchar(120) NOT NULL,
  `cod_barra` varchar(13) DEFAULT NULL,
  `classificacao_receita` int(11) DEFAULT NULL,
  `custo_instalacao` varchar(18) DEFAULT NULL,
  `part_number` varchar(30) DEFAULT NULL,
  `cst_simples_nacional` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_produto_natureza` (`classificacao_receita`),
  CONSTRAINT `fk_produto_natureza` FOREIGN KEY (`classificacao_receita`) REFERENCES `natureza` (`id_natureza`),
  CONSTRAINT `Produto_Item` FOREIGN KEY (`id`) REFERENCES `item` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (-4,'Gás',NULL,NULL,NULL,NULL,NULL),(-3,'Etanol',NULL,NULL,NULL,NULL,NULL),(-2,'Diesel',NULL,NULL,NULL,NULL,NULL),(-1,'Gasolina',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtoempresa`
--

DROP TABLE IF EXISTS `produtoempresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produtoempresa` (
  `id_produto` bigint(20) NOT NULL,
  `id_empresa` bigint(20) NOT NULL,
  `id_regra_estadual` int(11) DEFAULT NULL,
  `mod_bc` smallint(6) DEFAULT NULL,
  `mod_bc_st` smallint(6) DEFAULT NULL,
  `consumo` bit(1) NOT NULL DEFAULT b'0',
  `venda` bit(1) NOT NULL DEFAULT b'0',
  `locacao` bit(1) NOT NULL DEFAULT b'0',
  `comodato` bit(1) NOT NULL DEFAULT b'0',
  `material` bit(1) NOT NULL DEFAULT b'0',
  `reposicao` bit(1) NOT NULL DEFAULT b'0',
  `gerar_custo` bit(1) NOT NULL DEFAULT b'0',
  `id_servico` bigint(20) DEFAULT NULL,
  `custo_instalacao` varchar(18) DEFAULT NULL,
  `id_cfop_dentro_estado` int(11) DEFAULT NULL,
  `id_cfop_fora_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_produto`,`id_empresa`),
  KEY `FK_ProdutoEmpresa_Produto` (`id_produto`),
  KEY `FK_ProdutoEmpresa_Empresa` (`id_empresa`),
  KEY `FK_ProdutoEmpresa_RegraTributacaoEstadual` (`id_regra_estadual`),
  KEY `FK_ProdutoEmpresa_Servico` (`id_servico`),
  KEY `FK_ProdutoEmpresa_CFOP1` (`id_cfop_dentro_estado`),
  KEY `FK_ProdutoEmpresa_CFOP2` (`id_cfop_fora_estado`),
  CONSTRAINT `FK_ProdutoEmpresa_CFOP1` FOREIGN KEY (`id_cfop_dentro_estado`) REFERENCES `cfop` (`id`),
  CONSTRAINT `FK_ProdutoEmpresa_CFOP2` FOREIGN KEY (`id_cfop_fora_estado`) REFERENCES `cfop` (`id`),
  CONSTRAINT `FK_ProdutoEmpresa_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ProdutoEmpresa_Produto` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ProdutoEmpresa_RegraTributacaoEstadual` FOREIGN KEY (`id_regra_estadual`) REFERENCES `regratributacaoestadual` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ProdutoEmpresa_Servico` FOREIGN KEY (`id_servico`) REFERENCES `servico` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtoempresa`
--

LOCK TABLES `produtoempresa` WRITE;
/*!40000 ALTER TABLE `produtoempresa` DISABLE KEYS */;
INSERT INTO `produtoempresa` VALUES (-4,1,NULL,4,5,'\0','\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL),(-3,1,NULL,4,5,'\0','\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL),(-2,1,NULL,4,5,'\0','\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL),(-1,1,NULL,4,5,'\0','\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `produtoempresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos_associados`
--

DROP TABLE IF EXISTS `produtos_associados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produtos_associados` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_produto` bigint(20) NOT NULL,
  `id_produto_associado` bigint(20) NOT NULL,
  `quantidade` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Produtos_Associados_Produto` (`id_produto`),
  KEY `Produtos_Associados_Item` (`id_produto_associado`),
  CONSTRAINT `Produtos_Associados_Item` FOREIGN KEY (`id_produto_associado`) REFERENCES `item` (`id`),
  CONSTRAINT `Produtos_Associados_Produto` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos_associados`
--

LOCK TABLES `produtos_associados` WRITE;
/*!40000 ALTER TABLE `produtos_associados` DISABLE KEYS */;
/*!40000 ALTER TABLE `produtos_associados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proposta`
--

DROP TABLE IF EXISTS `proposta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proposta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_empresa` bigint(20) NOT NULL,
  `id_condicaopagto` int(20) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `id_vendedor` bigint(20) DEFAULT NULL,
  `titulo` varchar(1000) NOT NULL,
  `status` varchar(3) DEFAULT NULL,
  `margem_lucro` float DEFAULT NULL,
  `id_gerente` bigint(20) DEFAULT NULL,
  `data_liberacao` datetime DEFAULT NULL,
  `id_cliente` bigint(20) NOT NULL,
  `valor` float DEFAULT NULL,
  `validade` datetime DEFAULT NULL,
  `justificativa` varchar(2000) DEFAULT NULL,
  `comentario` varchar(2000) DEFAULT NULL,
  `id_conta_contrato` bigint(20) DEFAULT NULL,
  `nova_ampliacao` char(1) NOT NULL DEFAULT 'N',
  `alarme_rastreamento_outros` char(1) NOT NULL DEFAULT 'A',
  `id_contrato` bigint(20) DEFAULT NULL,
  `id_motivo_fechamento` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Proposta_Empresa` (`id_empresa`),
  KEY `Proposta_Vendedor` (`id_vendedor`),
  KEY `Proposta_Cliente` (`id_cliente`),
  KEY `Proposta_Pessoa` (`id_gerente`),
  KEY `Proposta_Condicaopagto` (`id_condicaopagto`),
  KEY `fk_proposta_contrato` (`id_contrato`),
  KEY `FK_Proposta_Motivofechamento` (`id_motivo_fechamento`),
  CONSTRAINT `fk_proposta_contrato` FOREIGN KEY (`id_contrato`) REFERENCES `contrato` (`id`),
  CONSTRAINT `FK_Proposta_Motivofechamento` FOREIGN KEY (`id_motivo_fechamento`) REFERENCES `motivo_fechamento_venda` (`id`),
  CONSTRAINT `Proposta_Cliente` FOREIGN KEY (`id_cliente`) REFERENCES `pessoa` (`id`),
  CONSTRAINT `Proposta_Condicaopagto` FOREIGN KEY (`id_condicaopagto`) REFERENCES `condicaopagto` (`id`),
  CONSTRAINT `Proposta_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`),
  CONSTRAINT `Proposta_Pessoa` FOREIGN KEY (`id_gerente`) REFERENCES `pessoa` (`id`),
  CONSTRAINT `Proposta_Vendedor` FOREIGN KEY (`id_vendedor`) REFERENCES `pessoa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposta`
--

LOCK TABLES `proposta` WRITE;
/*!40000 ALTER TABLE `proposta` DISABLE KEYS */;
/*!40000 ALTER TABLE `proposta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propostalead`
--

DROP TABLE IF EXISTS `propostalead`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propostalead` (
  `id_lead` bigint(20) NOT NULL,
  `id_proposta` bigint(20) NOT NULL,
  PRIMARY KEY (`id_lead`,`id_proposta`),
  KEY `PropostaLead_Proposta` (`id_proposta`),
  CONSTRAINT `PropostaLead_lead` FOREIGN KEY (`id_lead`) REFERENCES `lead` (`id`),
  CONSTRAINT `PropostaLead_Proposta` FOREIGN KEY (`id_proposta`) REFERENCES `proposta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propostalead`
--

LOCK TABLES `propostalead` WRITE;
/*!40000 ALTER TABLE `propostalead` DISABLE KEYS */;
/*!40000 ALTER TABLE `propostalead` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `protesto`
--

DROP TABLE IF EXISTS `protesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `protesto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` datetime DEFAULT NULL,
  `cartorio` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `protesto`
--

LOCK TABLES `protesto` WRITE;
/*!40000 ALTER TABLE `protesto` DISABLE KEYS */;
/*!40000 ALTER TABLE `protesto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rateiotitulo`
--

DROP TABLE IF EXISTS `rateiotitulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rateiotitulo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_empresa` bigint(20) DEFAULT NULL,
  `id_unidade_negocio` int(11) DEFAULT NULL,
  `id_natureza` int(11) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `id_titulo` bigint(20) DEFAULT NULL,
  `id_lancto` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_RateioTitulo_UnidadeNegocio` (`id_unidade_negocio`),
  KEY `Fk_RateioTitulo_Empresa` (`id_empresa`),
  KEY `Fk_RateioTitulo_Natureza` (`id_natureza`),
  KEY `Fk_RateioTitulo_Titulo` (`id_titulo`),
  KEY `Fk_RateioTitulo_LanctoRegimeCompetencia` (`id_lancto`),
  CONSTRAINT `Fk_RateioTitulo_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`),
  CONSTRAINT `Fk_RateioTitulo_LanctoRegimeCompetencia` FOREIGN KEY (`id_lancto`) REFERENCES `lanctoregimecompetencia` (`id`),
  CONSTRAINT `Fk_RateioTitulo_Natureza` FOREIGN KEY (`id_natureza`) REFERENCES `natureza` (`id_natureza`),
  CONSTRAINT `Fk_RateioTitulo_Titulo` FOREIGN KEY (`id_titulo`) REFERENCES `titulo` (`id_titulo`),
  CONSTRAINT `FK_RateioTitulo_UnidadeNegocio` FOREIGN KEY (`id_unidade_negocio`) REFERENCES `unidadenegocio` (`id_unidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rateiotitulo`
--

LOCK TABLES `rateiotitulo` WRITE;
/*!40000 ALTER TABLE `rateiotitulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `rateiotitulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referencia_bancaria`
--

DROP TABLE IF EXISTS `referencia_bancaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `referencia_bancaria` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_pessoa` bigint(20) NOT NULL,
  `id_banco` int(11) DEFAULT NULL,
  `agencia` varchar(15) NOT NULL,
  `conta_corrente` varchar(20) NOT NULL,
  `telefone` varchar(18) DEFAULT NULL,
  `gerente` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ReferenciaBancaria_Pessoa` (`id_pessoa`),
  KEY `ReferenciaBancaria_GwBanco` (`id_banco`),
  CONSTRAINT `ReferenciaBancaria_GwBanco` FOREIGN KEY (`id_banco`) REFERENCES `gw_global`.`gw_banco` (`id`),
  CONSTRAINT `ReferenciaBancaria_Pessoa` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referencia_bancaria`
--

LOCK TABLES `referencia_bancaria` WRITE;
/*!40000 ALTER TABLE `referencia_bancaria` DISABLE KEYS */;
/*!40000 ALTER TABLE `referencia_bancaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referencia_comercial`
--

DROP TABLE IF EXISTS `referencia_comercial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `referencia_comercial` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_pessoa` bigint(20) NOT NULL,
  `empresa` varchar(15) NOT NULL,
  `telefone` varchar(18) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ReferenciaComercial_Pessoa` (`id_pessoa`),
  CONSTRAINT `ReferenciaComercial_Pessoa` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referencia_comercial`
--

LOCK TABLES `referencia_comercial` WRITE;
/*!40000 ALTER TABLE `referencia_comercial` DISABLE KEYS */;
/*!40000 ALTER TABLE `referencia_comercial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refinanciamento`
--

DROP TABLE IF EXISTS `refinanciamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refinanciamento` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_empresa` bigint(20) NOT NULL,
  `data` datetime DEFAULT NULL,
  `id_pessoa` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Refinanciamento_Empresa` (`id_empresa`),
  KEY `FK_Refinanciamento_Pessoa` (`id_pessoa`),
  CONSTRAINT `FK_Refinanciamento_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`),
  CONSTRAINT `FK_Refinanciamento_Pessoa` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refinanciamento`
--

LOCK TABLES `refinanciamento` WRITE;
/*!40000 ALTER TABLE `refinanciamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `refinanciamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regratributacaoestadual`
--

DROP TABLE IF EXISTS `regratributacaoestadual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regratributacaoestadual` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) DEFAULT NULL,
  `id_empresa` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Regratributacaoestadual_Empresa` (`id_empresa`),
  CONSTRAINT `FK_Regratributacaoestadual_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regratributacaoestadual`
--

LOCK TABLES `regratributacaoestadual` WRITE;
/*!40000 ALTER TABLE `regratributacaoestadual` DISABLE KEYS */;
/*!40000 ALTER TABLE `regratributacaoestadual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regratributacaofederal`
--

DROP TABLE IF EXISTS `regratributacaofederal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regratributacaofederal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) DEFAULT NULL,
  `aliq_pis` float DEFAULT NULL,
  `aliq_cofins` float DEFAULT NULL,
  `aliq_ipi` float DEFAULT NULL,
  `aliq_csll` float DEFAULT NULL,
  `aliq_ir` float DEFAULT NULL,
  `cst_pis` int(11) DEFAULT NULL,
  `cst_cofins` int(11) DEFAULT NULL,
  `cst_ipi` int(11) DEFAULT NULL,
  `cst_csll` int(11) DEFAULT NULL,
  `id_localidade` int(11) DEFAULT NULL,
  `id_empresa` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Regratributacaofederal_Empresa` (`id_empresa`),
  CONSTRAINT `FK_Regratributacaofederal_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regratributacaofederal`
--

LOCK TABLES `regratributacaofederal` WRITE;
/*!40000 ALTER TABLE `regratributacaofederal` DISABLE KEYS */;
/*!40000 ALTER TABLE `regratributacaofederal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regratributacaomunicipal`
--

DROP TABLE IF EXISTS `regratributacaomunicipal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regratributacaomunicipal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) DEFAULT NULL,
  `id_empresa` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Regratributacaomunicipal_Empresa` (`id_empresa`),
  CONSTRAINT `FK_Regratributacaomunicipal_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regratributacaomunicipal`
--

LOCK TABLES `regratributacaomunicipal` WRITE;
/*!40000 ALTER TABLE `regratributacaomunicipal` DISABLE KEYS */;
/*!40000 ALTER TABLE `regratributacaomunicipal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regratributacaosimplesnacional`
--

DROP TABLE IF EXISTS `regratributacaosimplesnacional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regratributacaosimplesnacional` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` bigint(20) NOT NULL,
  `cst_pis` int(11) DEFAULT NULL,
  `cst_cofins` int(11) DEFAULT NULL,
  `cst_ipi` int(11) DEFAULT NULL,
  `aliquota_iss` float DEFAULT NULL,
  `aliquota_simples_nacional` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `RegraTributacaoSimplesNacional_Empresa` (`id_empresa`),
  CONSTRAINT `RegraTributacaoSimplesNacional_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regratributacaosimplesnacional`
--

LOCK TABLES `regratributacaosimplesnacional` WRITE;
/*!40000 ALTER TABLE `regratributacaosimplesnacional` DISABLE KEYS */;
/*!40000 ALTER TABLE `regratributacaosimplesnacional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requisicaocompra`
--

DROP TABLE IF EXISTS `requisicaocompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requisicaocompra` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_unidade_estoque` bigint(20) DEFAULT NULL,
  `id_requisicao` bigint(20) DEFAULT NULL,
  `id_empresa` bigint(20) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `solicitante` bigint(20) DEFAULT NULL,
  `status` char(3) DEFAULT NULL,
  `comentarios` char(200) DEFAULT NULL,
  `prioridade` char(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_RequisicaoCompra_Pessoa` (`solicitante`),
  KEY `FK_RequisicaoCompra_Unidadeestoque` (`id_unidade_estoque`),
  KEY `FK_RequisicaoCompra_Empresa` (`id_empresa`),
  CONSTRAINT `FK_RequisicaoCompra_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`),
  CONSTRAINT `FK_RequisicaoCompra_Pessoa` FOREIGN KEY (`solicitante`) REFERENCES `pessoa` (`id`),
  CONSTRAINT `FK_RequisicaoCompra_Unidadeestoque` FOREIGN KEY (`id_unidade_estoque`) REFERENCES `unidadeestoque` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requisicaocompra`
--

LOCK TABLES `requisicaocompra` WRITE;
/*!40000 ALTER TABLE `requisicaocompra` DISABLE KEYS */;
/*!40000 ALTER TABLE `requisicaocompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sacao`
--

DROP TABLE IF EXISTS `sacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sacao` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_contato` int(11) DEFAULT NULL,
  `data_central` datetime DEFAULT NULL,
  `data_conta` datetime DEFAULT NULL,
  `acao` varchar(1000) DEFAULT NULL,
  `id_user` bigint(20) DEFAULT NULL,
  `id_providencia` bigint(20) DEFAULT NULL,
  `meu_alarme` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_Sacao_Sprovidencia` (`id_providencia`),
  KEY `Fk_Sacao_Scontato` (`id_contato`),
  CONSTRAINT `Fk_Sacao_Scontato` FOREIGN KEY (`id_contato`) REFERENCES `scontato` (`id`),
  CONSTRAINT `Fk_Sacao_Sprovidencia` FOREIGN KEY (`id_providencia`) REFERENCES `sprovidencia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sacao`
--

LOCK TABLES `sacao` WRITE;
/*!40000 ALTER TABLE `sacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `sacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saidaveiculo`
--

DROP TABLE IF EXISTS `saidaveiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saidaveiculo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data_saida` datetime DEFAULT NULL,
  `data_retorno` datetime DEFAULT NULL,
  `id_coleta_saida` bigint(20) DEFAULT NULL,
  `id_coleta_retorno` bigint(20) DEFAULT NULL,
  `id_funcionario` bigint(20) DEFAULT NULL,
  `id_veiculo` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `SaidaVeiculo_ColetaSaida` (`id_coleta_saida`),
  KEY `SaidaVeiculo_ColetaRetorno` (`id_coleta_retorno`),
  KEY `SaidaVeiculo_Funcionario` (`id_funcionario`),
  KEY `SaidaVeiculo_Veiculo` (`id_veiculo`),
  CONSTRAINT `SaidaVeiculo_ColetaRetorno` FOREIGN KEY (`id_coleta_retorno`) REFERENCES `coletakmhora` (`id`),
  CONSTRAINT `SaidaVeiculo_ColetaSaida` FOREIGN KEY (`id_coleta_saida`) REFERENCES `coletakmhora` (`id`),
  CONSTRAINT `SaidaVeiculo_Funcionario` FOREIGN KEY (`id_funcionario`) REFERENCES `pessoa` (`id`),
  CONSTRAINT `SaidaVeiculo_Veiculo` FOREIGN KEY (`id_veiculo`) REFERENCES `veiculo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saidaveiculo`
--

LOCK TABLES `saidaveiculo` WRITE;
/*!40000 ALTER TABLE `saidaveiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `saidaveiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salarmeaceito`
--

DROP TABLE IF EXISTS `salarmeaceito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salarmeaceito` (
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salarmeaceito`
--

LOCK TABLES `salarmeaceito` WRITE;
/*!40000 ALTER TABLE `salarmeaceito` DISABLE KEYS */;
/*!40000 ALTER TABLE `salarmeaceito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saldocaixa`
--

DROP TABLE IF EXISTS `saldocaixa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saldocaixa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_unidade_negocio` int(11) NOT NULL,
  `id_natureza` int(11) NOT NULL,
  `mes_ano` varchar(7) DEFAULT NULL,
  `debito` float DEFAULT NULL,
  `credito` float DEFAULT NULL,
  `id_empresa` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK_SaldoCaixa_UnidadeNegocio` (`id_unidade_negocio`),
  KEY `FK_SaldoCaixa_Natureza` (`id_natureza`),
  KEY `FK_Saldocaixa_Empresa` (`id_empresa`),
  CONSTRAINT `FK_Saldocaixa_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`),
  CONSTRAINT `FK_SaldoCaixa_Natureza` FOREIGN KEY (`id_natureza`) REFERENCES `natureza` (`id_natureza`),
  CONSTRAINT `FK_SaldoCaixa_UnidadeNegocio` FOREIGN KEY (`id_unidade_negocio`) REFERENCES `unidadenegocio` (`id_unidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saldocaixa`
--

LOCK TABLES `saldocaixa` WRITE;
/*!40000 ALTER TABLE `saldocaixa` DISABLE KEYS */;
/*!40000 ALTER TABLE `saldocaixa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saldocompetencia`
--

DROP TABLE IF EXISTS `saldocompetencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saldocompetencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_unidade_negocio` int(11) NOT NULL,
  `id_natureza` int(11) NOT NULL,
  `mes_ano` varchar(7) DEFAULT NULL,
  `debito` float DEFAULT NULL,
  `credito` float DEFAULT NULL,
  `id_empresa` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK_SaldoCaixa_UnidadeNegocio` (`id_unidade_negocio`),
  KEY `FK_SaldoCaixa_Natureza` (`id_natureza`),
  KEY `FK_Saldocompetencia_Empresa` (`id_empresa`),
  CONSTRAINT `FK_Saldocompetencia_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`),
  CONSTRAINT `FK_SaldoCompetencia_Natureza` FOREIGN KEY (`id_natureza`) REFERENCES `natureza` (`id_natureza`),
  CONSTRAINT `FK_SaldoCompetencia_UnidadeNegocio` FOREIGN KEY (`id_unidade_negocio`) REFERENCES `unidadenegocio` (`id_unidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saldocompetencia`
--

LOCK TABLES `saldocompetencia` WRITE;
/*!40000 ALTER TABLE `saldocompetencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `saldocompetencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scamera`
--

DROP TABLE IF EXISTS `scamera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scamera` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `id_conta` int(11) DEFAULT NULL,
  `sempre_ver_alarme` tinyint(1) DEFAULT NULL,
  `discr` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Scamera_Sconta` (`id_conta`),
  CONSTRAINT `FK_Scamera_Sconta` FOREIGN KEY (`id_conta`) REFERENCES `sconta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scamera`
--

LOCK TABLES `scamera` WRITE;
/*!40000 ALTER TABLE `scamera` DISABLE KEYS */;
/*!40000 ALTER TABLE `scamera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scameradvr`
--

DROP TABLE IF EXISTS `scameradvr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scameradvr` (
  `id` int(11) NOT NULL,
  `id_dvr` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKscameradvr_Scamera` (`id`),
  KEY `FKscameradvr_Sdvr` (`id_dvr`),
  CONSTRAINT `FKscameradvr_Scamera` FOREIGN KEY (`id`) REFERENCES `scamera` (`id`),
  CONSTRAINT `FKscameradvr_Sdvr` FOREIGN KEY (`id_dvr`) REFERENCES `sdvr` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scameradvr`
--

LOCK TABLES `scameradvr` WRITE;
/*!40000 ALTER TABLE `scameradvr` DISABLE KEYS */;
/*!40000 ALTER TABLE `scameradvr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scameraip`
--

DROP TABLE IF EXISTS `scameraip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scameraip` (
  `id` int(11) NOT NULL,
  `host` varchar(220) DEFAULT NULL,
  `senha` varchar(110) DEFAULT NULL,
  `usuario` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Scameraip_Scamera` (`id`),
  CONSTRAINT `FK_Scameraip_Scamera` FOREIGN KEY (`id`) REFERENCES `scamera` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scameraip`
--

LOCK TABLES `scameraip` WRITE;
/*!40000 ALTER TABLE `scameraip` DISABLE KEYS */;
/*!40000 ALTER TABLE `scameraip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scamerazona`
--

DROP TABLE IF EXISTS `scamerazona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scamerazona` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_zona` int(11) NOT NULL,
  `id_camera` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Scamerazona_Scamera` (`id_camera`),
  KEY `FK_Scamerazona_Szona` (`id_zona`),
  CONSTRAINT `FK_Scamerazona_Scamera` FOREIGN KEY (`id_camera`) REFERENCES `scamera` (`id`),
  CONSTRAINT `FK_Scamerazona_Szona` FOREIGN KEY (`id_zona`) REFERENCES `szona` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scamerazona`
--

LOCK TABLES `scamerazona` WRITE;
/*!40000 ALTER TABLE `scamerazona` DISABLE KEYS */;
/*!40000 ALTER TABLE `scamerazona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schaveimagem`
--

DROP TABLE IF EXISTS `schaveimagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schaveimagem` (
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schaveimagem`
--

LOCK TABLES `schaveimagem` WRITE;
/*!40000 ALTER TABLE `schaveimagem` DISABLE KEYS */;
INSERT INTO `schaveimagem` VALUES (1);
/*!40000 ALTER TABLE `schaveimagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sconfiguracao`
--

DROP TABLE IF EXISTS `sconfiguracao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sconfiguracao` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `path_video_verificacao` varchar(255) DEFAULT NULL,
  `grava_cameras` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sconfiguracao`
--

LOCK TABLES `sconfiguracao` WRITE;
/*!40000 ALTER TABLE `sconfiguracao` DISABLE KEYS */;
INSERT INTO `sconfiguracao` VALUES (1,'',NULL);
/*!40000 ALTER TABLE `sconfiguracao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sconta`
--

DROP TABLE IF EXISTS `sconta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sconta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_painel` char(4) DEFAULT NULL,
  `id_painel_ext` bigint(20) DEFAULT NULL,
  `nome` varchar(150) NOT NULL,
  `razao_social` varchar(150) NOT NULL,
  `recebe_radio` bit(1) DEFAULT NULL,
  `id_radio` varchar(150) DEFAULT NULL,
  `id_proprietario` bigint(20) DEFAULT NULL,
  `id_grupo` bigint(20) DEFAULT NULL,
  `id_endereco` bigint(20) DEFAULT NULL,
  `fuso` bigint(20) DEFAULT NULL,
  `senha` varchar(100) DEFAULT NULL,
  `contra_senha` varchar(100) DEFAULT NULL,
  `senha_coacao` varchar(100) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `particionado` bit(1) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `fone_painel` varchar(18) DEFAULT NULL,
  `id_fila` tinyint(4) DEFAULT NULL,
  `bateria_ok` bit(1) DEFAULT NULL,
  `data_bateria` datetime DEFAULT NULL,
  `ac_ok` bit(1) DEFAULT NULL,
  `data_ac` datetime DEFAULT NULL,
  `z1` bigint(20) DEFAULT NULL,
  `z2` bigint(20) DEFAULT NULL,
  `z3` bigint(20) DEFAULT NULL,
  `z4` bigint(20) DEFAULT NULL,
  `todas_unidades` bit(1) DEFAULT NULL,
  `tempo_com_fone` bigint(20) DEFAULT NULL,
  `teste_com_fone` bit(1) DEFAULT NULL,
  `proxima_checagem_teste` datetime DEFAULT NULL,
  `utilizar_meu_alarme` bit(1) DEFAULT NULL,
  `tempo_com_fone_armado` int(11) DEFAULT NULL,
  `tempo_com_fone_desarmado` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Sconta_Sproprietario` (`id_proprietario`),
  KEY `FK_Sconta_SgrupoConta` (`id_grupo`),
  KEY `FK_Sconta_Categoriacliente` (`id_categoria`),
  KEY `FK_Sconta_Endereco` (`id_endereco`),
  KEY `FK_Sconta_GwUsuario` (`id_usuario`),
  CONSTRAINT `FK_Sconta_Categoriacliente` FOREIGN KEY (`id_categoria`) REFERENCES `categoriacliente` (`id`),
  CONSTRAINT `FK_Sconta_Endereco` FOREIGN KEY (`id_endereco`) REFERENCES `endereco` (`id`),
  CONSTRAINT `FK_Sconta_GwUsuario` FOREIGN KEY (`id_usuario`) REFERENCES `gw_global`.`gw_usuario` (`pessoa`),
  CONSTRAINT `FK_Sconta_SgrupoConta` FOREIGN KEY (`id_grupo`) REFERENCES `sgrupoconta` (`id`),
  CONSTRAINT `FK_Sconta_Sproprietario` FOREIGN KEY (`id_proprietario`) REFERENCES `sproprietario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sconta`
--

LOCK TABLES `sconta` WRITE;
/*!40000 ALTER TABLE `sconta` DISABLE KEYS */;
INSERT INTO `sconta` VALUES (-1,'-1',-1,'SISTEMA','SISTEMA','\0','-1',NULL,NULL,NULL,0,'--','--','--','A','\0',NULL,NULL,NULL,'',NULL,'',NULL,NULL,NULL,NULL,NULL,'',1440,'',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sconta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scontato`
--

DROP TABLE IF EXISTS `scontato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scontato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ativo` tinyint(1) NOT NULL,
  `nome` varchar(120) NOT NULL,
  `id_conta` int(11) NOT NULL,
  `ordem` int(11) NOT NULL,
  `senha` varchar(20) DEFAULT NULL,
  `senha_coacao` varchar(20) DEFAULT NULL,
  `registration_id` varchar(2000) DEFAULT NULL,
  `meu_alarme` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Scontato_Sconta` (`id_conta`),
  CONSTRAINT `FK_Scontato_Sconta` FOREIGN KEY (`id_conta`) REFERENCES `sconta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scontato`
--

LOCK TABLES `scontato` WRITE;
/*!40000 ALTER TABLE `scontato` DISABLE KEYS */;
/*!40000 ALTER TABLE `scontato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sdvr`
--

DROP TABLE IF EXISTS `sdvr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sdvr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_dvr_modelo` int(11) DEFAULT NULL,
  `host` varchar(220) DEFAULT NULL,
  `senha` varchar(110) DEFAULT NULL,
  `usuario` varchar(150) DEFAULT NULL,
  `data_port` int(11) DEFAULT NULL,
  `video_port` int(11) DEFAULT NULL,
  `id_conta` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Sdvr_GwDvrModelo` (`id_dvr_modelo`),
  KEY `FK_Sdvr_Sconta` (`id_conta`),
  CONSTRAINT `FK_Sdvr_GwDvrModelo` FOREIGN KEY (`id_dvr_modelo`) REFERENCES `gw_global`.`gw_dvr_modelo` (`id`),
  CONSTRAINT `FK_Sdvr_Sconta` FOREIGN KEY (`id_conta`) REFERENCES `sconta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sdvr`
--

LOCK TABLES `sdvr` WRITE;
/*!40000 ALTER TABLE `sdvr` DISABLE KEYS */;
/*!40000 ALTER TABLE `sdvr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servico`
--

DROP TABLE IF EXISTS `servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servico` (
  `id` bigint(20) NOT NULL,
  `servico_mensal` bit(1) NOT NULL DEFAULT b'0',
  `classificacao_receita` int(11) DEFAULT NULL,
  `localIssDevido` char(1) NOT NULL DEFAULT 'T',
  `incidenciaIss` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `fk_servico_natureza` (`classificacao_receita`),
  CONSTRAINT `fk_servico_natureza` FOREIGN KEY (`classificacao_receita`) REFERENCES `natureza` (`id_natureza`),
  CONSTRAINT `Servico_Item` FOREIGN KEY (`id`) REFERENCES `item` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servico`
--

LOCK TABLES `servico` WRITE;
/*!40000 ALTER TABLE `servico` DISABLE KEYS */;
INSERT INTO `servico` VALUES (-5,'',1,'T','\0');
/*!40000 ALTER TABLE `servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicoempresa`
--

DROP TABLE IF EXISTS `servicoempresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicoempresa` (
  `id_servico` bigint(20) NOT NULL,
  `id_empresa` bigint(20) NOT NULL,
  `id_regra_municipal` int(11) DEFAULT NULL,
  `metodo_faturamento` char(2) DEFAULT NULL,
  `codigo_servico_prefeitura` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_servico`,`id_empresa`),
  KEY `FK_ServicoEmpresa_RegraTributacaoMunicipal` (`id_regra_municipal`),
  KEY `FK_ServicoEmpresa_Servico` (`id_servico`),
  KEY `FK_ServicoEmpresa_Empresa` (`id_empresa`),
  CONSTRAINT `FK_ServicoEmpresa_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ServicoEmpresa_RegraTributacaoMunicipal` FOREIGN KEY (`id_regra_municipal`) REFERENCES `regratributacaomunicipal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ServicoEmpresa_Servico` FOREIGN KEY (`id_servico`) REFERENCES `servico` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicoempresa`
--

LOCK TABLES `servicoempresa` WRITE;
/*!40000 ALTER TABLE `servicoempresa` DISABLE KEYS */;
INSERT INTO `servicoempresa` VALUES (-5,1,NULL,'OD',NULL);
/*!40000 ALTER TABLE `servicoempresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sevento`
--

DROP TABLE IF EXISTS `sevento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sevento` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `protocolo` varchar(25) NOT NULL,
  `codigo_evento` varchar(25) NOT NULL,
  `protocolo_codigo_evento` varchar(50) NOT NULL,
  `mensagem` varchar(70) NOT NULL,
  `alarme_mensagem` char(1) NOT NULL,
  `prioridade` bigint(20) DEFAULT NULL,
  `id_grupo` bigint(20) DEFAULT NULL,
  `usuario_zona_nulo` char(1) NOT NULL,
  `sistema` tinyint(1) NOT NULL,
  `categoria_evento` bigint(20) NOT NULL,
  `id_status` bigint(20) DEFAULT NULL,
  `falha_restaura` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `SEvento_SGrupoevento` (`id_grupo`),
  KEY `SEvento_SStatus` (`id_status`),
  CONSTRAINT `SEvento_SGrupoevento` FOREIGN KEY (`id_grupo`) REFERENCES `sgrupoevento` (`id`),
  CONSTRAINT `SEvento_SStatus` FOREIGN KEY (`id_status`) REFERENCES `sstatus` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=325 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sevento`
--

LOCK TABLES `sevento` WRITE;
/*!40000 ALTER TABLE `sevento` DISABLE KEYS */;
INSERT INTO `sevento` VALUES (10,'4+2','_0','4+2_0','RESTAURADO BYPASS','M',1,NULL,'N',0,7,NULL,'R'),(11,'4+2','_1','4+2_1','DESARMADO','M',1,NULL,'U',0,2,NULL,'F'),(12,'4+2','_1C','4+2_1C','DESARMADO','A',1,NULL,'U',0,99,NULL,NULL),(13,'4+2','_2','4+2_2','ARMADO','M',1,NULL,'U',0,1,NULL,'R'),(14,'4+2','_3','4+2_3','PROBLEMA','A',1,NULL,'Z',0,99,NULL,NULL),(15,'4+2','_4','4+2_4','BYPASS','M',1,NULL,'Z',0,6,NULL,'F'),(16,'4+2','_5','4+2_5','BATERIA BAIXA','A',1,NULL,'N',0,99,NULL,NULL),(17,'4+2','_5C','4+2_5C','FALHA DE AC','A',2,NULL,'N',0,99,NULL,NULL),(18,'4+2','_5D','4+2_5D','BATERIA BAIXA','A',1,NULL,'N',0,99,NULL,NULL),(19,'4+2','_6','4+2_6','ALARME SILENCIOSO','A',1,NULL,'Z',0,99,NULL,NULL),(20,'4+2','_6C','4+2_6C','SILENCIOSO','A',1,NULL,'Z',0,99,NULL,NULL),(21,'4+2','_7','4+2_7','ALTERACAO DE PROGRAMA','M',1,NULL,'N',0,99,NULL,NULL),(22,'4+2','_70','4+2_70','ALTERACAO DE PROGRAMA','A',1,NULL,'N',0,99,NULL,NULL),(23,'4+2','_8','4+2_8','RESTAURADO','M',1,NULL,'Z',0,99,NULL,NULL),(24,'4+2','_8B','4+2_8B','RESTAURAÇÃO DA ZONA 11','M',2,NULL,'N',0,99,NULL,NULL),(25,'4+2','_8C','4+2_8C','RESTAURADO A.C.','M',1,NULL,'N',0,99,NULL,NULL),(26,'4+2','_8D','4+2_8D','RESTAURADO BATERIA','A',2,NULL,'N',0,99,NULL,NULL),(27,'4+2','_9','4+2_9','RESTAURADO PROBLEMA','M',1,NULL,'Z',0,99,NULL,NULL),(28,'4+2','_B','4+2_B','TESTE DE TRANSMISSÃO','M',1,NULL,'Z',0,99,NULL,NULL),(29,'4+2','_B0','4+2_B0','TESTE DE TRANSMISSAO','M',1,NULL,'N',0,99,NULL,NULL),(30,'4+2','_C9','4+2_C9','ALARME DE COACAO','A',1,NULL,'N',0,99,NULL,NULL),(31,'4+2','_CNRES','4+2_CNRES','COMUNICAÇÃO NÃO RESTAURADA','A',1,NULL,'N',0,99,NULL,NULL),(32,'4+2','_D','4+2_D','ALARME DE VIOLACAO','A',1,NULL,'Z',0,99,NULL,NULL),(33,'4+2','_DB','4+2_DB','VIOLACAO ZONA 11','A',1,NULL,'Z',0,4,NULL,'F'),(34,'4+2','_DC','4+2_DC','VIOLACAO ZONA 12','A',1,NULL,'Z',0,4,NULL,'F'),(35,'4+2','_E','4+2_E','ALARME 24hs AUDIVEL','A',1,NULL,'Z',0,99,NULL,NULL),(36,'4+2','_E134','4+2_E134','ALARME VIOLACAO ENTRADA/SAIDA','A',1,NULL,'Z',0,99,NULL,NULL),(37,'4+2','_F','4+2_F','ALARME DE INCENDIO','A',1,NULL,'Z',0,99,NULL,NULL),(38,'4+2','_HID','4+2_HID','HID','M',5,NULL,'N',0,99,NULL,NULL),(39,'4+2','_I','4+2_I','FALHA DE COMUNICACAO','A',1,NULL,'N',0,99,NULL,NULL),(40,'4+2','_I1','4+2_I1','FALHA DE COMUNICACAO','A',1,NULL,'N',0,99,NULL,NULL),(41,'4+2','_IR','4+2_IR','FALHA DE COMUNICACAO VIA RADIO','A',1,NULL,'N',0,99,NULL,NULL),(42,'4+2','_NARM','4+2_NARM','NÃO ARMADO ATÉ HORÁRIO LIMITE','A',2,NULL,'N',0,99,NULL,NULL),(43,'4+2','_NDES','4+2_NDES','NÃO DESARMADO','A',2,NULL,'N',0,99,NULL,NULL),(44,'4+2','_NRES','4+2_NRES','NÃO RESTAUROU ZONA DENTRO DO TEMPO LIMITE','A',1,NULL,'Z',0,99,NULL,NULL),(45,'4+2','_ROFF','4+2_ROFF','FALHA DE COMUNICAÇÃO (RÁDIO)','A',1,NULL,'N',0,99,NULL,NULL),(46,'4+2','_SOFF','4+2_SOFF','FALHA DE COMUNICAÇÃO (SAT.)','A',1,NULL,'N',0,99,NULL,NULL),(47,'4+2','_TESTE','4+2_TESTE','TESTE','A',3,NULL,'N',0,99,NULL,NULL),(48,'4+2','_TOFF','4+2_TOFF','FALHA DE COMUNICAÇÃO (FONE)','A',1,NULL,'N',0,99,NULL,NULL),(49,'4+2','_W1','4+2_W1','NAO ARMOU ATE O HORARIO LIMITE','A',1,NULL,'N',0,99,NULL,NULL),(50,'4+2','_X1','4+2_X1','NAO RESTAUROU O AC','A',1,NULL,'N',0,99,NULL,NULL),(51,'','ALARM_VIDEO','ALARM_VIDEO','ALARME DE VÍDEO','A',1,NULL,'N',1,99,NULL,NULL),(52,'','ALERTA','ALERTA','ALERTA','A',1,NULL,'N',1,99,NULL,NULL),(53,'CID','_1115','CID_1115','FALHA DE LINHA','A',4,NULL,'N',1,99,NULL,NULL),(54,'CID','_5155','CID_5155','Receiver Modo Manual','M',1,NULL,'N',1,99,NULL,NULL),(55,'CID','_5551','CID_5551','Receiver Modo Automático','M',1,NULL,'N',1,99,NULL,NULL),(56,'CID','_5553','CID_5553','Impressora Restaurada','M',1,NULL,'N',1,99,NULL,NULL),(57,'CID','_5555','CID_5555','Teste de Sistema','M',1,NULL,'N',1,99,NULL,NULL),(58,'CID','_E100','CID_E100','EMERGENCIA MEDICA','A',1,NULL,'U',1,99,NULL,NULL),(59,'CID','_E101','CID_E101','EMERGENCIA MEDICA','A',1,NULL,'U',1,99,NULL,NULL),(60,'CID','_E102','CID_E102','EMERGENCIA MEDICA','A',1,NULL,'U',1,99,NULL,NULL),(61,'CID','_E110','CID_E110','ALARME DE INCENDIO','A',1,NULL,'N',1,99,NULL,NULL),(62,'CID','_E112','CID_E112','ALARME DE INCENDIO','A',1,NULL,'Z',1,99,NULL,NULL),(63,'CID','_E115','CID_E115','ALARME DE INCENDIO','A',1,NULL,'Z',1,99,NULL,NULL),(64,'CID','_E120','CID_E120','ALARME SILENCIOSO','A',1,NULL,'Z',1,99,NULL,NULL),(65,'CID','_E121','CID_E121','ALARME DE COACAO','A',1,NULL,'N',1,99,NULL,NULL),(66,'CID','_E122','CID_E122','ALARME SILENCIOSO','A',1,NULL,'Z',1,99,NULL,NULL),(67,'CID','_E123','CID_E123','ALARME 24 HRS. AUDIVEL','A',1,NULL,'Z',1,99,NULL,NULL),(68,'CID','_E130','CID_E130','ALARME VIOLACAO','A',1,NULL,'Z',1,99,NULL,NULL),(69,'CID','_E131','CID_E131','ALARME VIOLACAO DA','A',1,NULL,'Z',1,99,NULL,NULL),(70,'CID','_E132','CID_E132','VIOLACAO INTERIOR','A',1,NULL,'Z',1,99,NULL,NULL),(71,'CID','_E133','CID_E133','ALARME 24 HS AUDIVEL','A',1,NULL,'Z',1,99,NULL,NULL),(72,'CID','_E137','CID_E137','TESTE DE TRANSMISSAO','M',1,NULL,'N',1,99,NULL,NULL),(73,'CID','_E143','CID_E143','ALARME GERAL','A',1,NULL,'N',1,99,NULL,NULL),(74,'CID','_E144','CID_E144','TESTE DE TRANSMISSAO','M',1,NULL,'Z',1,99,NULL,NULL),(75,'CID','_E146','CID_E146','TESTE DE TRANSMISSAO','M',1,NULL,'Z',1,99,NULL,NULL),(76,'CID','_E150','CID_E150','ALARME 24 HS SILENCIOSO','A',1,NULL,'Z',1,99,NULL,NULL),(77,'CID','_E151','CID_E151','TESTE DE TRANSMISSAO','M',1,NULL,'N',1,99,NULL,NULL),(78,'CID','_E300','CID_E300','PROBLEMAS NA ZONA','A',1,NULL,'Z',1,99,NULL,NULL),(79,'CID','_E301','CID_E301','FALHA DE A.C.','A',1,NULL,'N',1,99,NULL,NULL),(80,'CID','_E302','CID_E302','BATERIA BAIXA','A',1,NULL,'N',1,99,NULL,NULL),(81,'CID','_E305','CID_E305','SISTEMA RESSETADO','M',1,NULL,'N',1,99,NULL,NULL),(82,'CID','_E306','CID_E306','PAINEL TROCADO','A',1,NULL,'N',1,99,NULL,NULL),(83,'CID','_E309','CID_E309','TESTE DE BATERIA','M',1,NULL,'N',1,99,NULL,NULL),(84,'CID','_E321','CID_E321','PROBLEMAS NA SIRENE','A',1,NULL,'N',1,99,NULL,NULL),(85,'CID','_E333','CID_E333','PROBLEMA NO MODULO DE EXPANSAO','A',1,NULL,'N',1,99,NULL,NULL),(86,'CID','_E351','CID_E351','FALHA DE LINHA 1','M',1,NULL,'N',1,99,NULL,NULL),(87,'CID','_E353','CID_E353','ALTERACAO MODULO EXPANSAO','M',1,NULL,'N',1,99,NULL,NULL),(88,'CID','_E373','CID_E373','PROBLEMA C/ PROTECAO','A',1,NULL,'Z',1,99,NULL,NULL),(89,'CID','_E374','CID_E374','ALARME DE ZONA TEMPORIZADA','A',1,NULL,'Z',1,99,NULL,NULL),(90,'CID','_E380','CID_E380','PROBLEMA DE SENSOR','A',1,NULL,'Z',1,99,NULL,NULL),(91,'CID','_E381','CID_E381','PROBLEMAS DE SENSOR RF','A',1,NULL,'Z',1,99,NULL,NULL),(92,'CID','_E383','CID_E383','VIOLACAO DE SENSOR','A',1,NULL,'Z',1,99,NULL,NULL),(93,'CID','_E384','CID_E384','BATERIA BAIXA DE SENSOR SEM FIO','A',1,NULL,'Z',1,99,NULL,NULL),(94,'CID','_E400','CID_E400','DESARMADO CANCELADO','M',1,NULL,'N',1,2,NULL,'F'),(95,'CID','_E401','CID_E401','DESARMADO','M',1,NULL,'U',1,2,NULL,'F'),(96,'CID','_E402','CID_E402','DESARMADO GRUPO US.','M',1,NULL,'U',1,2,NULL,'F'),(97,'CID','_E404','CID_E404','DESARMADO TARDIO','A',1,NULL,'N',1,2,NULL,'F'),(98,'CID','_E406','CID_E406','DESARMADO CANCELADO','M',1,NULL,'N',1,2,NULL,'F'),(99,'CID','_E407','CID_E407','ARMADO REMOTO','M',1,NULL,'N',1,1,NULL,'R'),(100,'CID','_E410','CID_E410','ACESSO REMOTO','A',1,NULL,'N',1,99,NULL,NULL),(101,'CID','_E412','CID_E412','DOWNLOADED','A',1,NULL,'N',1,99,NULL,NULL),(102,'CID','_E441','CID_E441','DESARMADO (STAY,MAX OU INST.)','M',1,NULL,'U',1,2,NULL,'F'),(103,'CID','_E500','CID_E500','SISTEMA DESABILITADO','M',1,NULL,'N',1,99,NULL,NULL),(104,'CID','_E501','CID_E501','SISTEMA DESABILITADO','M',1,NULL,'N',1,99,NULL,NULL),(105,'CID','_E502','CID_E502','SISTEMA DESABILITADO','M',1,NULL,'N',1,99,NULL,NULL),(106,'CID','_E503','CID_E503','SISTEMA DESABILITADO','M',1,NULL,'N',1,99,NULL,NULL),(107,'CID','_E504','CID_E504','SISTEMA DESABILITADO','M',1,NULL,'N',1,99,NULL,NULL),(108,'CID','_E505','CID_E505','SISTEMA DESABILITADO','M',1,NULL,'N',1,99,NULL,NULL),(109,'CID','_E506','CID_E506','SISTEMA DESABILITADO','M',1,NULL,'N',1,99,NULL,NULL),(110,'CID','_E507','CID_E507','SISTEMA DESABILITADO','M',1,NULL,'N',1,99,NULL,NULL),(111,'CID','_E508','CID_E508','SISTEMA DESABILITADO','M',1,NULL,'N',1,99,NULL,NULL),(112,'CID','_E509','CID_E509','SISTEMA DESABILITADO','M',1,NULL,'N',1,99,NULL,NULL),(113,'CID','_E510','CID_E510','SISTEMA DESABILITADO','M',1,NULL,'N',1,99,NULL,NULL),(114,'CID','_E520','CID_E520','SOM RELIGADO','M',1,NULL,'N',1,99,NULL,NULL),(115,'CID','_E521','CID_E521','SIRENE 1 RELIGADA','M',1,NULL,'N',1,99,NULL,NULL),(116,'CID','_E522','CID_E522','SIRENE 2 RELIGADA','M',1,NULL,'N',1,99,NULL,NULL),(117,'CID','_E523','CID_E523','TROCA DE ALARME REABILITADA','M',1,NULL,'N',1,99,NULL,NULL),(118,'CID','_E524','CID_E524','RETRANSMISSAO REABILITADA','M',1,NULL,'N',1,99,NULL,NULL),(119,'CID','_E525','CID_E525','REVERSAO DE RETRANSMISSAO REABILITADA','M',1,NULL,'N',1,99,NULL,NULL),(120,'CID','_E530','CID_E530','SISTEMAS PERIFERICOS REABILITADOS','M',1,NULL,'N',1,99,NULL,NULL),(121,'CID','_E531','CID_E531','SISTEMAS PERIFERICOS REABILITADOS','M',1,NULL,'N',1,99,NULL,NULL),(122,'CID','_E532','CID_E532','SISTEMAS PERIFERICOS REABILITADOS','M',1,NULL,'N',1,99,NULL,NULL),(123,'CID','_E533','CID_E533','SISTEMAS PERIFERICOS REABILITADOS','M',1,NULL,'N',1,99,NULL,NULL),(124,'CID','_E534','CID_E534','SISTEMAS PERIFERICOS REABILITADOS','M',1,NULL,'N',1,99,NULL,NULL),(125,'CID','_E535','CID_E535','SISTEMAS PERIFERICOS REABILITADOS','M',1,NULL,'N',1,99,NULL,NULL),(126,'CID','_E536','CID_E536','SISTEMAS PERIFERICOS REABILITADOS','M',1,NULL,'N',1,99,NULL,NULL),(127,'CID','_E537','CID_E537','SISTEMAS PERIFERICOS REABILITADOS','M',1,NULL,'N',1,99,NULL,NULL),(128,'CID','_E538','CID_E538','SISTEMAS PERIFERICOS REABILITADOS','M',1,NULL,'N',1,99,NULL,NULL),(129,'CID','_E539','CID_E539','SISTEMAS PERIFERICOS REABILITADOS','M',1,NULL,'N',1,99,NULL,NULL),(130,'CID','_E540','CID_E540','SISTEMAS PERIFERICOS REABILITADOS','M',1,NULL,'N',1,99,NULL,NULL),(131,'CID','_E551','CID_E551','TRANSMISSAO REESTABELECIDA','M',1,NULL,'N',1,99,NULL,NULL),(132,'CID','_E552','CID_E552','TRANSMISSAO DE RADIO REESTABELECIDA','M',1,NULL,'N',1,99,NULL,NULL),(133,'CID','_E570','CID_E570','BYPASS','M',1,NULL,'Z',1,6,NULL,'F'),(134,'CID','_E575','CID_E575','BYPASS ZONA DE VIOLACAO','M',1,NULL,'Z',1,99,NULL,NULL),(135,'CID','_E601','CID_E601','TESTE MANUAL DE IMPRESSAO','M',1,NULL,'N',1,99,NULL,NULL),(136,'CID','_E602','CID_E602','TESTE DE TRANSMISSAO','M',1,NULL,'N',1,99,NULL,NULL),(137,'CID','_E607','CID_E607','TESTE DE ZONAS','M',1,NULL,'N',1,99,NULL,NULL),(138,'CID','_E625','CID_E625','RELOGIO DESPROGRAMADO','M',1,NULL,'N',1,99,NULL,NULL),(139,'CID','_LINE','CID_LINE','Linha Telefônica','M',1,NULL,'N',1,99,NULL,NULL),(140,'CID','_MAN','CID_MAN','Receiver continua manual','A',1,NULL,'N',1,99,NULL,NULL),(141,'CID','_N204','CID_N204','SUPERVISAO PERDA DE NIVEL DE AGUA','M',1,NULL,'Z',1,99,NULL,NULL),(142,'CID','_N303','CID_N303','PROBLEMA (RAM CHECKSUM)','M',1,NULL,'N',1,99,NULL,NULL),(143,'CID','_N304','CID_N304','PROBLEMA (ROM CHECKSUM)','M',1,NULL,'N',1,99,NULL,NULL),(144,'CID','_N305','CID_N305','SISTEMA REINICIALIZADO','M',1,NULL,'N',1,99,NULL,NULL),(145,'CID','_N306','CID_N306','PAINEL TROCADO','A',1,NULL,'N',1,99,NULL,NULL),(146,'CID','_N374','CID_N374','VIOLACAO DE ZONA TEMPORIZADA','A',1,NULL,'N',1,99,NULL,NULL),(147,'CID','_N411','CID_N411','RETORNO SOLICITADO A DISTANCIA','M',1,NULL,'N',1,99,NULL,NULL),(148,'CID','_N412','CID_N412','ACESSO A DISTANCIA EFETUADO','M',1,NULL,'Z',1,99,NULL,NULL),(149,'CID','_N413','CID_N413','ACESSO A DISTANCIA NAO EFETUADO','M',1,NULL,'N',1,99,NULL,NULL),(150,'CID','_N441','CID_N441','ARMADO STAY,MAX/INSTANT','M',1,NULL,'U',1,1,NULL,'R'),(151,'CID','_N601','CID_N601','TESTE MANUAL DE IMPRESSAO','M',1,NULL,'N',1,99,NULL,NULL),(152,'CID','_N602','CID_N602','TESTE DE TRANSMISSAO','M',1,NULL,'N',1,99,NULL,NULL),(153,'CID','_N603','CID_N603','TESTE DE TRANSMISSAO RF','M',1,NULL,'N',1,99,NULL,NULL),(154,'CID','_N604','CID_N604','TESTE DE TRANSMISSAO ( INCENDIO )','M',1,NULL,'N',1,99,NULL,NULL),(155,'CID','_N605','CID_N605','TESTE MANUAL DE IMPRESSAO','M',1,NULL,'N',1,99,NULL,NULL),(156,'CID','_N606','CID_N606','ESCUTA ATIVADA','M',1,NULL,'N',1,99,NULL,NULL),(157,'CID','_P301','CID_P301','FALHA DE AC','A',1,NULL,'N',1,99,NULL,NULL),(158,'CID','_P309','CID_P309','BATERIA BAIXA','A',1,NULL,'N',1,99,NULL,NULL),(159,'CID','_R100','CID_R100','RESTAURADO ALARME MEDICO (EMERGENCIA)','M',1,NULL,'U',1,99,NULL,NULL),(160,'CID','_R101','CID_R101','RESTAURADO ALARME MEDICO (EMERGENCIA)','M',1,NULL,'U',1,99,NULL,NULL),(161,'CID','_R102','CID_R102','RESTAURADO ALARME MEDICO (EMERGENCIA)','M',1,NULL,'U',1,99,NULL,NULL),(162,'CID','_R110','CID_R110','RESTAURADO ALARME DE INCENDIO','M',1,NULL,'N',1,99,NULL,NULL),(163,'CID','_R111','CID_R111','RESTAURADO ALARME DE FUMACA','M',1,NULL,'Z',1,99,NULL,NULL),(164,'CID','_R112','CID_R112','RESTAURADO ALARME DE INCENDIO','M',1,NULL,'Z',1,99,NULL,NULL),(165,'CID','_R113','CID_R113','RESTAURADO ALARME DE AGUA ESCOANDO','M',1,NULL,'Z',1,99,NULL,NULL),(166,'CID','_R114','CID_R114','RESTAURADO ALARME DE CALOR','M',1,NULL,'Z',1,99,NULL,NULL),(167,'CID','_R115','CID_R115','RESTAURADO ALARME DE INCENDIO','M',1,NULL,'Z',1,99,NULL,NULL),(168,'CID','_R116','CID_R116','RESTAURADO ALARME DE INCENDIO','M',1,NULL,'Z',1,99,NULL,NULL),(169,'CID','_R117','CID_R117','RESTAURADO ALARME DE INCENDIO','M',1,NULL,'Z',1,99,NULL,NULL),(170,'CID','_R118','CID_R118','RESTAURADO ALARME DE INCENDIO','M',1,NULL,'Z',1,99,NULL,NULL),(171,'CID','_R120','CID_R120','RESTAURADO ALARME SILENCIOSO','M',1,NULL,'Z',1,99,NULL,NULL),(172,'CID','_R121','CID_R121','RESTAURADO COACAO','M',1,NULL,'N',1,99,NULL,NULL),(173,'CID','_R122','CID_R122','RESTAURADO ALARME SILENCIOSO','M',1,NULL,'N',1,5,NULL,'R'),(174,'CID','_R123','CID_R123','RESTAURADO ALARME 24h. AUDIVEL','M',1,NULL,'N',1,99,NULL,NULL),(175,'CID','_R130','CID_R130','RESTAURADO ALARME VIOLACAO','M',1,NULL,'Z',1,5,NULL,'R'),(176,'CID','_R131','CID_R131','RESTAURADO VIOLACAO NA','M',1,NULL,'Z',1,99,NULL,NULL),(177,'CID','_R132','CID_R132','RESTAURADO ALARME VIOLACAO INTERIOR','M',1,NULL,'Z',1,99,NULL,NULL),(178,'CID','_R133','CID_R133','RESTAURADO ALARME VIOLACAO 24HS','M',1,NULL,'Z',1,99,NULL,NULL),(179,'CID','_R134','CID_R134','RESTAURADO ALARME VIOLACAO ENTR./SAIDA','M',1,NULL,'Z',1,99,NULL,NULL),(180,'CID','_R135','CID_R135','RESTAURADO ALARME VIOLACAO DIA/NOITE','M',1,NULL,'Z',1,99,NULL,NULL),(181,'CID','_R136','CID_R136','RESTAURADO ALARME VIOLACAO','M',1,NULL,'Z',1,99,NULL,NULL),(182,'CID','_R137','CID_R137','RESTAURADO TESTE DE TRANSMISSAO','M',1,NULL,'N',1,99,NULL,NULL),(183,'CID','_R138','CID_R138','RESTAURADO ALARME VIOLACAO','M',1,NULL,'Z',1,99,NULL,NULL),(184,'CID','_R140','CID_R140','RESTAURADO ALARME GERAL','M',1,NULL,'Z',1,99,NULL,NULL),(185,'CID','_R141','CID_R141','RESTAURADO ALARME GERAL','M',1,NULL,'Z',1,99,NULL,NULL),(186,'CID','_R142','CID_R142','RESTAURADO ALARME GERAL','M',1,NULL,'Z',1,99,NULL,NULL),(187,'CID','_R143','CID_R143','RESTAURADO ALARME GERAL','M',1,NULL,'Z',1,99,NULL,NULL),(188,'CID','_R144','CID_R144','RESTAURADO ALARME GERAL','M',1,NULL,'Z',1,99,NULL,NULL),(189,'CID','_R145','CID_R145','RESTAURADO ALARME GERAL','M',1,NULL,'Z',1,99,NULL,NULL),(190,'CID','_R146','CID_R146','RESTAURADO TESTE DE TRANSMISSAO','M',1,NULL,'Z',1,99,NULL,NULL),(191,'CID','_R150','CID_R150','RESTAURADO ALARME 24 HS SILENCIOSO','M',1,NULL,'Z',1,99,NULL,NULL),(192,'CID','_R151','CID_R151','RESTAURADO TESTE DE TRANSMISSAO','M',1,NULL,'Z',1,99,NULL,NULL),(193,'CID','_R152','CID_R152','RESTAURADO ALARME REFRIGERACAO','M',1,NULL,'Z',1,99,NULL,NULL),(194,'CID','_R153','CID_R153','RESTAURADO ALARME SISTEMA DE AQUECIMENTO','M',1,NULL,'Z',1,99,NULL,NULL),(195,'CID','_R154','CID_R154','RESTAURADO ALARME VAZAMENTO AGUA','M',1,NULL,'Z',1,99,NULL,NULL),(196,'CID','_R155','CID_R155','RESTAURADO ALARME PORTA ARROMBADA','M',1,NULL,'Z',1,99,NULL,NULL),(197,'CID','_R156','CID_R156','RESTAURADO ALARME 24HS SEM ARROMBAMENTO','M',1,NULL,'Z',1,99,NULL,NULL),(198,'CID','_R157','CID_R157','RESTAURADO ALARME VAZAMENTO DE GAS','M',1,NULL,'Z',1,99,NULL,NULL),(199,'CID','_R158','CID_R158','RESTAURADO ALARME TEMPERATURA ALTA','M',1,NULL,'Z',1,99,NULL,NULL),(200,'CID','_R159','CID_R159','RESTAURADO ALARME TEMPERATURA BAIXA','M',1,NULL,'Z',1,99,NULL,NULL),(201,'CID','_R161','CID_R161','RESTAURADO ALARME DE PERDA DE PRESSAO','M',1,NULL,'Z',1,99,NULL,NULL),(202,'CID','_R200','CID_R200','RESTAURADO SUPERVISAO DE INCENDIO','M',1,NULL,'Z',1,99,NULL,NULL),(203,'CID','_R201','CID_R201','RESTAURADO SUPERVISAO PERDA DE PRESSAO AGUA','M',1,NULL,'Z',1,99,NULL,NULL),(204,'CID','_R202','CID_R202','RESTAURADO SUPERVISAO PERDA DE CO2','M',1,NULL,'N',1,99,NULL,NULL),(205,'CID','_R203','CID_R203','RESTAURADO SUPERVISAO VALVULA PORTAO','M',1,NULL,'Z',1,99,NULL,NULL),(206,'CID','_R205','CID_R205','RESTAURADO SUPERVISAO DE ACIONAMENTO DE BOMBA','M',1,NULL,'Z',1,99,NULL,NULL),(207,'CID','_R206','CID_R206','RESTAURADO SUPERVISAO FALHA NA BOMBA','M',1,NULL,'Z',1,99,NULL,NULL),(208,'CID','_R300','CID_R300','RESTAURADO PROBLEMA NA','M',1,NULL,'Z',1,99,NULL,NULL),(209,'CID','_R301','CID_R301','RESTAURADO FALHA DE A.C.','M',1,NULL,'N',1,99,NULL,NULL),(210,'CID','_R302','CID_R302','RESTAURADO BATERIA BAIXA','M',1,NULL,'N',1,99,NULL,NULL),(211,'CID','_R307','CID_R307','RESTAURADO TESTE DE COMUNICACAO','M',1,NULL,'N',1,99,NULL,NULL),(212,'CID','_R308','CID_R308','RESTAURADO QUEDA DE SISTEMA','M',1,NULL,'N',1,99,NULL,NULL),(213,'CID','_R309','CID_R309','RESTAURADO BATERIA BAIXA','M',1,NULL,'N',1,99,NULL,NULL),(214,'CID','_R310','CID_R310','RESTAURADO PROBLEMA DE ATERRAMENTO','M',1,NULL,'N',1,99,NULL,NULL),(215,'CID','_R320','CID_R320','RESTAURADO PROBLEMA DE SOM','M',1,NULL,'Z',1,99,NULL,NULL),(216,'CID','_R321','CID_R321','RESTAURADO PROBLEMA NA SIRENE 1','M',1,NULL,'N',1,99,NULL,NULL),(217,'CID','_R322','CID_R322','RESTAURADO PROBLEMA NA SIRENE 2','M',1,NULL,'N',1,99,NULL,NULL),(218,'CID','_R323','CID_R323','RESTAURADO SUBSTITUICAO DO ALARME','M',1,NULL,'N',1,99,NULL,NULL),(219,'CID','_R324','CID_R324','RESTAURADO PROBLEMA DE RETRANSMISSAO','M',1,NULL,'N',1,99,NULL,NULL),(220,'CID','_R325','CID_R325','RESTAURADO REVERSAO DE RETRANSMISSAO','M',1,NULL,'N',1,99,NULL,NULL),(221,'CID','_R330','CID_R330','RESTAURADO PROBLEMA SISTEMAS PERIFERICOS','M',1,NULL,'N',1,99,NULL,NULL),(222,'CID','_R331','CID_R331','RESTAURADO PROBLEMAS SISTEMAS PERIFERICOS','M',1,NULL,'N',1,99,NULL,NULL),(223,'CID','_R333','CID_R333','RESTAURADO FALHA NO MODULO DE EXP.','M',1,NULL,'N',1,99,NULL,NULL),(224,'CID','_R334','CID_R334','RESTAURADO FALHA DE REPRODUCAO','M',1,NULL,'N',1,99,NULL,NULL),(225,'CID','_R335','CID_R335','RESTAURADO FALTA DE PAPEL NA IMPRESSORA','M',1,NULL,'N',1,99,NULL,NULL),(226,'CID','_R336','CID_R336','RESTAURADO FALHA NA IMPRESSORA','M',1,NULL,'N',1,99,NULL,NULL),(227,'CID','_R350','CID_R350','RESTAURADO PROBLEMA DE COMUNICACAO','M',1,NULL,'N',1,99,NULL,NULL),(228,'CID','_R351','CID_R351','RESTAURADO FALHA DE LINHA 1','M',1,NULL,'N',1,99,NULL,NULL),(229,'CID','_R352','CID_R352','RESTAURADO FALHA DE LINHA 2','M',1,NULL,'N',1,99,NULL,NULL),(230,'CID','_R353','CID_R353','RESTAURADO FALHA DE RADIO TRANSMISSAO','M',1,NULL,'N',1,99,NULL,NULL),(231,'CID','_R354','CID_R354','RESTAURADO FALHA DE COMUNICACAO','M',1,NULL,'N',1,99,NULL,NULL),(232,'CID','_R355','CID_R355','RESTAURADO FALHA SUPERVISAO DO RADIO','M',1,NULL,'N',1,99,NULL,NULL),(233,'CID','_R356','CID_R356','RESTAURADO FALHA RADIO CENTRAL','M',1,NULL,'N',1,99,NULL,NULL),(234,'CID','_R370','CID_R370','RESTAURADO PROBLEMA DE PROTECAO','M',1,NULL,'Z',1,99,NULL,NULL),(235,'CID','_R371','CID_R371','RESTAURADO PROBLEMA DE PROTECAO','M',1,NULL,'Z',1,99,NULL,NULL),(236,'CID','_R372','CID_R372','RESTAURADO PROBLEMA DE PROTECAO','M',1,NULL,'Z',1,99,NULL,NULL),(237,'CID','_R373','CID_R373','RESTAURADO PROBLEMA DE PROTECAO','M',1,NULL,'Z',1,99,NULL,NULL),(238,'CID','_R380','CID_R380','RESTAURADO PROBLEMA DE SENSOR','M',1,NULL,'Z',1,99,NULL,NULL),(239,'CID','_R381','CID_R381','RESTAURADO PROBLEMA SENSOR RF','M',1,NULL,'Z',1,99,NULL,NULL),(240,'CID','_R382','CID_R382','RESTAURADO PROBLEMA DE SENSOR RPM','M',1,NULL,'Z',1,99,NULL,NULL),(241,'CID','_R383','CID_R383','RESTAURADO VIOLACAO DE SENSOR','M',1,NULL,'Z',1,99,NULL,NULL),(242,'CID','_R384','CID_R384','RESTAURADO SENSOR RF - BATERIA BAIXA','M',1,NULL,'Z',1,99,NULL,NULL),(243,'CID','_R400','CID_R400','RESTAURADO DESARMADO','M',1,NULL,'N',1,99,NULL,NULL),(244,'CID','_R401','CID_R401','ARMADO','M',1,NULL,'U',1,1,NULL,'R'),(245,'CID','_R402','CID_R402','ARMADO GRUPO US.','M',1,NULL,'U',1,1,NULL,'R'),(246,'CID','_R403','CID_R403','RESTAURADO DESARMADO AUTOMATICO','M',1,NULL,'N',1,99,NULL,NULL),(247,'CID','_R404','CID_R404','RESTAURADO DESARMADO TARDIO','M',1,NULL,'N',1,99,NULL,NULL),(248,'CID','_R405','CID_R405','RESTAURADO DESARMADO RETARDADO','M',1,NULL,'N',1,99,NULL,NULL),(249,'CID','_R407','CID_R407','ARMADO A DISTANCIA','M',1,NULL,'N',1,1,NULL,'R'),(250,'CID','_R408','CID_R408','RESTAURADO DESARMADO RAPIDO','M',1,NULL,'N',1,99,NULL,NULL),(251,'CID','_R409','CID_R409','RESTAURADO DESARMADO POR CHAVE','M',1,NULL,'N',1,99,NULL,NULL),(252,'CID','_R414','CID_R414','RESTAURADO ACESSO A DISTANCIA DESATIVADO','M',1,NULL,'N',1,99,NULL,NULL),(253,'CID','_R415','CID_R415','RESTAURADO DISCAGEM A DISTANCIA INTERROMPIDA','M',1,NULL,'N',1,99,NULL,NULL),(254,'CID','_R441','CID_R441','ARMADO P/ STAY','M',1,NULL,'N',1,99,NULL,NULL),(255,'CID','_R570','CID_R570','RESTAURADO BYPASS','M',1,NULL,'Z',1,7,NULL,'R'),(256,'CID','_R571','CID_R571','RESTAURADO BYPASS DE INCENDIO','M',1,NULL,'Z',1,99,NULL,NULL),(257,'CID','_R572','CID_R572','RESTAURADO BYPASS 24HS','M',1,NULL,'Z',1,99,NULL,NULL),(258,'CID','_R573','CID_R573','RESTAURADO BYPASS DE VIOLACAO','M',1,NULL,'Z',1,99,NULL,NULL),(259,'CID','_R574','CID_R574','RESTAURADO BYPASS DE GRUPO','M',1,NULL,'N',1,99,NULL,NULL),(260,'CID','_R602','CID_R602','RESTAURADO TESTE DE TRANSMISSAO','M',1,NULL,'N',1,99,NULL,NULL),(261,'CID','_R607','CID_R607','RESTAURADO TESTE DE SENSOR DE MOVIMENTO','M',1,NULL,'Z',1,99,NULL,NULL),(262,'CID','_R625','CID_R625','RELOGIO PROGRAMADO','M',1,NULL,'N',1,99,NULL,NULL),(263,'COM','_FCOM','COM_FCOM','FALHA NA COMUNICAÇÃO','A',1,NULL,'N',1,99,NULL,NULL),(264,'COM','_RCA','COM_RCA','COMUNICAÇÃO RESTAURADA (\', \', MEIO ALTERNATIVO)','M',1,NULL,'N',1,99,NULL,NULL),(265,'COM','_RCP','COM_RCP','COMUNICAÇÃO RESTAURADA (\', \', MEIO PRINCIPAL)','M',1,NULL,'N',1,99,NULL,NULL),(266,'COTA','_ESGOTADA','COTA_ESGOTADA','COTA ESGOTADA','A',1,NULL,'N',1,99,NULL,NULL),(267,'COTA','_TERMINANDO','COTA_TERMINANDO','ENTIDADE COM A COTA BAIXA (\', \', 10% PARA O FIM)','A',1,NULL,'N',1,99,NULL,NULL),(268,'FAL','_COM','FAL_COM','FALHA COMUNICACAO RECEIVER','A',1,NULL,'N',1,99,NULL,NULL),(269,'FALHA','_EMAIL','FALHA_EMAIL','Falha no envio de e-mail','A',2,NULL,'N',1,99,NULL,NULL),(270,'FALHA','_SMS','FALHA_SMS','Falha no envio de SMS','A',2,NULL,'N',1,99,NULL,NULL),(271,'PTR','_CLP','PTR_CLP','FALHA NO CLP','A',1,NULL,'N',1,99,NULL,NULL),(272,'PTR','_CLPOK','PTR_CLPOK','CLP RESTAURADO','M',1,NULL,'N',1,99,NULL,NULL),(273,'PTR','_FCOM','PTR_FCOM','FALHA NA COMUNICAÇÃO','A',1,NULL,'N',1,99,NULL,NULL),(274,'PTR','_MSGPROB','PTR_MSGPROB','MENSAGEM COM PROBLEMAS','A',1,NULL,'N',1,99,NULL,NULL),(275,'PTR','_RCA','PTR_RCA','COMUNICAÇÃO RESTAURADA (\', \', MEIO ALTERNATIVO)','M',1,NULL,'N',1,99,NULL,NULL),(276,'PTR','_RCP','PTR_RCP','COMUNICAÇÃO RESTAURADA (\', \', MEIO PRINCIPAL)','M',1,NULL,'N',1,99,NULL,NULL),(277,'RAD','_0 B','RAD_0 B','TESTE DE TRANSMISSAO (\', \', RADIO)','M',1,NULL,'N',1,99,NULL,NULL),(278,'RAD','_01','RAD_01','SETOR 1 VIOLADO (\', \', RADIO)','A',1,NULL,'N',1,99,NULL,NULL),(279,'RAD','_02','RAD_02','SETOR 2 VIOLADO (\', \', RADIO)','A',1,NULL,'N',1,99,NULL,NULL),(280,'RAD','_03','RAD_03','SETOR 3 VIOLADO (\', \', RADIO)','A',1,NULL,'N',1,99,NULL,NULL),(281,'RAD','_04','RAD_04','SETOR 4 VIOLADO (\', \', RADIO)','A',1,NULL,'N',1,99,NULL,NULL),(282,'RAD','_05','RAD_05','SETOR 5 VIOLADO (\', \', RADIO)','A',1,NULL,'N',1,99,NULL,NULL),(283,'RAD','_06','RAD_06','SETOR 6 VIOLADO (\', \', RADIO)','A',1,NULL,'N',1,99,NULL,NULL),(284,'RAD','_07','RAD_07','SETOR 7 VIOLADO (\', \', RADIO)','A',1,NULL,'N',1,99,NULL,NULL),(285,'RAD','_08','RAD_08','SETOR 8 VIOLADO (\', \', RADIO)','A',1,NULL,'N',1,99,NULL,NULL),(286,'RAD','_09','RAD_09','DISPARO DE SIRENE (\', \', RADIO)','A',1,NULL,'N',1,99,NULL,NULL),(287,'RAD','_0A','RAD_0A','ALARME SILENCIOSO (\', \', RADIO)','A',1,NULL,'N',1,99,NULL,NULL),(288,'RAD','_0B','RAD_0B','CORTE/CURTO DE LINHA TELEFONICA (\', \', RADIO)','A',1,NULL,'N',1,99,NULL,NULL),(289,'RAD','_0C','RAD_0C','ALARME VIOLACAO (\', \', RADIO)','A',1,NULL,'N',1,99,NULL,NULL),(290,'RAD','_0D','RAD_0D','EMERGENCIA MEDICA (\', \', RADIO)','A',1,NULL,'N',1,99,NULL,NULL),(291,'RAD','_0F','RAD_0F','FALTA DE LINHA TELEFONICA VIA RADIO','A',1,NULL,'N',1,99,NULL,NULL),(292,'RAD','_11','RAD_11','EMERGENCIA PANICO E ASSALTO (\', \', RADIO)','A',1,NULL,'N',1,99,NULL,NULL),(293,'RAD','_12','RAD_12','TENTATIVA DE ASSALTO (\', \', RADIO)','A',1,NULL,'N',1,99,NULL,NULL),(294,'RAD','_13','RAD_13','INCENDIO (\', \', RADIO)','A',1,NULL,'N',1,99,NULL,NULL),(295,'RAD','_14','RAD_14','EMERGENCIA MEDICA (\', \', RADIO)','A',1,NULL,'N',1,99,NULL,NULL),(296,'RAD','_15','RAD_15','VIGILANCIA RONDA (\', \', RADIO)','M',1,NULL,'N',1,99,NULL,NULL),(297,'RAD','_16','RAD_16','CANCELAMENTO (\', \', RADIO)','M',1,NULL,'N',1,99,NULL,NULL),(298,'RAD','_1A','RAD_1A','TESTE MANUAL (\', \', RADIO)','M',1,NULL,'N',1,99,NULL,NULL),(299,'RAD','_1B','RAD_1B','BATERIA BAIXA (\', \', RADIO)','A',1,NULL,'N',1,99,NULL,NULL),(300,'RAD','_1C','RAD_1C','ALARME LIGADO (\', \', ARMADO) (\', \', RADIO)','M',1,NULL,'N',1,99,NULL,NULL),(301,'RAD','_1D','RAD_1D','ALARME DESLIGADO (\', \', DESARMADO) (\', \', RADIO)','M',1,NULL,'N',1,99,NULL,NULL),(302,'RAD','_1E','RAD_1E','TESTE TRANSMISSAO AUTOMATICO (\', \', RADIO)','M',1,NULL,'N',1,99,NULL,NULL),(303,'RAD','_1F','RAD_1F','RESTAURADO LINHA TELEFONICA VIA RADIO','M',1,NULL,'N',1,99,NULL,NULL),(304,'RAD','_5558','RAD_5558','SDFSADFDS','A',1,NULL,'N',1,99,NULL,NULL),(305,'RES','_COM','RES_COM','RESTAURADA COMUNICACAO RECEIVER','A',1,NULL,'N',1,99,NULL,NULL),(306,'SAT','_020','SAT_020','LEITURA DE SATELITE','M',1,NULL,'N',1,99,NULL,NULL),(307,'SAT','_CONERR','SAT_CONERR','FALHA NO SATÉLITE','A',2,NULL,'N',1,99,NULL,NULL),(308,'SAT','_CONNEC','SAT_CONNEC','RESTAURADO CONEXÃO COM FEP','M',1,NULL,'N',1,99,NULL,NULL),(309,'SAT','_ERRCON','SAT_ERRCON','ERRO DE CONEXÃO COM FEP','A',1,NULL,'N',1,99,NULL,NULL),(310,'SAT','_HIAL','SAT_HIAL','ALARME (\', \', VIA SAT)','A',1,NULL,'Z',1,99,NULL,NULL),(311,'SAT','_LOAL','SAT_LOAL','ALARME <VIA SAT>','A',1,NULL,'Z',1,99,NULL,NULL),(312,'SAT','_NORM','SAT_NORM','ALARME <VIA SAT>','A',1,NULL,'Z',1,99,NULL,NULL),(313,'SIS','_ALRM_PEN','SIS_ALRM_PEN','PROVIDÊNCIA PENDENTE','M',3,NULL,'N',1,99,NULL,NULL),(314,'SIS','_ALRM_REC','SIS_ALRM_REC','RECONHECIMENTO DE ALARME','M',3,NULL,'N',1,99,NULL,NULL),(315,'SIS','_MSGPROB','SIS_MSGPROB','MENSAGEM COM PROBLEMA','A',1,NULL,'N',1,99,NULL,NULL),(316,'UA','_ACEITE','UA_ACEITE','Aceite do acionamento','M',1,NULL,'U',1,99,NULL,NULL),(317,'UA','_ACIONAMENTO','UA_ACIONAMENTO','Acionamento','M',1,NULL,'U',1,99,NULL,NULL),(318,'UA','_ANCORAMENTO','UA_ANCORAMENTO','Ancoramento','M',1,NULL,'U',1,99,NULL,NULL),(319,'UA','_CANCELAMENTO','UA_CANCELAMENTO','Cancelamento de atendimento','M',1,NULL,'U',1,99,NULL,NULL),(320,'UA','_FINALIZACAO','UA_FINALIZACAO','Finalização de atendimento','M',1,NULL,'U',1,99,NULL,NULL),(321,'UA','_FORADAAREA','UA_FORADAAREA','Unidade de atendimento indicou ancoramento porém saiu do local','A',1,NULL,'U',1,99,NULL,NULL),(322,'UA','_PANICO','UA_PANICO','Pânico','A',1,NULL,'U',1,99,NULL,NULL),(323,'UA','_PEDIDOACIONAMENTO','UA_PEDIDOACIONAMENTO','Pedido de acionamento','M',1,NULL,'U',1,99,NULL,NULL),(324,'UA','_REJEITADO','UA_REJEITADO','Unidade de atendimento rejeitou acionamento','A',1,NULL,'U',1,99,NULL,NULL);
/*!40000 ALTER TABLE `sevento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sfila0`
--

DROP TABLE IF EXISTS `sfila0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sfila0` (
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sfila0`
--

LOCK TABLES `sfila0` WRITE;
/*!40000 ALTER TABLE `sfila0` DISABLE KEYS */;
/*!40000 ALTER TABLE `sfila0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sfila1`
--

DROP TABLE IF EXISTS `sfila1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sfila1` (
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sfila1`
--

LOCK TABLES `sfila1` WRITE;
/*!40000 ALTER TABLE `sfila1` DISABLE KEYS */;
/*!40000 ALTER TABLE `sfila1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sfila2`
--

DROP TABLE IF EXISTS `sfila2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sfila2` (
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sfila2`
--

LOCK TABLES `sfila2` WRITE;
/*!40000 ALTER TABLE `sfila2` DISABLE KEYS */;
/*!40000 ALTER TABLE `sfila2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sfila3`
--

DROP TABLE IF EXISTS `sfila3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sfila3` (
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sfila3`
--

LOCK TABLES `sfila3` WRITE;
/*!40000 ALTER TABLE `sfila3` DISABLE KEYS */;
/*!40000 ALTER TABLE `sfila3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sfila4`
--

DROP TABLE IF EXISTS `sfila4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sfila4` (
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sfila4`
--

LOCK TABLES `sfila4` WRITE;
/*!40000 ALTER TABLE `sfila4` DISABLE KEYS */;
/*!40000 ALTER TABLE `sfila4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sfila5`
--

DROP TABLE IF EXISTS `sfila5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sfila5` (
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sfila5`
--

LOCK TABLES `sfila5` WRITE;
/*!40000 ALTER TABLE `sfila5` DISABLE KEYS */;
/*!40000 ALTER TABLE `sfila5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sfilameualarme`
--

DROP TABLE IF EXISTS `sfilameualarme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sfilameualarme` (
  `id` bigint(20) NOT NULL,
  `enviado` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sfilameualarme`
--

LOCK TABLES `sfilameualarme` WRITE;
/*!40000 ALTER TABLE `sfilameualarme` DISABLE KEYS */;
/*!40000 ALTER TABLE `sfilameualarme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sfonecontato`
--

DROP TABLE IF EXISTS `sfonecontato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sfonecontato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ativo` bit(1) DEFAULT NULL,
  `id_contato` int(11) DEFAULT NULL,
  `ordem` int(11) DEFAULT NULL,
  `ddd` tinyint(4) DEFAULT NULL,
  `fone` varchar(18) DEFAULT NULL,
  `descricao` varchar(50) DEFAULT NULL,
  `meu_alarme` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_Sfonecontato_Scontato` (`id_contato`),
  CONSTRAINT `Fk_Sfonecontato_Scontato` FOREIGN KEY (`id_contato`) REFERENCES `scontato` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sfonecontato`
--

LOCK TABLES `sfonecontato` WRITE;
/*!40000 ALTER TABLE `sfonecontato` DISABLE KEYS */;
/*!40000 ALTER TABLE `sfonecontato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sgravacao`
--

DROP TABLE IF EXISTS `sgravacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sgravacao` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data` datetime DEFAULT NULL,
  `id_providencia` bigint(20) DEFAULT NULL,
  `feita_recebida` char(1) DEFAULT NULL,
  `filename` varchar(500) DEFAULT NULL,
  `id_contato` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_Sgravacao_Sprovidencia` (`id_providencia`),
  KEY `Fk_Sgravacao_Scontato` (`id_contato`),
  CONSTRAINT `Fk_Sgravacao_Sprovidencia` FOREIGN KEY (`id_providencia`) REFERENCES `sprovidencia` (`id`),
  CONSTRAINT `sgravacao_ibfk_1` FOREIGN KEY (`id_contato`) REFERENCES `scontato` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sgravacao`
--

LOCK TABLES `sgravacao` WRITE;
/*!40000 ALTER TABLE `sgravacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `sgravacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sgrupoconta`
--

DROP TABLE IF EXISTS `sgrupoconta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sgrupoconta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sgrupoconta`
--

LOCK TABLES `sgrupoconta` WRITE;
/*!40000 ALTER TABLE `sgrupoconta` DISABLE KEYS */;
/*!40000 ALTER TABLE `sgrupoconta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sgrupoevento`
--

DROP TABLE IF EXISTS `sgrupoevento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sgrupoevento` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) NOT NULL,
  `sistema` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sgrupoevento`
--

LOCK TABLES `sgrupoevento` WRITE;
/*!40000 ALTER TABLE `sgrupoevento` DISABLE KEYS */;
/*!40000 ALTER TABLE `sgrupoevento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shorario`
--

DROP TABLE IF EXISTS `shorario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shorario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_particao` int(11) NOT NULL,
  `no_particao` int(11) DEFAULT NULL,
  `id_conta` int(11) NOT NULL,
  `dia_semana` int(11) DEFAULT NULL,
  `inicio_faixa` time DEFAULT NULL,
  `fim_faixa` time DEFAULT NULL,
  `status` char(2) DEFAULT NULL,
  `id_horario_anterior` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Shorario_Sparticao` (`id_particao`),
  KEY `FK_Shorario_Sconta` (`id_conta`),
  CONSTRAINT `FK_Shorario_Sconta` FOREIGN KEY (`id_conta`) REFERENCES `sconta` (`id`),
  CONSTRAINT `FK_Shorario_Sparticao` FOREIGN KEY (`id_particao`) REFERENCES `sparticao` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shorario`
--

LOCK TABLES `shorario` WRITE;
/*!40000 ALTER TABLE `shorario` DISABLE KEYS */;
/*!40000 ALTER TABLE `shorario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simagem`
--

DROP TABLE IF EXISTS `simagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `simagem` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data` datetime DEFAULT NULL,
  `id_providencia` bigint(20) DEFAULT NULL,
  `data_inicial` datetime DEFAULT NULL,
  `data_final` datetime DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `id_cam` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_Simagem_Sprovidencia` (`id_providencia`),
  CONSTRAINT `Fk_Simagem_Sprovidencia` FOREIGN KEY (`id_providencia`) REFERENCES `sprovidencia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simagem`
--

LOCK TABLES `simagem` WRITE;
/*!40000 ALTER TABLE `simagem` DISABLE KEYS */;
/*!40000 ALTER TABLE `simagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simcard`
--

DROP TABLE IF EXISTS `simcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `simcard` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `operadora` int(11) NOT NULL,
  `iccid` varchar(23) NOT NULL,
  `numero` varchar(18) NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'0',
  `id_contrato` bigint(20) DEFAULT NULL,
  `id_conta` bigint(20) DEFAULT NULL,
  `id_empresa` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Simcard_Operadora` (`operadora`),
  KEY `FK_Simcard_Contrato` (`id_contrato`),
  KEY `FK_Simcard_Conta` (`id_conta`),
  KEY `FK_Simcard_Empresa` (`id_empresa`),
  CONSTRAINT `FK_Simcard_ContaContrato` FOREIGN KEY (`id_conta`) REFERENCES `conta_contrato` (`id`),
  CONSTRAINT `FK_Simcard_Contratos` FOREIGN KEY (`id_contrato`) REFERENCES `contrato` (`id`),
  CONSTRAINT `FK_Simcard_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`),
  CONSTRAINT `FK_Simcard_Operadora` FOREIGN KEY (`operadora`) REFERENCES `gw_global`.`gw_operadora` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simcard`
--

LOCK TABLES `simcard` WRITE;
/*!40000 ALTER TABLE `simcard` DISABLE KEYS */;
/*!40000 ALTER TABLE `simcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sloginspecao`
--

DROP TABLE IF EXISTS `sloginspecao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sloginspecao` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data_central` datetime DEFAULT NULL,
  `data_conta` datetime DEFAULT NULL,
  `id_unidade` int(11) DEFAULT NULL,
  `acao` char(2) DEFAULT NULL,
  `id_user` bigint(20) DEFAULT NULL,
  `id_providencia` bigint(20) DEFAULT NULL,
  `comentario` varchar(1000) DEFAULT NULL,
  `conta_monitor_inspetor_sistema` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_Sloginspecao_Sunidadeinspecao` (`id_unidade`),
  KEY `Fk_Sloginspecao_Sprovidencia` (`id_providencia`),
  CONSTRAINT `Fk_Sloginspecao_Sprovidencia` FOREIGN KEY (`id_providencia`) REFERENCES `sprovidencia` (`id`),
  CONSTRAINT `Fk_Sloginspecao_Sunidadeinspecao` FOREIGN KEY (`id_unidade`) REFERENCES `sunidadeinspecao` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sloginspecao`
--

LOCK TABLES `sloginspecao` WRITE;
/*!40000 ALTER TABLE `sloginspecao` DISABLE KEYS */;
/*!40000 ALTER TABLE `sloginspecao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms`
--

DROP TABLE IF EXISTS `sms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms` (
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_SMS_Mensagem` FOREIGN KEY (`id`) REFERENCES `mensagem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms`
--

LOCK TABLES `sms` WRITE;
/*!40000 ALTER TABLE `sms` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smsg`
--

DROP TABLE IF EXISTS `smsg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smsg` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_providencia` bigint(20) DEFAULT NULL,
  `mensagem` varchar(100) DEFAULT NULL,
  `data_recepcao` datetime DEFAULT NULL,
  `data_central` datetime DEFAULT NULL,
  `id_evento` bigint(20) DEFAULT NULL,
  `codigo_evento` varchar(25) DEFAULT NULL,
  `id_conta` int(11) DEFAULT NULL,
  `no_particao` int(11) DEFAULT NULL,
  `particao` varchar(100) DEFAULT NULL,
  `no_usuario` int(11) DEFAULT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `no_zona` int(11) DEFAULT NULL,
  `zona` varchar(100) DEFAULT NULL,
  `prioridade` int(11) DEFAULT NULL,
  `id_dono` bigint(20) DEFAULT NULL,
  `data_leitura_serial` datetime DEFAULT NULL,
  `data_envio_somaseg` datetime DEFAULT NULL,
  `alarme_mensagem` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_sMsg_sConta` (`id_conta`),
  KEY `Fk_sMsg_sEvento` (`id_evento`),
  CONSTRAINT `Fk_sMsg_sConta` FOREIGN KEY (`id_conta`) REFERENCES `sconta` (`id`),
  CONSTRAINT `Fk_sMsg_sEvento` FOREIGN KEY (`id_evento`) REFERENCES `sevento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smsg`
--

LOCK TABLES `smsg` WRITE;
/*!40000 ALTER TABLE `smsg` DISABLE KEYS */;
/*!40000 ALTER TABLE `smsg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sparticao`
--

DROP TABLE IF EXISTS `sparticao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sparticao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no_particao` int(11) DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `controla_nao_armou` bit(1) DEFAULT b'0',
  `controla_nao_desarmou` bit(1) DEFAULT b'0',
  `controla_desarmou_fora_hora` bit(1) DEFAULT b'0',
  `teste_com_fone` bit(1) DEFAULT b'0',
  `tempo_com_fone` int(11) DEFAULT NULL,
  `id_conta` int(11) NOT NULL,
  `id_painel_ext` int(11) DEFAULT NULL,
  `armado_desarmado` int(11) DEFAULT NULL,
  `proxima_checagem` datetime DEFAULT NULL,
  `tolerancia_nao_armou` bigint(10) DEFAULT NULL,
  `tolerancia_nao_desarmou` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Sparticao_Sconta` (`id_conta`),
  CONSTRAINT `FK_Sparticao_Sconta` FOREIGN KEY (`id_conta`) REFERENCES `sconta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sparticao`
--

LOCK TABLES `sparticao` WRITE;
/*!40000 ALTER TABLE `sparticao` DISABLE KEYS */;
/*!40000 ALTER TABLE `sparticao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spessoaacesso`
--

DROP TABLE IF EXISTS `spessoaacesso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spessoaacesso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ativo` tinyint(1) NOT NULL,
  `id_conta` int(11) NOT NULL,
  `nome` varchar(120) NOT NULL,
  `funcao_parentesco` varchar(120) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `data` datetime DEFAULT NULL,
  `usuario` tinyint(1) DEFAULT NULL,
  `id_endereco` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Spessoaacesso_Sconta` (`id_conta`),
  KEY `FK_Spessoaacesso_Endereco` (`id_endereco`),
  CONSTRAINT `FK_Spessoaacesso_Endereco` FOREIGN KEY (`id_endereco`) REFERENCES `endereco` (`id`),
  CONSTRAINT `FK_Spessoaacesso_Sconta` FOREIGN KEY (`id_conta`) REFERENCES `sconta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spessoaacesso`
--

LOCK TABLES `spessoaacesso` WRITE;
/*!40000 ALTER TABLE `spessoaacesso` DISABLE KEYS */;
/*!40000 ALTER TABLE `spessoaacesso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sposicaoui`
--

DROP TABLE IF EXISTS `sposicaoui`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sposicaoui` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_unidade` int(11) DEFAULT NULL,
  `data_hora` datetime DEFAULT NULL,
  `latitude` float(10,8) DEFAULT NULL,
  `longitude` float(10,8) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_Sposicaoui_Sunidadeinspecao` (`id_unidade`),
  CONSTRAINT `Fk_Sposicaoui_Sunidadeinspecao` FOREIGN KEY (`id_unidade`) REFERENCES `sunidadeinspecao` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sposicaoui`
--

LOCK TABLES `sposicaoui` WRITE;
/*!40000 ALTER TABLE `sposicaoui` DISABLE KEYS */;
/*!40000 ALTER TABLE `sposicaoui` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sproprietario`
--

DROP TABLE IF EXISTS `sproprietario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sproprietario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sproprietario`
--

LOCK TABLES `sproprietario` WRITE;
/*!40000 ALTER TABLE `sproprietario` DISABLE KEYS */;
/*!40000 ALTER TABLE `sproprietario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sprovidencia`
--

DROP TABLE IF EXISTS `sprovidencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sprovidencia` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_dono` bigint(20) DEFAULT NULL,
  `id_painel_ext` bigint(20) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `data_conclusao` datetime DEFAULT NULL,
  `motivo` char(1) DEFAULT NULL,
  `id_conta` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_Sprovidencia_Sconta` (`id_conta`),
  CONSTRAINT `Fk_Sprovidencia_Sconta` FOREIGN KEY (`id_conta`) REFERENCES `sconta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sprovidencia`
--

LOCK TABLES `sprovidencia` WRITE;
/*!40000 ALTER TABLE `sprovidencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `sprovidencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sstatus`
--

DROP TABLE IF EXISTS `sstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sstatus` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `status_teste_comunicacao` tinyint(1) DEFAULT NULL,
  `frequencia_varredura` bigint(20) DEFAULT NULL,
  `id_evento_disparar` bigint(20) DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sstatus`
--

LOCK TABLES `sstatus` WRITE;
/*!40000 ALTER TABLE `sstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `sstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sstatusconta`
--

DROP TABLE IF EXISTS `sstatusconta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sstatusconta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_status` bigint(20) NOT NULL,
  `id_conta` int(11) NOT NULL,
  `falhado_restaurado` char(1) NOT NULL,
  `prox_checagem` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_SstatusConta_Sstatus` (`id_status`),
  KEY `FK_SstatusConta_Sconta` (`id_conta`),
  CONSTRAINT `FK_SstatusConta_Sconta` FOREIGN KEY (`id_conta`) REFERENCES `sconta` (`id`),
  CONSTRAINT `FK_SstatusConta_Sstatus` FOREIGN KEY (`id_status`) REFERENCES `sstatus` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sstatusconta`
--

LOCK TABLES `sstatusconta` WRITE;
/*!40000 ALTER TABLE `sstatusconta` DISABLE KEYS */;
/*!40000 ALTER TABLE `sstatusconta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuscontrato`
--

DROP TABLE IF EXISTS `statuscontrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statuscontrato` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_contrato` bigint(20) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `status` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_StatusContrato_Contrato` (`id_contrato`),
  CONSTRAINT `FK_StatusContrato_Contrato` FOREIGN KEY (`id_contrato`) REFERENCES `contrato` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuscontrato`
--

LOCK TABLES `statuscontrato` WRITE;
/*!40000 ALTER TABLE `statuscontrato` DISABLE KEYS */;
/*!40000 ALTER TABLE `statuscontrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuslead`
--

DROP TABLE IF EXISTS `statuslead`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statuslead` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_lead` bigint(20) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_StatusLead_Lead` (`id_lead`),
  CONSTRAINT `FK_StatusLead_Lead` FOREIGN KEY (`id_lead`) REFERENCES `lead` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuslead`
--

LOCK TABLES `statuslead` WRITE;
/*!40000 ALTER TABLE `statuslead` DISABLE KEYS */;
/*!40000 ALTER TABLE `statuslead` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statusos`
--

DROP TABLE IF EXISTS `statusos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statusos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_os` bigint(20) NOT NULL,
  `data` datetime NOT NULL,
  `status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_StatusOS_OrdemServico` (`id_os`),
  CONSTRAINT `FK_StatusOS_OrdemServico` FOREIGN KEY (`id_os`) REFERENCES `ordemservico` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statusos`
--

LOCK TABLES `statusos` WRITE;
/*!40000 ALTER TABLE `statusos` DISABLE KEYS */;
/*!40000 ALTER TABLE `statusos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statusticket`
--

DROP TABLE IF EXISTS `statusticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statusticket` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_ticket` bigint(20) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_StatusTicket_Ticket` (`id_ticket`),
  CONSTRAINT `FK_StatusTicket_Ticket` FOREIGN KEY (`id_ticket`) REFERENCES `ticket` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statusticket`
--

LOCK TABLES `statusticket` WRITE;
/*!40000 ALTER TABLE `statusticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `statusticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subsistema`
--

DROP TABLE IF EXISTS `subsistema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subsistema` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(40) NOT NULL,
  `id_empresa` bigint(20) DEFAULT NULL,
  `ativo` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`),
  KEY `Subsistema_Empresa` (`id_empresa`),
  CONSTRAINT `Subsistema_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subsistema`
--

LOCK TABLES `subsistema` WRITE;
/*!40000 ALTER TABLE `subsistema` DISABLE KEYS */;
/*!40000 ALTER TABLE `subsistema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sunidadeconta`
--

DROP TABLE IF EXISTS `sunidadeconta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sunidadeconta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_conta` int(11) NOT NULL,
  `id_unidade` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_Sunidadeconta_Sconta` (`id_conta`),
  KEY `Fk_Sunidadecota_Sunidadeinspecao` (`id_unidade`),
  CONSTRAINT `Fk_Sunidadeconta_Sconta` FOREIGN KEY (`id_conta`) REFERENCES `sconta` (`id`),
  CONSTRAINT `Fk_Sunidadecota_Sunidadeinspecao` FOREIGN KEY (`id_unidade`) REFERENCES `sunidadeinspecao` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sunidadeconta`
--

LOCK TABLES `sunidadeconta` WRITE;
/*!40000 ALTER TABLE `sunidadeconta` DISABLE KEYS */;
/*!40000 ALTER TABLE `sunidadeconta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sunidadeinspecao`
--

DROP TABLE IF EXISTS `sunidadeinspecao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sunidadeinspecao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `fone_voz` varchar(18) DEFAULT NULL,
  `fone_data` varchar(18) DEFAULT NULL,
  `acionar_voz_data` char(1) DEFAULT NULL,
  `id_endereco` bigint(20) DEFAULT NULL,
  `id_veiculo` bigint(20) DEFAULT NULL,
  `id_inspetor` bigint(20) DEFAULT NULL,
  `ativo` bit(1) DEFAULT NULL,
  `latitude` float(10,8) DEFAULT NULL,
  `longitude` float(10,8) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `registration_id` varchar(2000) DEFAULT NULL,
  `senha` varchar(20) DEFAULT NULL,
  `id_conta` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_Sunidadeinspecao_Endereco` (`id_endereco`),
  KEY `Fk_Sunidadeinspecao_Inspetor` (`id_inspetor`),
  KEY `Fk_Sunidadeinspecao_Veiculo` (`id_veiculo`),
  KEY `Sunidadeinspecao_Sconta` (`id_conta`),
  CONSTRAINT `Fk_Sunidadeinspecao_Endereco` FOREIGN KEY (`id_endereco`) REFERENCES `endereco` (`id`),
  CONSTRAINT `Fk_Sunidadeinspecao_Inspetor` FOREIGN KEY (`id_inspetor`) REFERENCES `inspetor` (`id`),
  CONSTRAINT `Fk_Sunidadeinspecao_Veiculo` FOREIGN KEY (`id_veiculo`) REFERENCES `veiculo` (`id`),
  CONSTRAINT `sunidadeinspecao_ibfk_1` FOREIGN KEY (`id_conta`) REFERENCES `sconta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sunidadeinspecao`
--

LOCK TABLES `sunidadeinspecao` WRITE;
/*!40000 ALTER TABLE `sunidadeinspecao` DISABLE KEYS */;
/*!40000 ALTER TABLE `sunidadeinspecao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `susuario`
--

DROP TABLE IF EXISTS `susuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `susuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acesso_fora_hora` tinyint(1) DEFAULT NULL,
  `usuario_coacao` tinyint(1) DEFAULT NULL,
  `no_usuario` int(11) DEFAULT NULL,
  `id_particao` int(11) DEFAULT NULL,
  `no_particao` int(11) DEFAULT NULL,
  `id_pessoa` int(11) NOT NULL,
  `id_conta` int(11) NOT NULL,
  `id_painel_ext` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Susuario_Spessoaacesso` (`id_pessoa`),
  KEY `FK_Susuario_Sconta` (`id_conta`),
  KEY `FK_Susuario_Sparticao` (`id_particao`),
  CONSTRAINT `FK_Susuario_Sconta` FOREIGN KEY (`id_conta`) REFERENCES `sconta` (`id`),
  CONSTRAINT `FK_Susuario_Sparticao` FOREIGN KEY (`id_particao`) REFERENCES `sparticao` (`id`),
  CONSTRAINT `FK_Susuario_Spessoaacesso` FOREIGN KEY (`id_pessoa`) REFERENCES `spessoaacesso` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `susuario`
--

LOCK TABLES `susuario` WRITE;
/*!40000 ALTER TABLE `susuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `susuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `szona`
--

DROP TABLE IF EXISTS `szona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `szona` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no_zona` int(11) DEFAULT NULL,
  `id_particao` int(11) DEFAULT NULL,
  `no_particao` int(11) DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `stay` bit(1) DEFAULT NULL,
  `restaura` bit(1) DEFAULT NULL,
  `id_tipo` bigint(20) DEFAULT NULL,
  `id_conta` int(11) NOT NULL,
  `id_painel_ext` int(11) DEFAULT NULL,
  `violada` bit(1) DEFAULT NULL,
  `anulada` bit(1) DEFAULT NULL,
  `checar_violacao` datetime DEFAULT NULL,
  `checar_anulacao` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Szona_Sconta` (`id_conta`),
  KEY `FK_Szona_GwStipozona` (`id_tipo`),
  KEY `FK_Szona_Sparticao` (`id_particao`),
  CONSTRAINT `FK_Szona_GwStipozona` FOREIGN KEY (`id_tipo`) REFERENCES `gw_global`.`gw_stipozona` (`id`),
  CONSTRAINT `FK_Szona_Sconta` FOREIGN KEY (`id_conta`) REFERENCES `sconta` (`id`),
  CONSTRAINT `FK_Szona_Sparticao` FOREIGN KEY (`id_particao`) REFERENCES `sparticao` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `szona`
--

LOCK TABLES `szona` WRITE;
/*!40000 ALTER TABLE `szona` DISABLE KEYS */;
/*!40000 ALTER TABLE `szona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_pai` bigint(20) DEFAULT NULL,
  `nome` varchar(3) NOT NULL,
  `descricao` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Tag_Tag` (`id_pai`),
  CONSTRAINT `FK_Tag_Tag` FOREIGN KEY (`id_pai`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (-11,NULL,'PRO','Proposta'),(-10,NULL,'LEA','Lead'),(-9,-1,'OSI','OS de instalação'),(-8,NULL,'MOT','Motorista'),(-7,NULL,'VEN','Vendedor'),(-6,NULL,'FUN','Funcionário'),(-5,NULL,'FOR','Fornecedor'),(-4,NULL,'TIT','Título'),(-3,NULL,'CLI','Cliente'),(-2,NULL,'ITE','Item'),(-1,NULL,'OS','Ordem de serviço');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagcontrato`
--

DROP TABLE IF EXISTS `tagcontrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagcontrato` (
  `id_tag` bigint(20) NOT NULL,
  `id_contrato` bigint(20) NOT NULL,
  PRIMARY KEY (`id_tag`,`id_contrato`),
  KEY `FK_tagContrato_Contrato` (`id_contrato`),
  CONSTRAINT `FK_tagContrato_Contrato` FOREIGN KEY (`id_contrato`) REFERENCES `contrato` (`id`),
  CONSTRAINT `FK_TagContrato_Tag` FOREIGN KEY (`id_tag`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagcontrato`
--

LOCK TABLES `tagcontrato` WRITE;
/*!40000 ALTER TABLE `tagcontrato` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagcontrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagitem`
--

DROP TABLE IF EXISTS `tagitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagitem` (
  `id_tag` bigint(20) NOT NULL,
  `id_item` bigint(20) NOT NULL,
  PRIMARY KEY (`id_tag`,`id_item`),
  KEY `FK_TagItem_Tag` (`id_tag`),
  KEY `FK_TagItem_Item` (`id_item`),
  CONSTRAINT `FK_TagItem_Item` FOREIGN KEY (`id_item`) REFERENCES `item` (`id`),
  CONSTRAINT `FK_TagItem_Tag` FOREIGN KEY (`id_tag`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagitem`
--

LOCK TABLES `tagitem` WRITE;
/*!40000 ALTER TABLE `tagitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taglead`
--

DROP TABLE IF EXISTS `taglead`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taglead` (
  `id_lead` bigint(20) NOT NULL,
  `id_tag` bigint(20) NOT NULL,
  PRIMARY KEY (`id_lead`,`id_tag`),
  KEY `FK_TagLead_Lead` (`id_lead`),
  KEY `FK_TagLead_Tag` (`id_tag`),
  CONSTRAINT `FK_TagLead_Lead` FOREIGN KEY (`id_lead`) REFERENCES `lead` (`id`),
  CONSTRAINT `FK_TagLead_Tag` FOREIGN KEY (`id_tag`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taglead`
--

LOCK TABLES `taglead` WRITE;
/*!40000 ALTER TABLE `taglead` DISABLE KEYS */;
/*!40000 ALTER TABLE `taglead` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagordemservico`
--

DROP TABLE IF EXISTS `tagordemservico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagordemservico` (
  `id_tag` bigint(20) NOT NULL,
  `id_ordem_servico` bigint(20) NOT NULL,
  PRIMARY KEY (`id_tag`,`id_ordem_servico`),
  KEY `FK_OrdemServicoTag_Tag` (`id_tag`),
  KEY `FK_OrdemServicoTag_OrdemServico` (`id_ordem_servico`),
  CONSTRAINT `FK_OrdemServicoTag_OrdemServico` FOREIGN KEY (`id_ordem_servico`) REFERENCES `ordemservico` (`id`),
  CONSTRAINT `FK_OrdemServicoTag_Tag` FOREIGN KEY (`id_tag`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagordemservico`
--

LOCK TABLES `tagordemservico` WRITE;
/*!40000 ALTER TABLE `tagordemservico` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagordemservico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagpessoa`
--

DROP TABLE IF EXISTS `tagpessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagpessoa` (
  `id_tag` bigint(20) NOT NULL,
  `id_pessoa` bigint(20) NOT NULL,
  PRIMARY KEY (`id_tag`,`id_pessoa`),
  KEY `FK_TagPessoa_Tag` (`id_tag`),
  KEY `FK_TagPessoa_Pessoa` (`id_pessoa`),
  CONSTRAINT `FK_TagPessoa_Pessoa` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id`),
  CONSTRAINT `FK_TagPessoa_Tag` FOREIGN KEY (`id_tag`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagpessoa`
--

LOCK TABLES `tagpessoa` WRITE;
/*!40000 ALTER TABLE `tagpessoa` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagpessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagproposta`
--

DROP TABLE IF EXISTS `tagproposta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagproposta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_tag` bigint(20) NOT NULL,
  `id_proposta` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_TagProposta_Tag` (`id_tag`),
  KEY `FK_TagProposta_Proposta` (`id_proposta`),
  CONSTRAINT `FK_TagProposta_Proposta` FOREIGN KEY (`id_proposta`) REFERENCES `proposta` (`id`),
  CONSTRAINT `FK_TagProposta_Tag` FOREIGN KEY (`id_tag`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagproposta`
--

LOCK TABLES `tagproposta` WRITE;
/*!40000 ALTER TABLE `tagproposta` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagproposta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagticket`
--

DROP TABLE IF EXISTS `tagticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagticket` (
  `id_tag` bigint(20) NOT NULL,
  `id_ticket` bigint(20) NOT NULL,
  PRIMARY KEY (`id_tag`,`id_ticket`),
  KEY `FK_TagTicket_Ticket` (`id_ticket`),
  CONSTRAINT `FK_TagTicket_Tag` FOREIGN KEY (`id_tag`) REFERENCES `tag` (`id`),
  CONSTRAINT `FK_TagTicket_Ticket` FOREIGN KEY (`id_ticket`) REFERENCES `ticket` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagticket`
--

LOCK TABLES `tagticket` WRITE;
/*!40000 ALTER TABLE `tagticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagtitulo`
--

DROP TABLE IF EXISTS `tagtitulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagtitulo` (
  `id_tag` bigint(20) NOT NULL,
  `id_titulo` bigint(20) NOT NULL,
  PRIMARY KEY (`id_tag`,`id_titulo`),
  KEY `FK_TagTitulo_Tag` (`id_tag`),
  KEY `FK_TagTitulo_Titulo` (`id_titulo`),
  CONSTRAINT `FK_TagTitulo_Tag` FOREIGN KEY (`id_tag`) REFERENCES `tag` (`id`),
  CONSTRAINT `FK_TagTitulo_Titulo` FOREIGN KEY (`id_titulo`) REFERENCES `titulo` (`id_titulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagtitulo`
--

LOCK TABLES `tagtitulo` WRITE;
/*!40000 ALTER TABLE `tagtitulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagtitulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnico`
--

DROP TABLE IF EXISTS `tecnico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tecnico` (
  `id` bigint(20) NOT NULL,
  `id_unidade` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Tecnico_Unidadeestoque` (`id_unidade`),
  CONSTRAINT `FK_Tecnico_Unidadeestoque` FOREIGN KEY (`id_unidade`) REFERENCES `unidadeestoque` (`id`),
  CONSTRAINT `Tecnico_Pessoa` FOREIGN KEY (`id`) REFERENCES `pessoa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnico`
--

LOCK TABLES `tecnico` WRITE;
/*!40000 ALTER TABLE `tecnico` DISABLE KEYS */;
/*!40000 ALTER TABLE `tecnico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data` datetime DEFAULT NULL,
  `id_cliente` bigint(20) DEFAULT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `id_proprietario` bigint(20) DEFAULT NULL,
  `descricao` varchar(2000) DEFAULT NULL,
  `sla` int(11) DEFAULT NULL,
  `reporter` varchar(100) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `bairro` varchar(100) DEFAULT NULL,
  `uf` varchar(2) DEFAULT NULL,
  `cep` char(9) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `fone1` varchar(18) DEFAULT NULL,
  `fone2` varchar(18) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Ticket_Cliente` (`id_cliente`),
  KEY `FK_Ticket_Proprietario` (`id_proprietario`),
  KEY `FK_Ticket_CategoriaTicket` (`id_categoria`),
  CONSTRAINT `FK_Ticket_CategoriaTicket` FOREIGN KEY (`id_categoria`) REFERENCES `categoriaticket` (`id`),
  CONSTRAINT `FK_Ticket_Cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`),
  CONSTRAINT `FK_Ticket_Proprietario` FOREIGN KEY (`id_proprietario`) REFERENCES `pessoa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_contrato`
--

DROP TABLE IF EXISTS `tipo_contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_contrato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_contrato`
--

LOCK TABLES `tipo_contrato` WRITE;
/*!40000 ALTER TABLE `tipo_contrato` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_contrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipodocumento`
--

DROP TABLE IF EXISTS `tipodocumento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipodocumento` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipodocumento`
--

LOCK TABLES `tipodocumento` WRITE;
/*!40000 ALTER TABLE `tipodocumento` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipodocumento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipolead`
--

DROP TABLE IF EXISTS `tipolead`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipolead` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` char(255) DEFAULT NULL,
  `ativo` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipolead`
--

LOCK TABLES `tipolead` WRITE;
/*!40000 ALTER TABLE `tipolead` DISABLE KEYS */;
INSERT INTO `tipolead` VALUES (1,'Rastreamento',''),(2,'CFTV',''),(3,'Alarme','');
/*!40000 ALTER TABLE `tipolead` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoocorrencia`
--

DROP TABLE IF EXISTS `tipoocorrencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoocorrencia` (
  `tipo_ocorrencia` varchar(4) NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `ativa` bit(1) DEFAULT NULL,
  `id_natureza_receita` int(11) DEFAULT NULL,
  `id_natureza_despesa` int(11) DEFAULT NULL,
  `sistema` bit(1) DEFAULT b'0',
  PRIMARY KEY (`tipo_ocorrencia`),
  KEY `FK_Tipoocorrencia_Natureza` (`id_natureza_receita`),
  KEY `FK_Tipoocorrencia_Natureza_Despesa` (`id_natureza_despesa`),
  CONSTRAINT `FK_Tipoocorrencia_Natureza` FOREIGN KEY (`id_natureza_receita`) REFERENCES `natureza` (`id_natureza`),
  CONSTRAINT `FK_Tipoocorrencia_Natureza_Despesa` FOREIGN KEY (`id_natureza_despesa`) REFERENCES `natureza` (`id_natureza`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoocorrencia`
--

LOCK TABLES `tipoocorrencia` WRITE;
/*!40000 ALTER TABLE `tipoocorrencia` DISABLE KEYS */;
INSERT INTO `tipoocorrencia` VALUES ('B','Baixa','',NULL,NULL,''),('D','Desconto','',86,87,''),('ES','Estorno','',NULL,NULL,''),('J','Juros','',62,89,''),('L','Liquidação','',NULL,NULL,''),('M','Multa','',90,91,'');
/*!40000 ALTER TABLE `tipoocorrencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipotitulo`
--

DROP TABLE IF EXISTS `tipotitulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipotitulo` (
  `tipo` varchar(4) NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `ativo` bit(1) DEFAULT NULL,
  `sistema` bit(1) NOT NULL DEFAULT b'0',
  `venda` bit(1) DEFAULT b'0',
  `compra` bit(1) DEFAULT b'0',
  `cobranca_bancaria` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipotitulo`
--

LOCK TABLES `tipotitulo` WRITE;
/*!40000 ALTER TABLE `tipotitulo` DISABLE KEYS */;
INSERT INTO `tipotitulo` VALUES ('CC','Crédito em conta corrente','','','','',''),('CHQ','Cheque','','','','','\0'),('DC','Duplicata carteira','','','','','\0'),('DCC','Débito em conta corrente','','','','',''),('DM','Duplicata mercantil','','','','',''),('DP','Nota promissória','\0','','\0','\0','\0'),('DS','Duplicata de serviço','','','','',''),('NA','Nota assinada','\0','','\0','\0','\0');
/*!40000 ALTER TABLE `tipotitulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titulo`
--

DROP TABLE IF EXISTS `titulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `titulo` (
  `id_titulo` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_empresa` bigint(20) NOT NULL,
  `id_pessoa` bigint(20) NOT NULL,
  `tipo_titulo` varchar(4) NOT NULL,
  `numero_titulo` varchar(50) DEFAULT NULL,
  `debito_credito` char(1) DEFAULT NULL,
  `emissao` datetime NOT NULL,
  `valor` float NOT NULL,
  `id_unidade_negocio` int(11) DEFAULT NULL,
  `id_natureza` int(11) DEFAULT NULL,
  `nosso_numero` varchar(20) DEFAULT NULL,
  `num_nota` int(11) DEFAULT NULL,
  `vencimento` datetime DEFAULT NULL,
  `id_conta` int(11) DEFAULT NULL,
  `id_conta_cobranca` int(11) DEFAULT NULL,
  `saldo` float DEFAULT NULL,
  `Observacao` varchar(8000) DEFAULT NULL,
  `id_configcobranca` int(11) DEFAULT NULL,
  `id_protesto` int(11) DEFAULT NULL,
  `dac_nosso_numero` int(11) DEFAULT NULL,
  `id_gestor` bigint(20) DEFAULT NULL,
  `id_movcaixa` bigint(20) DEFAULT NULL,
  `linha_digitavel_boleto` varchar(80) DEFAULT NULL,
  `id_contrato` bigint(20) DEFAULT NULL,
  `parcela` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_titulo`),
  KEY `FK_Titulo_Empresa` (`id_empresa`),
  KEY `FK_Titulo_UnidadeNegocio` (`id_unidade_negocio`),
  KEY `FK_Titulo_Natureza` (`id_natureza`),
  KEY `FK_Titulo_Conta` (`id_conta`),
  KEY `FK_Titulo_ContaCobranca` (`id_conta_cobranca`),
  KEY `FK_Titulo_Pessoa` (`id_pessoa`),
  KEY `FK_Titulo_ConfigCobranca` (`id_configcobranca`),
  KEY `FK_Titulo_Protesto` (`id_protesto`),
  KEY `FK_Titulo_Movcaixa` (`id_movcaixa`),
  KEY `FK_Titulo_Contrato` (`id_contrato`),
  CONSTRAINT `FK_Titulo_ConfigCobranca` FOREIGN KEY (`id_configcobranca`) REFERENCES `configcobranca` (`id`),
  CONSTRAINT `FK_Titulo_Conta` FOREIGN KEY (`id_conta`) REFERENCES `conta` (`id_conta`),
  CONSTRAINT `FK_Titulo_ContaCobranca` FOREIGN KEY (`id_conta_cobranca`) REFERENCES `conta` (`id_conta`),
  CONSTRAINT `FK_Titulo_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`),
  CONSTRAINT `FK_Titulo_Movcaixa` FOREIGN KEY (`id_movcaixa`) REFERENCES `movcaixa` (`id`),
  CONSTRAINT `FK_Titulo_Natureza` FOREIGN KEY (`id_natureza`) REFERENCES `natureza` (`id_natureza`),
  CONSTRAINT `FK_Titulo_Pessoa` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id`),
  CONSTRAINT `FK_Titulo_Protesto` FOREIGN KEY (`id_protesto`) REFERENCES `protesto` (`id`),
  CONSTRAINT `FK_Titulo_UnidadeNegocio` FOREIGN KEY (`id_unidade_negocio`) REFERENCES `unidadenegocio` (`id_unidade`),
  CONSTRAINT `titulo_ibfk_1` FOREIGN KEY (`id_contrato`) REFERENCES `contrato` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titulo`
--

LOCK TABLES `titulo` WRITE;
/*!40000 ALTER TABLE `titulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `titulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titulorefinanciado`
--

DROP TABLE IF EXISTS `titulorefinanciado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `titulorefinanciado` (
  `id_refinanciamento` bigint(20) NOT NULL,
  `id_titulo` bigint(20) NOT NULL,
  PRIMARY KEY (`id_refinanciamento`,`id_titulo`),
  KEY `FK_Titulorefinanciado_Refinanciamento` (`id_refinanciamento`),
  KEY `FK_Titulorefinanciado_Titulo` (`id_titulo`),
  CONSTRAINT `FK_Titulorefinanciado_Refinanciamento` FOREIGN KEY (`id_refinanciamento`) REFERENCES `refinanciamento` (`id`),
  CONSTRAINT `FK_Titulorefinanciado_Titulo` FOREIGN KEY (`id_titulo`) REFERENCES `titulo` (`id_titulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titulorefinanciado`
--

LOCK TABLES `titulorefinanciado` WRITE;
/*!40000 ALTER TABLE `titulorefinanciado` DISABLE KEYS */;
/*!40000 ALTER TABLE `titulorefinanciado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titulorefinanciamento`
--

DROP TABLE IF EXISTS `titulorefinanciamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `titulorefinanciamento` (
  `id_refinanciamento` bigint(20) NOT NULL,
  `id_titulo` bigint(20) NOT NULL,
  `entrada` bit(1) DEFAULT b'0',
  `juros` float DEFAULT NULL,
  `multa` float DEFAULT NULL,
  PRIMARY KEY (`id_refinanciamento`,`id_titulo`),
  KEY `FK_Titulorefinanciamento_Refinanciamento` (`id_refinanciamento`),
  KEY `FK_Titulorefinanciamento_Titulo` (`id_titulo`),
  CONSTRAINT `FK_Titulorefinanciamento_Refinanciamento` FOREIGN KEY (`id_refinanciamento`) REFERENCES `refinanciamento` (`id`),
  CONSTRAINT `FK_Titulorefinanciamento_Titulo` FOREIGN KEY (`id_titulo`) REFERENCES `titulo` (`id_titulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titulorefinanciamento`
--

LOCK TABLES `titulorefinanciamento` WRITE;
/*!40000 ALTER TABLE `titulorefinanciamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `titulorefinanciamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titulos`
--

DROP TABLE IF EXISTS `titulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `titulos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_faturas` bigint(20) NOT NULL,
  `id_titulo` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Titulos_Fatura` (`id_faturas`),
  KEY `Titulos_Titulo` (`id_titulo`),
  CONSTRAINT `Titulos_Fatura` FOREIGN KEY (`id_faturas`) REFERENCES `faturas` (`id`),
  CONSTRAINT `Titulos_Titulo` FOREIGN KEY (`id_titulo`) REFERENCES `titulo` (`id_titulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titulos`
--

LOCK TABLES `titulos` WRITE;
/*!40000 ALTER TABLE `titulos` DISABLE KEYS */;
/*!40000 ALTER TABLE `titulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transf_titulo`
--

DROP TABLE IF EXISTS `transf_titulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transf_titulo` (
  `id_transferencia` bigint(20) NOT NULL,
  `id_titulo` bigint(20) NOT NULL,
  `id_mov_caixa_origem` bigint(20) DEFAULT NULL,
  `id_mov_caixa_destino` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_transferencia`,`id_titulo`),
  KEY `FK_Transftitulo_Transferencia` (`id_transferencia`),
  KEY `FK_Transftitulo_Titulo` (`id_titulo`),
  KEY `FK_Transftitulo_MovcaixaOrigem` (`id_mov_caixa_origem`),
  KEY `FK_Transftitulo_MovcaixaDestino` (`id_mov_caixa_destino`),
  CONSTRAINT `FK_Transftitulo_MovcaixaDestino` FOREIGN KEY (`id_mov_caixa_destino`) REFERENCES `movcaixa` (`id`),
  CONSTRAINT `FK_Transftitulo_MovcaixaOrigem` FOREIGN KEY (`id_mov_caixa_origem`) REFERENCES `movcaixa` (`id`),
  CONSTRAINT `FK_Transftitulo_Titulo` FOREIGN KEY (`id_titulo`) REFERENCES `titulo` (`id_titulo`),
  CONSTRAINT `FK_Transftitulo_Transferencia` FOREIGN KEY (`id_transferencia`) REFERENCES `transferencia` (`id_transferencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transf_titulo`
--

LOCK TABLES `transf_titulo` WRITE;
/*!40000 ALTER TABLE `transf_titulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `transf_titulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transferencia`
--

DROP TABLE IF EXISTS `transferencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transferencia` (
  `id_transferencia` bigint(20) NOT NULL AUTO_INCREMENT,
  `data` date DEFAULT NULL,
  `id_conta_origem` int(11) NOT NULL,
  `id_conta_destino` int(11) NOT NULL,
  `valor` float NOT NULL,
  `historico` varchar(500) DEFAULT NULL,
  `dinheiro_titulo` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id_transferencia`),
  KEY `FK_transferencia_ContaOrigem` (`id_conta_origem`),
  KEY `FK_transferencia_ContaDestino` (`id_conta_destino`),
  CONSTRAINT `FK_Transferencia_ContaDestino` FOREIGN KEY (`id_conta_destino`) REFERENCES `conta` (`id_conta`),
  CONSTRAINT `FK_Transferencia_ContaOrigem` FOREIGN KEY (`id_conta_origem`) REFERENCES `conta` (`id_conta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transferencia`
--

LOCK TABLES `transferencia` WRITE;
/*!40000 ALTER TABLE `transferencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `transferencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transferenciaunidadeestoque`
--

DROP TABLE IF EXISTS `transferenciaunidadeestoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transferenciaunidadeestoque` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `status` char(3) DEFAULT NULL,
  `id_unidade_estoque_origem` bigint(20) NOT NULL,
  `id_unidade_estoque_destino` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_TransferenciaUnidadeEstoqueOrigem_UnidadeEstoque` (`id_unidade_estoque_origem`),
  KEY `FK_TransferenciaUnidadeEstoqueDestino_UnidadeEstoque` (`id_unidade_estoque_destino`),
  CONSTRAINT `FK_TransferenciaUnidadeEstoqueDestino_UnidadeEstoque` FOREIGN KEY (`id_unidade_estoque_destino`) REFERENCES `unidadeestoque` (`id`),
  CONSTRAINT `FK_TransferenciaUnidadeEstoqueOrigem_UnidadeEstoque` FOREIGN KEY (`id_unidade_estoque_origem`) REFERENCES `unidadeestoque` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transferenciaunidadeestoque`
--

LOCK TABLES `transferenciaunidadeestoque` WRITE;
/*!40000 ALTER TABLE `transferenciaunidadeestoque` DISABLE KEYS */;
/*!40000 ALTER TABLE `transferenciaunidadeestoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidadeestoque`
--

DROP TABLE IF EXISTS `unidadeestoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidadeestoque` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `id_empresa` bigint(20) NOT NULL,
  `ativa` bit(1) DEFAULT NULL,
  `venda` bit(1) DEFAULT NULL,
  `locacao_comodato` bit(1) DEFAULT NULL,
  `sistema` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `FK_unidadeEstoque_Empresa` (`id_empresa`),
  CONSTRAINT `FK_UnidadeEstoque_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidadeestoque`
--

LOCK TABLES `unidadeestoque` WRITE;
/*!40000 ALTER TABLE `unidadeestoque` DISABLE KEYS */;
INSERT INTO `unidadeestoque` VALUES (1,'Revenda',1,'','','',''),(2,'Locação/Comodato',1,'','','',''),(3,'Laboratório',1,'','','','');
/*!40000 ALTER TABLE `unidadeestoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidadenegocio`
--

DROP TABLE IF EXISTS `unidadenegocio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidadenegocio` (
  `id_unidade` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) DEFAULT NULL,
  `id_empresa` bigint(20) NOT NULL,
  `ativo` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id_unidade`),
  KEY `FK_UnidadeNegocio_Empresa` (`id_empresa`),
  CONSTRAINT `FK_UnidadeNegocio_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidadenegocio`
--

LOCK TABLES `unidadenegocio` WRITE;
/*!40000 ALTER TABLE `unidadenegocio` DISABLE KEYS */;
/*!40000 ALTER TABLE `unidadenegocio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veiculo`
--

DROP TABLE IF EXISTS `veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `veiculo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `marca` varchar(45) DEFAULT NULL,
  `ano` int(5) DEFAULT NULL,
  `modelo` varchar(50) DEFAULT NULL,
  `placa` varchar(18) DEFAULT NULL,
  `renavam` varchar(25) DEFAULT NULL,
  `id_empresa` bigint(20) DEFAULT NULL,
  `km_hora` char(1) DEFAULT NULL,
  `kmhora_inicial` int(18) DEFAULT NULL,
  `id_categoria` bigint(20) DEFAULT NULL,
  `disponivel_trabalhando` char(3) DEFAULT NULL,
  `kmhora_atual` int(11) DEFAULT NULL,
  `cor` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Veiculo_Empresa` (`id_empresa`),
  KEY `FK_Veiculo_Item` (`id`),
  KEY `FK_Veiculo_CategoriaVeiculo` (`id_categoria`),
  CONSTRAINT `FK_Veiculo_Empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`),
  CONSTRAINT `FK_Veiculo_Item` FOREIGN KEY (`id`) REFERENCES `item` (`id`),
  CONSTRAINT `veiculo_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoriaveiculo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculo`
--

LOCK TABLES `veiculo` WRITE;
/*!40000 ALTER TABLE `veiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `veiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veiculo_fatura`
--

DROP TABLE IF EXISTS `veiculo_fatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `veiculo_fatura` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_fatura` bigint(20) DEFAULT NULL,
  `id_conta_veiculo` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `VeiculoFatura_Fatura` (`id_fatura`),
  KEY `VeiculoFatura_ContaVeiculo` (`id_conta_veiculo`),
  CONSTRAINT `VeiculoFatura_ContaVeiculo` FOREIGN KEY (`id_conta_veiculo`) REFERENCES `conta_veiculo` (`id`),
  CONSTRAINT `VeiculoFatura_Fatura` FOREIGN KEY (`id_fatura`) REFERENCES `fatura` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculo_fatura`
--

LOCK TABLES `veiculo_fatura` WRITE;
/*!40000 ALTER TABLE `veiculo_fatura` DISABLE KEYS */;
/*!40000 ALTER TABLE `veiculo_fatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veiculorastreado`
--

DROP TABLE IF EXISTS `veiculorastreado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `veiculorastreado` (
  `id_veiculo` bigint(20) NOT NULL,
  `id_modulo` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_modulo`),
  KEY `FK_VeiculoRastreado_Veiculo` (`id_veiculo`),
  CONSTRAINT `FK_VeiculoRastreado_Veiculo` FOREIGN KEY (`id_veiculo`) REFERENCES `veiculo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculorastreado`
--

LOCK TABLES `veiculorastreado` WRITE;
/*!40000 ALTER TABLE `veiculorastreado` DISABLE KEYS */;
/*!40000 ALTER TABLE `veiculorastreado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendedor` (
  `id` bigint(20) NOT NULL,
  `alcada_desconto` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `Vendedor_Pessoa` FOREIGN KEY (`id`) REFERENCES `pessoa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor`
--

LOCK TABLES `vendedor` WRITE;
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-06-04 15:53:30
