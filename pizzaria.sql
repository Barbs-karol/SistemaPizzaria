-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 08-Dez-2021 às 19:25
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `pizzaria`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cardapio`
--

CREATE TABLE `cardapio` (
  `car_cod` int(11) NOT NULL,
  `car_descricao` varchar(80) NOT NULL,
  `car_tipo` varchar(80) NOT NULL,
  `car_valor` decimal(10,2) NOT NULL
);

--
-- Extraindo dados da tabela `cardapio`
--

INSERT INTO `cardapio` (`car_cod`, `car_descricao`, `car_tipo`, `car_valor`) VALUES
(1, 'Pizza Calabresa', 'Média', '20.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `cli_cod` int(11) NOT NULL,
  `cli_nome` varchar(80) NOT NULL,
  `cli_rua` varchar(80) NOT NULL,
  `cli_bairro` varchar(80) NOT NULL,
  `cli_telefone` varchar(80) NOT NULL,
  `cli_data_cad` date NOT NULL
);

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`cli_cod`, `cli_nome`, `cli_rua`, `cli_bairro`, `cli_telefone`, `cli_data_cad`) VALUES
(1, 'João', 'Rua X', 'Bairro Z', '988455046', '2021-11-01'),
(2, 'barbara', 'rua', 'bairro', '(12) 98877-5565', '2021-12-08'),
(6, 'testee', 'y', 'x', '(55) 55555-5555', '2021-12-08'),
(7, 'testeeee', 's', 's', '(55) 55555-5555', '2021-12-08');

-- --------------------------------------------------------

--
-- Estrutura da tabela `entregador`
--

CREATE TABLE `entregador` (
  `ent_cod` int(11) NOT NULL,
  `ent_nome` varchar(80) NOT NULL,
  `ent_status` varchar(80) NOT NULL,
  `ent_data_cad` date NOT NULL
);

--
-- Extraindo dados da tabela `entregador`
--

INSERT INTO `entregador` (`ent_cod`, `ent_nome`, `ent_status`, `ent_data_cad`) VALUES
(1, 'José', 'Disponivel', '2021-11-03');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionarios`
--

CREATE TABLE `funcionarios` (
  `fun_cod` int(11) NOT NULL,
  `fun_nome` varchar(80) NOT NULL,
  `fun_cargo` varchar(80) NOT NULL,
  `fun_permissao` varchar(80) NOT NULL,
  `fun_data_cad` date NOT NULL
);

--
-- Extraindo dados da tabela `funcionarios`
--

INSERT INTO `funcionarios` (`fun_cod`, `fun_nome`, `fun_cargo`, `fun_permissao`, `fun_data_cad`) VALUES
(1, 'Maria', 'Atendente', 'a', '2021-10-05');

-- --------------------------------------------------------

--
-- Estrutura da tabela `item`
--

CREATE TABLE `item` (
  `item_cod` int(11) NOT NULL,
  `item_ent_cod` int(11) NOT NULL,
  `item_fun_cod` int(11) NOT NULL,
  `item_cli_cod` int(11) NOT NULL,
  `item_ped_cod` int(11) NOT NULL,
  `item_car_cod` int(11) NOT NULL,
  `item_quantidade` int(11) NOT NULL
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `ped_cod` int(11) NOT NULL,
  `ped_data` date NOT NULL,
  `ped_total` decimal(10,2) NOT NULL,
  `ped_cli_cod` int(11) NOT NULL,
  `ped_fun_cod` int(11) NOT NULL,
  `ped_ent_cod` int(11) NOT NULL,
  `ped_status` varchar(50) NOT NULL
);

--
-- Extraindo dados da tabela `pedidos`
--

INSERT INTO `pedidos` (`ped_cod`, `ped_data`, `ped_total`, `ped_cli_cod`, `ped_fun_cod`, `ped_ent_cod`, `ped_status`) VALUES
(2, '2021-11-10', '60.00', 1, 1, 1, '');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cardapio`
--
ALTER TABLE `cardapio`
  ADD PRIMARY KEY (`car_cod`);

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cli_cod`);

--
-- Índices para tabela `entregador`
--
ALTER TABLE `entregador`
  ADD PRIMARY KEY (`ent_cod`);

--
-- Índices para tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`fun_cod`);

--
-- Índices para tabela `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`item_cod`,`item_ent_cod`,`item_cli_cod`,`item_fun_cod`,`item_ped_cod`,`item_car_cod`,`item_quantidade`),
  ADD KEY `ItemPedido` (`item_ped_cod`,`item_cli_cod`,`item_fun_cod`,`item_ent_cod`),
  ADD KEY `ItemCardapio` (`item_car_cod`),
  ADD KEY `ItemEntregador` (`item_ent_cod`),
  ADD KEY `ItemFuncionario` (`item_fun_cod`),
  ADD KEY `ItemCliente` (`item_cli_cod`);

--
-- Índices para tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`ped_cod`),
  ADD KEY `ped_cli_cod` (`ped_cli_cod`),
  ADD KEY `ped_fun_cod` (`ped_fun_cod`),
  ADD KEY `ped_ent_cod` (`ped_ent_cod`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cardapio`
--
ALTER TABLE `cardapio`
  MODIFY `car_cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `cli_cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `entregador`
--
ALTER TABLE `entregador`
  MODIFY `ent_cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `fun_cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `item`
--
ALTER TABLE `item`
  MODIFY `item_cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `ped_cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `ItemCardapio` FOREIGN KEY (`item_car_cod`) REFERENCES `cardapio` (`car_cod`),
  ADD CONSTRAINT `ItemCliente` FOREIGN KEY (`item_cli_cod`) REFERENCES `clientes` (`cli_cod`),
  ADD CONSTRAINT `ItemEntregador` FOREIGN KEY (`item_ent_cod`) REFERENCES `entregador` (`ent_cod`),
  ADD CONSTRAINT `ItemFuncionario` FOREIGN KEY (`item_fun_cod`) REFERENCES `funcionarios` (`fun_cod`),
  ADD CONSTRAINT `ItemPedido` FOREIGN KEY (`item_ped_cod`) REFERENCES `pedidos` (`ped_cod`);

--
-- Limitadores para a tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `ClientePedido` FOREIGN KEY (`ped_cli_cod`) REFERENCES `clientes` (`cli_cod`),
  ADD CONSTRAINT `EntregadorPedido` FOREIGN KEY (`ped_ent_cod`) REFERENCES `entregador` (`ent_cod`),
  ADD CONSTRAINT `FuncionarioPedido` FOREIGN KEY (`ped_fun_cod`) REFERENCES `funcionarios` (`fun_cod`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
