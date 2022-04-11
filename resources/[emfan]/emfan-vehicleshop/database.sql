CREATE TABLE IF NOT EXISTS `emfan_vehicleshop` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`plate`varchar(55) UNIQUE DEFAULT NULL,
`vehicle` varchar(55) DEFAULT NULL,
`model` varchar(55) DEFAULT NULL;
`mods` text DEFAULT NULL,
`price` int(11) NOT NULL DEFAULT 0,
`discount` int(11) NOT NULL DEFAULT 100,
`coords` TEXT UNIQUE DEFAULT NULL,
`displayposition` int(11) DEFAULT NULL,
`testdrive` int(11) NOT NULL DEFAULT 0,
`reserved` int(11) NOT NULL DEFAULT 0,
`buyerid` varchar(55) DEFAULT NULL,
`buyername` varchar(55) DEFAULT NULL,
`buyerlastname` varchar(55) DEFAULT NULL,
`buyerphonenr` int(11) DEFAULT NULL,
PRIMARY KEY (`id`) 
)ENGINE=InnoDB AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS `emfan_vehicle_orders` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`plate`varchar(55) UNIQUE DEFAULT NULL,
`model` varchar(55) DEFAULT NULL,
`hash` varchar(55) DEFAULT NULL,
`price` int(11) NOT NULL DEFAULT 0,
`sellerid` varchar(55) DEFAULT NULL,
`pickupid` varchar(55) NOT NULL DEFAULT 0,
`ispickedup` tinyint(1) DEFAULT 0,
`buyerid` varchar(55) DEFAULT NULL,
`buyername` varchar(55) DEFAULT NULL,
`buyerlastname` varchar(55) DEFAULT NULL,
`buyerphonenr` int(11) DEFAULT NULL,
`date` DATETIME DEFAULT CURRENT_TIMESTAMP,

PRIMARY KEY (`id`) 
)ENGINE=InnoDB AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS `emfan_finance` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`buyerid` varchar(55) DEFAULT NULL,
`plate` varchar(55) DEFAULT NULL,
`loan` int(11) DEFAULT NULL,
`weekplan` tinyint(8) DEFAULT NULL,
`date` DATETIME DEFAULT CURRENT_TIMESTAMP,

PRIMARY KEY (`id`)
)ENGINE=InnoDB AUTO_INCREMENT = 1;

