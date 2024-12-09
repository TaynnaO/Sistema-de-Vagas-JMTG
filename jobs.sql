-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 09/12/2024 às 00:16
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `jobs`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `rg` varchar(20) DEFAULT NULL,
  `dtNascimento` text DEFAULT NULL,
  `celular` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `senha` varchar(255) NOT NULL,
  `id_funcao` int(11) DEFAULT NULL,
  `foto` longblob DEFAULT NULL,
  `reset_token` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `admin`
--

INSERT INTO `admin` (`id`, `nome`, `cpf`, `rg`, `dtNascimento`, `celular`, `email`, `senha`, `id_funcao`, `foto`, `reset_token`) VALUES
(1, 'Tiago Rodrigues', '111.222.333-44', '2345678', '1990-02-02', '61999999999', 'proftiago@gmail.com', '1234', 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `avalicao`
--

CREATE TABLE `avalicao` (
  `id` int(11) NOT NULL,
  `id_cadastro` int(11) NOT NULL,
  `id_vaga` int(6) UNSIGNED NOT NULL,
  `nota` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cadastro`
--

CREATE TABLE `cadastro` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `sobrenome` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `rg` varchar(20) DEFAULT NULL,
  `dtNascimento` text DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `celular` varchar(20) DEFAULT NULL,
  `id_profissao` int(11) DEFAULT NULL,
  `foto` longblob DEFAULT NULL,
  `curriculo` varchar(255) DEFAULT NULL,
  `reset_token` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cadastro`
--

INSERT INTO `cadastro` (`id`, `nome`, `sobrenome`, `email`, `senha`, `cpf`, `rg`, `dtNascimento`, `endereco`, `cidade`, `celular`, `id_profissao`, `foto`, `curriculo`, `reset_token`) VALUES
(30, 'Taynna', 'Oliveira', 'taynna@gmail.com', '1234', '010.257.681-59', '1234567', '1995-08-22', 'Rua da Felicidade', 'Brasília', '61999999999', NULL, 0x363735356533333231353537352e6a7067, NULL, NULL),
(33, 'Guilherme', 'Bandeira', 'guilherme@gmail.com', '1234', '123.345.567-45', '1234567', '2002-02-02', 'Rua da Felicidade', 'Brasília', '61999999999', 1, NULL, NULL, NULL),
(34, 'Gislene', ' Aparecida', 'gislene@gmail.com', '1234', '222.333.444-55', '3456789', '1976-02-02', 'Rua da Felicidade', 'Brasília', '61999999999', 4, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `empresa`
--

CREATE TABLE `empresa` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cnpj` varchar(18) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `celular` varchar(20) DEFAULT NULL,
  `senha` varchar(255) NOT NULL,
  `foto` longblob DEFAULT NULL,
  `reset_token` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcao`
--

CREATE TABLE `funcao` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `funcao`
--

INSERT INTO `funcao` (`id`, `nome`) VALUES
(1, 'Diretoria'),
(2, 'Coordenação'),
(3, 'Orientação'),
(4, 'Secretaria'),
(5, 'Professor');

-- --------------------------------------------------------

--
-- Estrutura para tabela `historico`
--

CREATE TABLE `historico` (
  `id` int(11) NOT NULL,
  `id_cadastro_user` int(11) NOT NULL,
  `id_vaga_user` int(6) UNSIGNED NOT NULL,
  `forma_pagamento_user` varchar(50) NOT NULL,
  `valor_user` decimal(10,2) NOT NULL,
  `dtPagamento` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `historico`
--

INSERT INTO `historico` (`id`, `id_cadastro_user`, `id_vaga_user`, `forma_pagamento_user`, `valor_user`, `dtPagamento`) VALUES
(1, 21, 26, 'Débito', 450.00, '2023-05-17 15:09:44'),
(2, 22, 26, 'Dinheiro', 950.00, '2023-05-17 18:37:10'),
(3, 21, 26, 'PIX', 1200.00, '2023-05-17 18:37:24'),
(4, 21, 26, 'PIX', 4578.00, '2023-05-23 22:02:11');

-- --------------------------------------------------------

--
-- Estrutura para tabela `inscricoes`
--

CREATE TABLE `inscricoes` (
  `id` int(6) UNSIGNED NOT NULL,
  `id_vaga` int(6) UNSIGNED NOT NULL,
  `nome_usuario` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `inscricoes`
--

INSERT INTO `inscricoes` (`id`, `id_vaga`, `nome_usuario`) VALUES
(1, 26, '0');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pagamento`
--

CREATE TABLE `pagamento` (
  `id` int(11) NOT NULL,
  `id_cadastro` int(11) NOT NULL,
  `id_vaga` int(6) UNSIGNED NOT NULL,
  `forma_pagamento` varchar(50) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `dtPagamento` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pagamento`
--

INSERT INTO `pagamento` (`id`, `id_cadastro`, `id_vaga`, `forma_pagamento`, `valor`, `dtPagamento`) VALUES
(9, 20, 25, '', 0.00, NULL),
(10, 21, 26, 'PIX', 4578.00, '2023-05-23 22:02:11'),
(11, 22, 26, 'Dinheiro', 950.00, '2023-05-17 18:37:10');

-- --------------------------------------------------------

--
-- Estrutura para tabela `profissao`
--

CREATE TABLE `profissao` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `profissao`
--

INSERT INTO `profissao` (`id`, `nome`) VALUES
(1, 'Programador'),
(2, 'Designer'),
(3, 'Engenheiro'),
(4, 'Técnico em Administração'),
(5, 'Costureira'),
(6, 'Eletricista'),
(7, 'Técnico em Logística'),
(8, 'Desenvolvedor Web'),
(9, 'Assistente de RH');

-- --------------------------------------------------------

--
-- Estrutura para tabela `vagas`
--

CREATE TABLE `vagas` (
  `id` int(6) UNSIGNED NOT NULL,
  `empresa` varchar(30) NOT NULL,
  `cargo` varchar(30) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `requisitos` text DEFAULT NULL,
  `beneficios` text DEFAULT NULL,
  `data_cadastro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `usuario_responsavel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `vagas`
--

INSERT INTO `vagas` (`id`, `empresa`, `cargo`, `telefone`, `email`, `requisitos`, `beneficios`, `data_cadastro`, `usuario_responsavel`) VALUES
(25, 'Empresa andre', 'cargo andre', '9898989', 'andre@teste.com', 'test', 'test', '2023-05-17 12:41:34', 21),
(26, 'empres gabriel', 'cargo gabriel', '90809890', 'gabriel.bernardino@urca.br', 'test', 'test', '2023-05-17 12:42:14', 20);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `cadastro`
--
ALTER TABLE `cadastro`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `inscricoes`
--
ALTER TABLE `inscricoes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `cadastro`
--
ALTER TABLE `cadastro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de tabela `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `inscricoes`
--
ALTER TABLE `inscricoes`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
