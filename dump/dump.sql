-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Dic 22, 2023 alle 12:55
-- Versione del server: 10.1.38-MariaDB
-- Versione PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cinema 2000`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `film`
--

CREATE TABLE `film` (
  `id_film` int(11) NOT NULL,
  `titolo` varchar(100) DEFAULT NULL,
  `genere` varchar(50) DEFAULT NULL,
  `durata` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `film`
--

INSERT INTO `film` (`id_film`, `titolo`, `genere`, `durata`) VALUES
(301, 'Inception', 'Fantascienza', '148 min'),
(302, 'La La Land', 'Musical', '128 min'),
(303, 'Il Padrino', 'Drammatico', '175 min'),
(304, 'C è ancora domani', 'Commedia', '157 min');

-- --------------------------------------------------------

--
-- Struttura della tabella `prenotazioni`
--

CREATE TABLE `prenotazioni` (
  `id_prenotazioni` int(11) NOT NULL,
  `numero_posto` int(11) DEFAULT NULL,
  `fk_id_spettacolo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `prenotazioni`
--

INSERT INTO `prenotazioni` (`id_prenotazioni`, `numero_posto`, `fk_id_spettacolo`) VALUES
(601, 1, 501),
(602, 2, 502),
(603, 3, 503),
(604, 4, 504);

-- --------------------------------------------------------

--
-- Struttura della tabella `sale`
--

CREATE TABLE `sale` (
  `id_sala` int(11) NOT NULL,
  `numero_sala` int(11) DEFAULT NULL,
  `posti_disponibili` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `sale`
--

INSERT INTO `sale` (`id_sala`, `numero_sala`, `posti_disponibili`) VALUES
(401, 1, 100),
(402, 2, 80),
(403, 3, 120),
(404, 4, 110);

-- --------------------------------------------------------

--
-- Struttura della tabella `spettacoli`
--

CREATE TABLE `spettacoli` (
  `id_spettacolo` int(11) NOT NULL,
  `data_ora` datetime DEFAULT NULL,
  `fk_id_film` int(11) DEFAULT NULL,
  `fk_id_sala` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `spettacoli`
--

INSERT INTO `spettacoli` (`id_spettacolo`, `data_ora`, `fk_id_film`, `fk_id_sala`) VALUES
(501, '2023-01-15 18:00:00', 301, 401),
(502, '2023-02-10 20:30:00', 302, 402),
(503, '2023-03-05 15:45:00', 303, 403),
(504, '2023-04-15 21:00:00', 304, 404);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id_film`);

--
-- Indici per le tabelle `prenotazioni`
--
ALTER TABLE `prenotazioni`
  ADD PRIMARY KEY (`id_prenotazioni`),
  ADD KEY `fk_id_spettacolo` (`fk_id_spettacolo`);

--
-- Indici per le tabelle `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`id_sala`);

--
-- Indici per le tabelle `spettacoli`
--
ALTER TABLE `spettacoli`
  ADD PRIMARY KEY (`id_spettacolo`),
  ADD KEY `fk_id_film` (`fk_id_film`),
  ADD KEY `fk_id_sala` (`fk_id_sala`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `film`
--
ALTER TABLE `film`
  MODIFY `id_film` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=305;

--
-- AUTO_INCREMENT per la tabella `prenotazioni`
--
ALTER TABLE `prenotazioni`
  MODIFY `id_prenotazioni` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=605;

--
-- AUTO_INCREMENT per la tabella `sale`
--
ALTER TABLE `sale`
  MODIFY `id_sala` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=405;

--
-- AUTO_INCREMENT per la tabella `spettacoli`
--
ALTER TABLE `spettacoli`
  MODIFY `id_spettacolo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=505;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `prenotazioni`
--
ALTER TABLE `prenotazioni`
  ADD CONSTRAINT `prenotazioni_ibfk_1` FOREIGN KEY (`fk_id_spettacolo`) REFERENCES `spettacoli` (`id_spettacolo`);

--
-- Limiti per la tabella `spettacoli`
--
ALTER TABLE `spettacoli`
  ADD CONSTRAINT `spettacoli_ibfk_1` FOREIGN KEY (`fk_id_film`) REFERENCES `film` (`id_film`),
  ADD CONSTRAINT `spettacoli_ibfk_2` FOREIGN KEY (`fk_id_sala`) REFERENCES `sale` (`id_sala`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
