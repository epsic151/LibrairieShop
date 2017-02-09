SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS `projet151` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `projet151`;

CREATE TABLE IF NOT EXISTS `t_book` (
  `id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `overview` text NOT NULL,
  `author_sex` varchar(100) NOT NULL COMMENT 'M=MALE / F=FEMALE',
  `author_name` varchar(100) NOT NULL,
  `author_fname` varchar(100) NOT NULL,
  `year` int(4) NOT NULL COMMENT 'YYYY',
  `price` decimal(11,2) NOT NULL COMMENT 'en CHF',
  `img_cover` varchar(1000) NOT NULL COMMENT 'image location path',
  `edition` varchar(100) NOT NULL,
  `logistic_qnt` int(11) NOT NULL COMMENT 'état unités en stock',
  `FK_genre` int(11) NOT NULL,
  `creation_date` datetime DEFAULT NULL COMMENT 'INSERT datetime',
  `modif_date` datetime DEFAULT NULL COMMENT 'UPDATE datetime',
  `deleted` int(1) NOT NULL DEFAULT '0' COMMENT '0=visible / 1=invisible'
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

TRUNCATE TABLE `t_book`;
INSERT INTO `t_book` (`id`, `title`, `overview`, `author_sex`, `author_name`, `author_fname`, `year`, `price`, `img_cover`, `edition`, `logistic_qnt`, `FK_genre`, `creation_date`, `modif_date`, `deleted`) VALUES
(1, 'Une brève histoire du temps', 'Non de la biographie du célèbre physicien.', 'M', 'Hawking', 'Stephen', 2014, '53.50', '1_1486653288.jpeg', 'Flammarion', 15, 29, NULL, '2017-02-09 16:14:49', 0),
(2, 'Navigation d''Ulysse', 'overview', 'M', 'David', 'Miranda', 2014, '73.00', 'dsdasdsadasd', 'Rencontre', 11, 1, NULL, NULL, 0),
(3, 'Feu Mathias Pascal', 'Un type qu''on croit mort réapparaît. Trop tard ....', 'M', 'Pirandello', 'Miranda', 2014, '3.50', '3_1486654007.jpeg', 'Calmann-Lévy', 15, 3, NULL, '2017-02-09 16:26:47', 0),
(4, 'Fumée rouge', 'overview', 'M', 'David', 'Miranda', 2014, '97.50', 'dsdasdsadasd', 'edition', 15, 1, NULL, NULL, 0),
(5, 'Voyage au bout de la nuit', 'overview', 'M', 'David', 'Miranda', 2014, '76.50', 'dsdasdsadasd', 'edition', 15, 1, NULL, NULL, 0),
(6, 'Le guide Marabout du Judo', 'overview', 'M', 'David', 'Miranda', 2014, '90.50', 'dsdasdsadasd', 'edition', 15, 2, NULL, NULL, 0),
(7, 'Métapsychologie', 'overview', 'M', 'David', 'Miranda', 2014, '21.00', 'dsdasdsadasd', 'edition', 15, 1, NULL, NULL, 0),
(8, 'Se', 'overview', 'M', 'David', 'Miranda', 2014, '32.50', 'dsdasdsadasd', 'edition', 15, 2, NULL, NULL, 0),
(9, 'Tolérance zéro', 'overview', 'M', 'David', 'Miranda', 2014, '98.50', 'dsdasdsadasd', 'edition', 15, 1, NULL, NULL, 0),
(10, 'Le meilleur des mondes', 'overview', 'M', 'David', 'Miranda', 2014, '94.50', 'dsdasdsadasd', 'edition', 15, 1, NULL, NULL, 0),
(11, 'Bel-Ami', 'overview', 'M', 'David', 'Miranda', 2014, '75.50', 'dsdasdsadasd', 'edition', 15, 1, NULL, NULL, 0),
(12, 'Les oreilles rouges', 'overview', 'M', 'David', 'Miranda', 2014, '95.00', 'dsdasdsadasd', 'edition', 15, 1, NULL, NULL, 0),
(13, 'La chute', 'overview', 'M', 'David', 'Miranda', 2014, '46.50', 'dsdasdsadasd', 'edition', 15, 1, NULL, NULL, 0),
(14, 'Français-Allemand', 'overview', 'M', 'David', 'Miranda', 2014, '48.00', 'dsdasdsadasd', 'edition', 15, 2, NULL, NULL, 0),
(15, 'Alex', 'overview', 'M', 'David', 'Miranda', 2014, '98.00', 'dsdasdsadasd', 'edition', 15, 1, NULL, NULL, 0),
(16, 'The joy luck club', 'overview', 'M', 'David', 'Miranda', 2014, '46.50', 'dsdasdsadasd', 'edition', 15, 1, NULL, NULL, 0),
(17, 'Le cœur conscient', 'overview', 'M', 'David', 'Miranda', 2014, '36.50', 'dsdasdsadasd', 'edition', 15, 1, NULL, NULL, 0),
(18, 'La part du vent', 'overview', 'M', 'David', 'Miranda', 2014, '43.50', 'dsdasdsadasd', 'edition', 15, 1, NULL, NULL, 0),
(19, 'Jonathan Livingston Seagull', 'overview', 'M', 'David', 'Miranda', 2014, '6.50', 'dsdasdsadasd', 'edition', 15, 1, NULL, NULL, 0),
(20, 'Educating Rita', 'overview', 'M', 'David', 'Miranda', 2014, '2.00', 'dsdasdsadasd', 'edition', 15, 1, NULL, NULL, 0),
(21, 'Lies of silence', 'overview', 'M', 'David', 'Miranda', 2014, '88.50', 'dsdasdsadasd', 'edition', 15, 1, NULL, NULL, 0),
(22, 'Nuits d''enfer', 'overview', 'M', 'David', 'Miranda', 2014, '36.50', 'dsdasdsadasd', 'edition', 15, 1, NULL, NULL, 0),
(23, 'Enemies', 'overview', 'M', 'David', 'Miranda', 2014, '17.00', 'dsdasdsadasd', 'edition', 15, 1, NULL, NULL, 0),
(24, 'Maria, fille de Flandre', 'overview', 'M', 'David', 'Miranda', 2014, '75.00', 'dsdasdsadasd', 'edition', 15, 1, NULL, NULL, 0),
(25, 'Aphrodite', 'overview', 'M', 'David', 'Miranda', 2014, '22.00', 'dsdasdsadasd', 'edition', 14, 1, NULL, NULL, 0),
(26, 'Le pot au noir', 'overview', 'M', 'David', 'Miranda', 2014, '85.00', 'dsdasdsadasd', 'edition', 14, 1, NULL, NULL, 0),
(27, 'Le grand Meaulnes', 'overview', 'M', 'David', 'Miranda', 2014, '59.00', 'dsdasdsadasd', 'edition', 15, 1, NULL, NULL, 0),
(28, 'Corps et âmes', 'overview', 'M', 'David', 'Miranda', 2014, '37.50', 'dsdasdsadasd', 'edition', 15, 1, NULL, NULL, 0),
(29, 'La Bible', 'overview', 'M', 'David', 'Miranda', 2014, '11.00', 'dsdasdsadasd', 'edition', 15, 1, NULL, NULL, 0),
(30, 'La crevasse des maquisards', 'overview', 'M', 'David', 'Miranda', 2014, '42.00', 'dsdasdsadasd', 'edition', 15, 1, NULL, NULL, 0),
(31, 'Tristan et Iseult', 'overview', 'M', 'David', 'Miranda', 2014, '76.00', 'dsdasdsadasd', 'edition', 15, 1, NULL, NULL, 0),
(32, 'Le gambit des étoiles', 'overview', 'M', 'David', 'Miranda', 2014, '53.50', 'dsdasdsadasd', 'edition', 15, 1, NULL, NULL, 0),
(33, 'Stamps & stories', 'overview', 'M', 'David', 'Miranda', 2014, '38.00', 'dsdasdsadasd', 'edition', 15, 2, NULL, NULL, 0),
(34, 'Skinwalkers', 'overview', 'M', 'David', 'Miranda', 2014, '29.00', 'dsdasdsadasd', 'edition', 15, 1, NULL, NULL, 0),
(35, 'The Christmas books', 'overview', 'M', 'David', 'Miranda', 2014, '31.00', 'dsdasdsadasd', 'edition', 15, 1, NULL, NULL, 0),
(36, 'A Christmas Carol', 'overview', 'M', 'David', 'Miranda', 2014, '66.50', 'dsdasdsadasd', 'edition', 15, 1, NULL, NULL, 0),
(37, 'La dixième prophétie', 'overview', 'M', 'David', 'Miranda', 2014, '39.50', 'dsdasdsadasd', 'edition', 15, 1, NULL, NULL, 0),
(38, 'L''homme qui rétrécit', 'overview', 'M', 'David', 'Miranda', 2014, '96.00', 'dsdasdsadasd', 'edition', 15, 1, NULL, NULL, 0),
(39, 'Histoires extraordinaires', 'overview', 'M', 'David', 'Miranda', 2014, '62.50', 'dsdasdsadasd', 'edition', 15, 1, NULL, NULL, 0),
(40, 'Nouvelles histoires extraordinaires', 'overview', 'M', 'David', 'Miranda', 2014, '22.50', 'dsdasdsadasd', 'edition', 15, 1, NULL, NULL, 0),
(41, 'La pureté dangereuse', 'overview', 'M', 'David', 'Miranda', 2014, '24.00', 'dsdasdsadasd', 'edition', 15, 1, NULL, NULL, 0),
(42, 'Zazie dans le métro', 'overview', 'M', 'David', 'Miranda', 2014, '51.50', 'dsdasdsadasd', 'edition', 15, 1, NULL, NULL, 0),
(43, 'La visite de la vieille dame', 'overview', 'M', 'David', 'Miranda', 2014, '86.00', 'dsdasdsadasd', 'edition', 15, 1, NULL, NULL, 0),
(44, 'Le Colonel Chabert', 'overview', 'M', 'David', 'Miranda', 2014, '74.50', 'dsdasdsadasd', 'edition', 15, 1, NULL, NULL, 0),
(45, 'Phèdre', 'overview', 'M', 'David', 'Miranda', 2014, '13.00', 'dsdasdsadasd', 'edition', 15, 1, NULL, NULL, 0),
(46, 'Boustann', 'Un conte pour adultes qui nous confronte à des valeurs dont nous avons oublié l''importance.', 'F', 'Yamnahakki', 'Adeline', 2015, '999.35', '1486637678.jpg', 'Ligue pour la lecture de la Bible', 2, 3, '2017-02-09 11:54:38', NULL, 0),
(47, 'Boustann', 'Un conte pour adultes qui nous confronte bla bla.', 'F', 'Yamnahakki', 'Adeline', 2015, '999.35', '1486638491.jpeg', 'Ligue pour la lecture de la Bible', 3, 3, '2017-02-09 12:08:11', NULL, 0),
(48, 'Boustann', 'Un conte pour adultes qui nous confronte à des valeurs dont nous...', 'F', 'Yamnahakki', 'Adeline', 2015, '999.35', '1486638672.jpeg', 'Ligue pour la lecture de la Bible', 3, 3, '2017-02-09 12:11:12', NULL, 0),
(49, 'Test', 'blab blalb l albjalbla llrg', 'M', 'Moi', 'Lui', 2017, '1.00', '1486650844.jpeg', 'erttt', 5, 3, '2017-02-09 15:34:04', '2017-02-09 18:48:12', 1),
(50, 'Test', 'blab blalb l albjalbla llrg', 'M', 'Moi', 'Lui', 2017, '1.00', '1486651390.jpeg', 'erttt', 5, 3, '2017-02-09 15:43:10', NULL, 0),
(51, 'rtruiui', 'kfk tzu tzu etzu etu ', 'M', 'srzsrtzsrtz', 'srtzsrtzsrztsz', 5014, '23.30', '', 'xrtsrdt', 98, 7, '2017-02-09 17:15:17', NULL, 0),
(52, 'tewst54', 'tres tres tres tres tres tres tres tres tres tres tres tres bien!', 'M', 'Remoi', 'Komavan', 2011, '89.30', '', 'ztr54', 65, 5, '2017-02-09 18:42:50', NULL, 0);

CREATE TABLE IF NOT EXISTS `t_comment` (
  `id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `user` int(11) NOT NULL,
  `status` int(1) NOT NULL COMMENT '0=à valider, 1=validé',
  `FK_book` int(11) NOT NULL,
  `creation_date` datetime DEFAULT NULL COMMENT 'INSERT datetime',
  `validation_date` datetime DEFAULT NULL COMMENT 'VALIDATION datetime',
  `deleted` int(1) NOT NULL DEFAULT '0' COMMENT '0=visible / 1=invisible'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

TRUNCATE TABLE `t_comment`;
INSERT INTO `t_comment` (`id`, `comment`, `user`, `status`, `FK_book`, `creation_date`, `validation_date`, `deleted`) VALUES
(1, 'Ils sont fous ces physiciens!', 13, 0, 1, '2017-02-09 18:01:43', NULL, 0);

CREATE TABLE IF NOT EXISTS `t_genre` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `creation_date` datetime DEFAULT NULL COMMENT 'INSERT datetime',
  `deleted` int(1) NOT NULL DEFAULT '0' COMMENT '0=visible / 1=invisible'
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

TRUNCATE TABLE `t_genre`;
INSERT INTO `t_genre` (`id`, `name`, `creation_date`, `deleted`) VALUES
(1, 'Dictionnaire', NULL, 0),
(2, 'Magazine', NULL, 0),
(3, 'Roman & Fictions', NULL, 0),
(4, 'Bande Dessinée & Mangas', NULL, 0),
(5, 'Manuel scolaire', NULL, 0),
(6, 'Essai', NULL, 0),
(7, 'Polar', NULL, 0),
(8, 'Autre', NULL, 0),
(9, 'Religions, spiritualité', NULL, 0),
(10, 'Humour', NULL, 0),
(11, 'Fantastique', NULL, 0),
(12, 'Théâtre', NULL, 0),
(13, 'Nouvelle', NULL, 0),
(14, 'Horreur', NULL, 0),
(15, 'Science-fiction', NULL, 0),
(16, 'Poésie', NULL, 0),
(17, 'dont vous êtes le héro', NULL, 0),
(18, 'Extraits', NULL, 0),
(19, 'Recueil de planches', NULL, 0),
(20, 'Atlas', NULL, 0),
(21, 'Brochure', NULL, 0),
(22, 'Documents & Sciences', NULL, 0),
(23, 'Mode d''emploi', NULL, 0),
(24, 'Cuisine', NULL, 0),
(25, 'Polycopié', NULL, 0),
(26, 'Manuel', NULL, 0),
(27, 'Revue', NULL, 0),
(28, 'Abécédaire', NULL, 0),
(29, 'Biographie', NULL, 0),
(30, 'Annuaire', NULL, 0),
(31, 'Esotérisme', NULL, 0),
(32, 'Lexique', NULL, 0),
(33, 'Loisirs', NULL, 0),
(34, 'Sport', NULL, 0);

CREATE TABLE IF NOT EXISTS `t_order` (
  `id` int(11) NOT NULL,
  `order_date` datetime DEFAULT NULL COMMENT 'INSERT datetime',
  `user` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `total_price` decimal(11,2) NOT NULL COMMENT 'en CHF',
  `deleted` int(1) NOT NULL DEFAULT '0' COMMENT '0=visible / 1=invisible',
  `bookqnt` varchar(512) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

TRUNCATE TABLE `t_order`;
INSERT INTO `t_order` (`id`, `order_date`, `user`, `status`, `total_price`, `deleted`, `bookqnt`) VALUES
(1, '2017-02-09 18:03:28', 13, 0, '146.00', 0, 'a:1:{i:0;a:2:{s:2:"id";s:1:"2";s:6:"amount";i:2;}}'),
(2, '2017-02-09 18:24:12', 13, 0, '107.00', 0, 'a:2:{i:0;a:2:{s:2:"id";s:2:"25";s:6:"amount";i:1;}i:1;a:2:{s:2:"id";s:2:"26";s:6:"amount";i:1;}}'),
(3, '2017-02-09 18:39:45', 13, 0, '1.00', 0, 'a:2:{i:0;a:2:{s:2:"id";s:1:"2";s:6:"amount";i:2;}i:1;a:2:{s:2:"id";s:2:"46";s:6:"amount";i:1;}}');


ALTER TABLE `t_book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_genre` (`FK_genre`);

ALTER TABLE `t_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_book` (`FK_book`);

ALTER TABLE `t_genre`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `t_order`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `t_book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=53;
ALTER TABLE `t_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
ALTER TABLE `t_genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=35;
ALTER TABLE `t_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;

ALTER TABLE `t_book`
  ADD CONSTRAINT `t_book_ibfk_1` FOREIGN KEY (`FK_genre`) REFERENCES `t_genre` (`id`);

ALTER TABLE `t_comment`
  ADD CONSTRAINT `t_comment_ibfk_1` FOREIGN KEY (`FK_book`) REFERENCES `t_book` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
