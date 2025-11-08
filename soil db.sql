CREATE DATABASE IF NOT EXISTS `logo`;
USE `logo`;
DROP TABLE IF EXISTS `crop`;
CREATE TABLE `crop` (
  `id` int(11) DEFAULT NULL,
  `crop` varchar(100) DEFAULT NULL,
  `Yield` varchar(100) DEFAULT NULL,
  `price` varchar(100) DEFAULT NULL,
  `priceh` varchar(100) DEFAULT NULL,
  `description` varchar(10000) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1;
insert into `crop`(
    `id`,
    `crop`,
    `Yield`,
    `price`,
    `priceh`,
    `description`
  )
values (
    1,
    'Tomato',
    '60000',
    '7.1',
    '426000',
    'The tomato is the edible berry of the plant Solanum lycopersicum, commonly known as a tomato plant.'
  ),
(
    1,
    'Onion',
    '40000',
    '11',
    '440000',
    'The onion (Allium cepa L., from Latin cepa \"onion\"), also known as the bulb onion or common onion'
  ),
(
    1,
    'Garlic',
    '9800',
    '10',
    '98000',
    'Garlic (Allium sativum) is a species in the onion genus, Allium.Its close relatives include the onion, shallot, leek,'
  ),
(
    2,
    'Orange',
    '40000',
    '10',
    '400000',
    'The orange is the fruit of various citrus species in the family Rutaceae (see list of plants known as orange); '
  ),
(
    2,
    'Peas',
    '10000',
    '2505',
    '255000',
    'A pea is a most commonly green, occasionally golden yellow, or infrequently purple pod-shaped vegetable, widely grown as a cool-season vegetable crop.'
  ),
(
    2,
    'Potato',
    '40000',
    '5',
    '400000',
    'The potato is a root vegetable native to the Americas, a starchy tuber of the plant Solanum tuberosum, and the plant itself is a perennial in the nightshade family,'
  ),
(
    3,
    'Rice',
    '9800',
    '23',
    '225400',
    'Rice, edible starchy cereal grain and the plant by which it is produced. Roughly one-half of the world population,'
  ),
(
    3,
    'Sugarcane',
    '60000',
    '2.55',
    '153000',
    'Sugarcane or sugar cane refers to several species and hybrids of tall perennial grass in the genus Saccharum, tribe Andropogoneae, that are used for sugar production.'
  ),
(
    3,
    'Apple',
    '40000',
    '10',
    '98000',
    'An apple is an edible fruit produced by an apple tree (Malus domestica).Apple trees are cultivated worldwide and are the most widely grown species in the genus Malus.'
  ),
(
    4,
    'Ladyfinger',
    '60000',
    '8',
    '427000',
    'Ladyfinger Ladyfingers are low density, dry, egg-based, sweet Boudoir Biscuits roughly shaped like a large finger.'
  ),
(
    4,
    'Mango',
    '9900',
    '10',
    '99000',
    'Mangoes are used to make murabba (fruit preserves), muramba (a sweet, grated mango delicacy), amchur (dried and powdered unripe mango), '
  );
DROP TABLE IF EXISTS `images`;
CREATE TABLE `images` (
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1;
insert into `images`(`name`, `description`)
values ('pepsi', 'cool drink'),
('maa tv', 'chaneel for serial'),
('kfc', 'special for fried chicken'),
('hero', 'special for bike'),
('jaguar', 'one of the luxorious sedan car'),
('eiffel', 'one of the great place');
DROP TABLE IF EXISTS `register`;
CREATE TABLE `register` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = latin1;
insert into `register`(
    `id`,
    `username`,
    `password`,
    `email`,
    `mobile`,
    `address`
  )
values (
    1,
    'chotu',
    '123',
    'chotu.1000projects@gmail.com',
    '8297260782',
    'hyd'
  );
DROP TABLE IF EXISTS `soilcrop`;
CREATE TABLE `soilcrop` (
  `soiltype` varchar(100) DEFAULT NULL,
  `N` int(20) DEFAULT NULL,
  `P` int(20) DEFAULT NULL,
  `k` int(20) DEFAULT NULL,
  `PH` float DEFAULT NULL,
  `Temp` int(20) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1;
insert into `soilcrop`(`soiltype`, `N`, `P`, `k`, `PH`, `Temp`)
values ('Alluvial', 142, 24, 105, 7, 15),
('Black', 155, 60, 132, 6.9, 23),
('Clay', 135, 16, 110, 6.7, 24),
('Red', 125, 20, 105, 6.3, 22);
DROP TABLE IF EXISTS `upload`;
CREATE TABLE `upload` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = latin1;
insert into `upload`(`id`, `name`, `image`, `username`)
values (1, 'pepsi', 'pepsi.png', 'chotu'),
(2, 'red', 'red.jpg', 'chotu');