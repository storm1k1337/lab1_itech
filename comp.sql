-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июн 12 2022 г., 22:26
-- Версия сервера: 10.4.22-MariaDB
-- Версия PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `comp`
--

-- --------------------------------------------------------

--
-- Структура таблицы `computer`
--

CREATE TABLE `computer` (
  `ID_Computer` int(11) NOT NULL,
  `netname` varchar(255) NOT NULL,
  `motherboard` varchar(255) NOT NULL,
  `RAM_capacity` int(11) NOT NULL,
  `HDD_capacity` int(11) NOT NULL,
  `monitor` varchar(255) NOT NULL,
  `vendor` varchar(255) NOT NULL,
  `guarantee` float NOT NULL,
  `FID_Processor` int(11) NOT NULL,
  `date_purchase` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `computer`
--

INSERT INTO `computer` (`ID_Computer`, `netname`, `motherboard`, `RAM_capacity`, `HDD_capacity`, `monitor`, `vendor`, `guarantee`, `FID_Processor`, `date_purchase`) VALUES
(1, 'STORM', 'MSI MEG Z690I UNIFY', 64, 2048, 'IPS', 'ASUS', 24, 1, '2022-06-07'),
(2, 'MASTER', 'ASUS ROG MAXIMUS Z690 EXTREME', 64, 2048, 'VA', 'AOC', 24, 1, '2022-06-08'),
(3, 'USER-PC', 'MSI Z490-A PRO', 32, 1024, 'VA', 'Samsung', 24, 2, '2022-06-01'),
(4, 'VLAD', 'MSI MEG Z490I UNIFY', 32, 1024, 'IPS', 'Dell', 12, 2, '2021-07-07');

-- --------------------------------------------------------

--
-- Структура таблицы `computer_software`
--

CREATE TABLE `computer_software` (
  `FID_Computer` int(11) NOT NULL,
  `FID_Software` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `computer_software`
--

INSERT INTO `computer_software` (`FID_Computer`, `FID_Software`) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `processor`
--

CREATE TABLE `processor` (
  `ID_Processor` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `frequency` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `processor`
--

INSERT INTO `processor` (`ID_Processor`, `name`, `frequency`) VALUES
(1, 'Intel Core i9 12900k', '5,2'),
(2, 'Intel Core i7 10700k', '5,0');

-- --------------------------------------------------------

--
-- Структура таблицы `software`
--

CREATE TABLE `software` (
  `ID_SOFTWARE` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `software`
--

INSERT INTO `software` (`ID_SOFTWARE`, `name`) VALUES
(1, 'Windows'),
(2, 'macOS'),
(3, 'Linux');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `computer`
--
ALTER TABLE `computer`
  ADD PRIMARY KEY (`ID_Computer`),
  ADD UNIQUE KEY `ID_Computer_2` (`ID_Computer`),
  ADD KEY `FID_Processor` (`FID_Processor`),
  ADD KEY `ID_Computer` (`ID_Computer`);

--
-- Индексы таблицы `computer_software`
--
ALTER TABLE `computer_software`
  ADD KEY `computer_software_ibfk_1` (`FID_Computer`),
  ADD KEY `FID_Software` (`FID_Software`);

--
-- Индексы таблицы `processor`
--
ALTER TABLE `processor`
  ADD PRIMARY KEY (`ID_Processor`),
  ADD KEY `ID_Processor` (`ID_Processor`);

--
-- Индексы таблицы `software`
--
ALTER TABLE `software`
  ADD PRIMARY KEY (`ID_SOFTWARE`),
  ADD KEY `ID_SOFTWARE` (`ID_SOFTWARE`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `processor`
--
ALTER TABLE `processor`
  MODIFY `ID_Processor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `software`
--
ALTER TABLE `software`
  MODIFY `ID_SOFTWARE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `computer`
--
ALTER TABLE `computer`
  ADD CONSTRAINT `computer_ibfk_1` FOREIGN KEY (`FID_Processor`) REFERENCES `processor` (`ID_Processor`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `computer_software`
--
ALTER TABLE `computer_software`
  ADD CONSTRAINT `computer_software_ibfk_1` FOREIGN KEY (`FID_Computer`) REFERENCES `computer` (`ID_Computer`) ON UPDATE CASCADE,
  ADD CONSTRAINT `computer_software_ibfk_2` FOREIGN KEY (`FID_Software`) REFERENCES `software` (`ID_SOFTWARE`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
