-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 05-Ago-2019 às 00:37
-- Versão do servidor: 10.1.39-MariaDB
-- versão do PHP: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lacuisine`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `idCliente` int(11) NOT NULL,
  `dataNascimento` date NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `nome` varchar(55) NOT NULL,
  `nomeMae` varchar(55) NOT NULL,
  `dataCadastro` datetime NOT NULL,
  `email` varchar(55) NOT NULL,
  `cidade` varchar(55) NOT NULL,
  `bairro` varchar(55) NOT NULL,
  `logradouro` varchar(55) NOT NULL,
  `numero` bigint(5) NOT NULL,
  `cep` varchar(10) NOT NULL,
  `estado` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`idCliente`, `dataNascimento`, `cpf`, `nome`, `nomeMae`, `dataCadastro`, `email`, `cidade`, `bairro`, `logradouro`, `numero`, `cep`, `estado`) VALUES
(1, '2010-10-10', '110.110.110-10', 'Tester', 'Mamãe Tester', '2019-06-09 00:00:00', 'tester@testador.com', 'TestaCity', 'Testest', 'Rua Testador', 1, '10010000', 'RN'),
(2, '1998-04-29', '116.498.404-70', 'Emmanuel Messias da Silva Costa', 'Maria Lúcia da Silva Costa', '2019-06-09 00:00:00', 'emmanuel_costasilva@hotmail.com', 'Afonso Bezerra', 'Cabugi', 'Rua professor Manoel Januário, Centro', 3, '59510000', 'RN'),
(3, '1999-07-08', '115.234.456-20', 'Carlos Jr Santos', 'Maria Antonieta', '2019-06-09 00:00:00', 'carlosjr@bol.com', 'Macau', 'Nova Descoberta', 'Rua Perigrino', 96, '59511000', 'RN'),
(4, '1998-08-14', '987.654.321-10', 'Katarina Ferraz', 'Pierra Luz Ferraz', '2019-06-10 00:00:00', 'katarinalol@hotmail.com', 'Rio de Janeiro', 'Laranjeiras', 'Avenida Marcos Pontes', 867, '45692000', 'RJ'),
(6, '1990-04-12', '245.678.956-20', 'Junior Boulos Castilho', 'Marta Boulos Castilho', '2019-06-10 00:00:00', 'boulosjr@gmail.com', 'Espirito Santo', 'Pontes Claras', 'Travessa Bibiano Bezerra', 98, '56745200', 'BA'),
(8, '2001-02-05', '657.778.780-30', 'Clara Medeiros Paiva', 'Josefa Medeiros Paiva', '2019-06-10 00:00:00', 'claramp@outlook.com', 'Forte Novo', 'Cajazeiras', 'Avenida das Pontes', 234, '12325134', 'AM'),
(10, '1987-01-08', '445.654.123-00', 'Beredites Mercedes', 'Marcedistes Mercedes', '2019-06-10 00:00:00', 'bereditesmermer@gmail.com', 'Jandira', 'Nova Descoberta', 'Rua Coronel Antônio Pedro', 445, '45645900', 'SE'),
(11, '1972-05-15', '867.566.345-14', 'Cruzes Versales', 'Seiyas Versales', '2019-06-11 00:00:00', 'cruzesver@uol.com.br', 'Surupyitas', 'Canabis', 'Avenida dos Leões', 712, '45610000', 'GO'),
(13, '2000-01-01', '000.000.000-00', 'WhatsApp', 'Facebook', '2019-06-11 00:00:00', 'whatsapp@internet.com', 'Twitter', 'Telegram', 'Instagram', 99, '00400400', 'RN'),
(15, '2000-01-01', '004.040.023-93', 'Fofão', 'fofuxa', '2019-06-11 00:00:00', 'fofo@fofura.com', 'Fofucity', 'foooooofo', 'fofurax', 94, '40404040', 'PI');

-- --------------------------------------------------------

--
-- Estrutura da tabela `itens`
--

CREATE TABLE `itens` (
  `venda_id` bigint(10) DEFAULT NULL,
  `pro_id` bigint(10) DEFAULT NULL,
  `pro_quantidade` int(11) DEFAULT NULL,
  `pro_preco` decimal(10,2) DEFAULT NULL,
  `preco_total` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `itens`
--

INSERT INTO `itens` (`venda_id`, `pro_id`, `pro_quantidade`, `pro_preco`, `preco_total`) VALUES
(NULL, 11, 2, '5.65', '11.30'),
(NULL, 11, 2, '5.65', '11.30'),
(NULL, 11, 1, '5.65', '5.65');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `idProduto` bigint(10) NOT NULL,
  `nome` varchar(55) NOT NULL,
  `tipo` varchar(55) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `peso` decimal(10,2) DEFAULT NULL,
  `altura` decimal(10,2) DEFAULT NULL,
  `largura` decimal(10,2) DEFAULT NULL,
  `comprimento` decimal(10,2) DEFAULT NULL,
  `alturaEmbalagem` decimal(10,2) DEFAULT NULL,
  `larguraEmbalagem` decimal(10,2) DEFAULT NULL,
  `comprimentoEmbalagem` decimal(10,2) DEFAULT NULL,
  `dataCadastro` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`idProduto`, `nome`, `tipo`, `preco`, `peso`, `altura`, `largura`, `comprimento`, `alturaEmbalagem`, `larguraEmbalagem`, `comprimentoEmbalagem`, `dataCadastro`) VALUES
(5, 'Espátula', 'Faqueiros e Talheres', '12.89', '0.12', '35.00', '1.00', '2.00', '30.00', '6.00', '6.00', '2019-06-30'),
(6, 'Assadeira', 'Panelas e Frigideiras', '79.30', '0.50', '6.50', '15.30', '27.60', '30.00', '30.00', '30.00', '2019-06-30'),
(7, 'Jarra p/ Suco', 'Chaleiras e Leiteiras', '10.99', '0.11', '14.00', '5.60', '5.00', '25.00', '18.00', '18.00', '2019-06-30'),
(8, 'Desinfetante p/ Fogão', 'Produtos de Limpeza', '8.99', '0.79', '25.30', '5.03', '5.03', '28.03', '8.52', '8.52', '2019-06-30'),
(9, 'Forma p/ Bolo', 'Formas e Assadeiras', '23.15', '0.13', '13.43', '18.80', '18.80', '20.00', '25.00', '25.00', '2019-07-01'),
(10, 'Taça de Cristal', 'Xícaras e Canecas', '26.78', '0.11', '9.00', '5.00', '5.00', '12.20', '12.20', '12.20', '2019-07-01'),
(11, 'Abridor de Latas', 'Utensílios e Diversos', '5.65', '0.18', '5.00', '0.20', '8.00', '8.00', '4.00', '12.00', '2019-07-01'),
(12, 'Fritadeira Air Fryer', 'Formas e Assadeiras', '329.90', '2.90', '35.00', '26.00', '26.00', '40.00', '40.00', '40.00', '2019-07-01'),
(13, 'Talheres em Madeira', 'Faqueiros e Talheres', '126.87', '0.90', '16.04', '0.34', '1.60', '25.04', '6.04', '40.04', '2019-07-01'),
(14, 'Garrafa Térmica', 'Utensílios e Diversos', '19.90', '0.12', '15.00', '5.03', '3.75', '17.00', '8.00', '8.00', '2019-07-06');

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda`
--

CREATE TABLE `venda` (
  `idVenda` bigint(20) NOT NULL,
  `idCliente` bigint(20) NOT NULL,
  `idVendedor` bigint(20) NOT NULL,
  `formaPagamento` varchar(20) NOT NULL,
  `dataVenda` date NOT NULL,
  `cartao` varchar(19) DEFAULT NULL,
  `dinheiro` decimal(10,2) DEFAULT NULL,
  `bandeiraCartao` varchar(55) DEFAULT NULL,
  `cvvCartao` int(3) DEFAULT NULL,
  `dataValidade` date DEFAULT NULL,
  `nomeClienteCartao` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `venda`
--

INSERT INTO `venda` (`idVenda`, `idCliente`, `idVendedor`, `formaPagamento`, `dataVenda`, `cartao`, `dinheiro`, `bandeiraCartao`, `cvvCartao`, `dataValidade`, `nomeClienteCartao`) VALUES
(33, 4, 6, 'cartao', '2019-07-06', '2994 8481 2482 1848', '0.00', 'Nubank', 678, '2019-07-06', 'Marta M D Medeiros'),
(34, 2, 3, 'dinheiro', '2019-07-06', '-', '158.60', '-', 0, '2019-07-06', NULL),
(44, 2, 3, 'dinheiro', '2019-07-07', '-', '11.30', '-', 0, '2019-07-07', NULL),
(45, 2, 11, 'dinheiro', '2019-07-25', '-', '5.65', '-', 0, '2019-07-25', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendedores`
--

CREATE TABLE `vendedores` (
  `idVendedor` int(11) NOT NULL,
  `nome` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `vendedores`
--

INSERT INTO `vendedores` (`idVendedor`, `nome`) VALUES
(1, 'Emmanuel Messias'),
(2, 'Gustavo Guanabara'),
(3, 'Xycko'),
(4, 'Pablo Mistercron'),
(5, 'Lord Valdemort'),
(6, 'Nyvi Estephan'),
(7, 'Helena Gustamindes'),
(8, 'Patrícia Abravanel'),
(9, 'Thiago Arduíno'),
(10, 'Camila Paes'),
(11, 'João Espalha Lixo');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idCliente`) USING BTREE;

--
-- Indexes for table `itens`
--
ALTER TABLE `itens`
  ADD KEY `fk_id_venda` (`venda_id`),
  ADD KEY `fk_id_produto` (`pro_id`);

--
-- Indexes for table `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`idProduto`);

--
-- Indexes for table `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`idVenda`);

--
-- Indexes for table `vendedores`
--
ALTER TABLE `vendedores`
  ADD PRIMARY KEY (`idVendedor`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `produtos`
--
ALTER TABLE `produtos`
  MODIFY `idProduto` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `venda`
--
ALTER TABLE `venda`
  MODIFY `idVenda` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `vendedores`
--
ALTER TABLE `vendedores`
  MODIFY `idVendedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `itens`
--
ALTER TABLE `itens`
  ADD CONSTRAINT `fk_id_produto` FOREIGN KEY (`pro_id`) REFERENCES `produtos` (`idProduto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_venda` FOREIGN KEY (`venda_id`) REFERENCES `venda` (`idVenda`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
