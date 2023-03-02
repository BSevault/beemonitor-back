USE `beemonitor`;

-- #
-- # TABLE STRUCTURE FOR: personEntity
-- #

-- DROP TABLE IF EXISTS `personEntity`;

-- CREATE TABLE `personEntity` (
--   `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
--   `first_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
--   `last_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
--   `email` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
--   `pwd` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
--   `phone` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
--   `adress` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
--   `is_admin` tinyint(4) DEFAULT NULL,
--   `is_active` tinyint(4) DEFAULT NULL,
--   PRIMARY KEY (`id`),
--   UNIQUE KEY `email_UNIQUE` (`email`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `personEntity` (`id`, `first_name`, `last_name`, `email`, `pwd`, `phone`, `adress`, `is_admin`, `is_active`) VALUES (1, 'Bernier', 'Austin', 'zkohler@example.org', 'test', '1-010-967-1977x214', '707 Walsh Circle\nNorth Itzel, MI 84887-7702', 1, 1);
INSERT INTO `personEntity` (`id`, `first_name`, `last_name`, `email`, `pwd`, `phone`, `adress`, `is_admin`, `is_active`) VALUES (2, 'Von', 'Alberta', 'zstiedemann@example.net', 'test', '(130)634-3721', '68399 Streich Wells Apt. 249\nNorth Marjolaine, WY 25649-8087', 1, 1);
INSERT INTO `personEntity` (`id`, `first_name`, `last_name`, `email`, `pwd`, `phone`, `adress`, `is_admin`, `is_active`) VALUES (3, 'Welch', 'Brannon', 'stehr.idell@example.com', 'test', '434.556.2967x472', '074 Hyatt Loop Suite 106\nHellerbury, WI 47669', 1, 1);
INSERT INTO `personEntity` (`id`, `first_name`, `last_name`, `email`, `pwd`, `phone`, `adress`, `is_admin`, `is_active`) VALUES (4, 'McLaughlin', 'Krista', 'torphy.pete@example.net', 'test', '306.402.8551x0014', '61625 Harmony Shores Apt. 789\nNorth Simeonstad, CT 83818-8942', 1, 1);
INSERT INTO `personEntity` (`id`, `first_name`, `last_name`, `email`, `pwd`, `phone`, `adress`, `is_admin`, `is_active`) VALUES (5, 'Borer', 'Asha', 'hand.luis@example.com', 'test', '+68(9)7949538146', '8710 Hane Bypass\nRozellaport, CO 13247-2783', 1, 1);
INSERT INTO `personEntity` (`id`, `first_name`, `last_name`, `email`, `pwd`, `phone`, `adress`, `is_admin`, `is_active`) VALUES (6, 'Russel', 'Wilton', 'evelyn44@example.net', 'test', '(516)382-6850x11330', '8662 Maureen Lock\nSouth Nyasiashire, MN 20362-1925', 0, 1);
INSERT INTO `personEntity` (`id`, `first_name`, `last_name`, `email`, `pwd`, `phone`, `adress`, `is_admin`, `is_active`) VALUES (7, 'Stiedemann', 'Marian', 'jordan53@example.org', 'test', '096.370.3345x2953', '217 Leopold Lane Suite 217\nNorth Emiliafort, ME 65387-8750', 1, 1);
INSERT INTO `personEntity` (`id`, `first_name`, `last_name`, `email`, `pwd`, `phone`, `adress`, `is_admin`, `is_active`) VALUES (8, 'Harvey', 'Herta', 'ifranecki@example.org', 'test', '891.122.6914', '8966 Rohan Mountains Suite 619\nBatzport, AZ 87072-8969', 1, 1);
INSERT INTO `personEntity` (`id`, `first_name`, `last_name`, `email`, `pwd`, `phone`, `adress`, `is_admin`, `is_active`) VALUES (9, 'Hagenes', 'Dessie', 'clint.mayert@example.net', 'test', '09540570165', '3472 Jarod Motorway Suite 580\nNew Victoria, WV 65068-4959', 1, 1);
INSERT INTO `personEntity` (`id`, `first_name`, `last_name`, `email`, `pwd`, `phone`, `adress`, `is_admin`, `is_active`) VALUES (10, 'Waelchi', 'Shemar', 'wisozk.stacey@example.net', 'test', '1-157-345-2456', '43160 Labadie Throughway Suite 125\nWebermouth, ME 02362', 0, 1);

-- #
-- # TABLE STRUCTURE FOR: apiary
-- #

-- DROP TABLE IF EXISTS `apiary`;

-- CREATE TABLE `apiary` (
--   `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
--   `name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
--   `latitude` decimal(6,4) NOT NULL,
--   `longitude` decimal(7,4) NOT NULL,
--   `creation_date` date NOT NULL,
--   `end_date` date DEFAULT NULL,
--   `comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
--   `is_active` tinyint(4) DEFAULT NULL,
--   `person_id` int(10) unsigned NOT NULL,
--   PRIMARY KEY (`id`),
--   KEY `fk_apiary_person1_idx` (`person_id`),
--   CONSTRAINT `fk_apiary_person1` FOREIGN KEY (`person_id`) REFERENCES `personEntity` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
-- ) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `apiary` (`id`, `name`, `latitude`, `longitude`, `creation_date`, `end_date`, `comment`, `is_active`, `person_id`) VALUES (1, 'perspiciatis', '1.2853', '-40.5184', '1979-01-15', '1985-05-09', 'Ipsum aut quidem ut rem est itaque sunt. Cum quia magnam dolorem rerum quia eius expedita. Dolores voluptatem dolorum cum minima aut voluptatem voluptate. Quibusdam quae vel sint labore. Eius dolore nulla dolores et reiciendis mollitia debitis.', 1, 1);
INSERT INTO `apiary` (`id`, `name`, `latitude`, `longitude`, `creation_date`, `end_date`, `comment`, `is_active`, `person_id`) VALUES (2, 'voluptas', '24.7829', '24.1902', '1988-06-07', '1970-05-23', 'Reprehenderit facere et molestiae labore consectetur rem ratione. Aut ea sit non dolores odio consequatur. Voluptas aspernatur iusto delectus adipisci. Culpa id ut molestiae.', 1, 2);
INSERT INTO `apiary` (`id`, `name`, `latitude`, `longitude`, `creation_date`, `end_date`, `comment`, `is_active`, `person_id`) VALUES (3, 'consequatur', '51.3260', '-48.8732', '1996-08-26', '2015-01-18', 'Nihil maiores non autem ipsum velit sint. Qui rerum dolorem necessitatibus quis non ullam aliquam. Natus itaque est consequuntur molestias laboriosam expedita eius quia. Nisi eos est harum cumque vel.', 1, 3);
INSERT INTO `apiary` (`id`, `name`, `latitude`, `longitude`, `creation_date`, `end_date`, `comment`, `is_active`, `person_id`) VALUES (4, 'ea', '12.8733', '-171.3137', '2003-03-24', '2006-12-02', 'Delectus odio iure quisquam magnam vel. Commodi impedit ut voluptas non debitis esse quidem omnis. Ab voluptas eveniet qui corporis sed. Et delectus ut eum repudiandae nihil et. Sed dolore laborum amet mollitia.', 1, 4);
INSERT INTO `apiary` (`id`, `name`, `latitude`, `longitude`, `creation_date`, `end_date`, `comment`, `is_active`, `person_id`) VALUES (5, 'qui', '75.1343', '4.7203', '1997-09-13', '1991-06-04', 'Deserunt modi voluptatem numquam ut optio repudiandae. Quis in velit odit ratione eaque. Voluptatem quasi optio eos est consequuntur aperiam ipsa.', 1, 5);
INSERT INTO `apiary` (`id`, `name`, `latitude`, `longitude`, `creation_date`, `end_date`, `comment`, `is_active`, `person_id`) VALUES (6, 'ea', '-0.6911', '49.7359', '1991-01-11', '2015-02-13', 'Est ea est qui provident consequuntur. Ut accusantium et eligendi consequuntur. Autem laudantium eveniet quia suscipit. Doloribus deleniti repudiandae perspiciatis maiores et mollitia doloribus.', 1, 6);
INSERT INTO `apiary` (`id`, `name`, `latitude`, `longitude`, `creation_date`, `end_date`, `comment`, `is_active`, `person_id`) VALUES (7, 'molestiae', '41.5173', '101.1315', '1972-12-14', '2001-05-13', 'Dolore et consequatur officiis excepturi corrupti similique nihil. Fugiat praesentium ullam veritatis voluptatem aperiam amet.', 1, 7);
INSERT INTO `apiary` (`id`, `name`, `latitude`, `longitude`, `creation_date`, `end_date`, `comment`, `is_active`, `person_id`) VALUES (8, 'et', '-63.0317', '157.1033', '2013-11-28', '2004-03-23', 'Suscipit ut consequuntur voluptates. Enim temporibus et atque modi. Odio atque labore consequuntur voluptatem architecto quam. Ex nostrum architecto quod ea non. Architecto enim aspernatur voluptas.', 1, 8);
INSERT INTO `apiary` (`id`, `name`, `latitude`, `longitude`, `creation_date`, `end_date`, `comment`, `is_active`, `person_id`) VALUES (9, 'odit', '12.2265', '-25.9662', '1994-10-30', '1984-07-24', 'Et fugit eveniet deleniti soluta velit architecto pariatur. Rerum autem quae recusandae facilis voluptate soluta harum. Amet sequi quibusdam cumque quia officiis et. Rerum voluptate deserunt qui quas repellat.', 1, 9);
INSERT INTO `apiary` (`id`, `name`, `latitude`, `longitude`, `creation_date`, `end_date`, `comment`, `is_active`, `person_id`) VALUES (10, 'laboriosam', '-72.0697', '164.0647', '1977-06-15', '1989-10-02', 'Cupiditate nam ut omnis tenetur ipsam cupiditate optio. Tenetur fuga suscipit molestiae animi aut adipisci assumenda omnis. Possimus voluptates qui in dicta debitis laborum. Qui ut qui corrupti deleniti rerum. Quis est tempora error consectetur commodi officia.', 1, 10);
INSERT INTO `apiary` (`id`, `name`, `latitude`, `longitude`, `creation_date`, `end_date`, `comment`, `is_active`, `person_id`) VALUES (11, 'a', '69.5235', '128.4745', '2011-09-09', '1991-07-11', 'Est deleniti aliquam voluptas eius ipsum sequi. Aut beatae delectus iste earum dicta vel. Nemo id voluptatem impedit est sunt possimus consequatur. Incidunt voluptatum est sapiente distinctio.', 1, 1);
INSERT INTO `apiary` (`id`, `name`, `latitude`, `longitude`, `creation_date`, `end_date`, `comment`, `is_active`, `person_id`) VALUES (12, 'assumenda', '-20.7368', '-149.7217', '1994-12-11', '2021-01-19', 'Voluptas esse et ut dolores vitae eligendi omnis maiores. Consequuntur iure expedita est id et recusandae. Amet neque occaecati officia.', 1, 2);
INSERT INTO `apiary` (`id`, `name`, `latitude`, `longitude`, `creation_date`, `end_date`, `comment`, `is_active`, `person_id`) VALUES (13, 'dignissimos', '-54.9594', '7.2993', '1973-04-17', '1977-02-06', 'Omnis voluptas laudantium repellendus sed ipsa sed dolores. Et dignissimos soluta qui ut tenetur molestiae.', 1, 3);
INSERT INTO `apiary` (`id`, `name`, `latitude`, `longitude`, `creation_date`, `end_date`, `comment`, `is_active`, `person_id`) VALUES (14, 'maxime', '54.5828', '-49.4461', '2005-08-26', '1995-01-31', 'Libero deleniti autem aliquam ut ullam ut blanditiis. Ipsum enim sed quia sit maiores incidunt. Atque praesentium nam veritatis non temporibus et id rerum. Aut doloribus facilis ex quasi.', 1, 4);
INSERT INTO `apiary` (`id`, `name`, `latitude`, `longitude`, `creation_date`, `end_date`, `comment`, `is_active`, `person_id`) VALUES (15, 'reprehenderit', '33.9232', '134.1781', '1999-07-31', '1997-01-25', 'Error iusto aut saepe quam et error nihil. Est officia hic veniam ut autem dignissimos. Sequi molestias et nisi sapiente et ipsa. Repellat aut qui dolorem impedit hic est. At hic nostrum doloremque accusamus pariatur velit.', 1, 5);
INSERT INTO `apiary` (`id`, `name`, `latitude`, `longitude`, `creation_date`, `end_date`, `comment`, `is_active`, `person_id`) VALUES (16, 'est', '-0.9959', '-94.1518', '1987-10-31', '2001-08-28', 'At sequi blanditiis deleniti saepe alias enim nam. Vero ratione voluptas similique velit. Libero officia consequatur necessitatibus aspernatur.', 1, 6);
INSERT INTO `apiary` (`id`, `name`, `latitude`, `longitude`, `creation_date`, `end_date`, `comment`, `is_active`, `person_id`) VALUES (17, 'nisi', '16.0017', '10.3507', '2018-07-10', '1985-08-02', 'Qui dolores porro et impedit soluta tempora quod. Reiciendis mollitia totam saepe sint aut repellendus et. Magnam dolorem quis sunt consequuntur voluptatum consequuntur.', 1, 7);
INSERT INTO `apiary` (`id`, `name`, `latitude`, `longitude`, `creation_date`, `end_date`, `comment`, `is_active`, `person_id`) VALUES (18, 'commodi', '-13.9796', '55.9541', '2022-08-02', '2013-10-04', 'Pariatur ipsam sed nemo sunt iure. Molestiae dolorem tempora velit est qui eveniet qui. Ut sit necessitatibus quia.', 1, 8);
INSERT INTO `apiary` (`id`, `name`, `latitude`, `longitude`, `creation_date`, `end_date`, `comment`, `is_active`, `person_id`) VALUES (19, 'explicabo', '56.1562', '-19.3161', '2005-07-05', '1974-11-11', 'Recusandae iure assumenda ducimus et unde quia non in. Voluptatibus ad velit minima. Et dolorem aliquid at qui. Perferendis voluptatem eaque officiis fugiat ducimus.', 1, 9);
INSERT INTO `apiary` (`id`, `name`, `latitude`, `longitude`, `creation_date`, `end_date`, `comment`, `is_active`, `person_id`) VALUES (20, 'autem', '39.3384', '-134.2381', '2006-10-08', '1971-08-22', 'Dolorem vitae ipsum itaque sed eos ut. Maiores ab ab voluptatem qui repudiandae. Modi est reiciendis dolores consectetur ipsum unde esse. Sed vel nemo dolore dolorum.', 1, 10);
INSERT INTO `apiary` (`id`, `name`, `latitude`, `longitude`, `creation_date`, `end_date`, `comment`, `is_active`, `person_id`) VALUES (21, 'non', '79.0014', '42.8720', '1977-10-16', '1987-03-21', 'Consequatur quia eveniet et maxime dolores. Omnis ex qui laborum quaerat ut consequuntur. Consequatur doloremque est aut ipsa vel ab. Facilis eligendi odio omnis quod rerum aut enim quae. Fuga ex nemo animi.', 1, 1);
INSERT INTO `apiary` (`id`, `name`, `latitude`, `longitude`, `creation_date`, `end_date`, `comment`, `is_active`, `person_id`) VALUES (22, 'earum', '-38.4237', '-9.0576', '2008-08-28', '2018-08-20', 'Voluptatem deserunt numquam dolorum consequuntur. Sequi qui at quaerat consequatur iste qui. Veniam id rerum amet repellendus. Quo vel rerum assumenda architecto.', 1, 2);
INSERT INTO `apiary` (`id`, `name`, `latitude`, `longitude`, `creation_date`, `end_date`, `comment`, `is_active`, `person_id`) VALUES (23, 'nemo', '-86.5088', '109.7939', '2019-03-23', '2011-02-23', 'Qui iste et aut maxime. Pariatur minima iure illo magnam est. Quidem voluptas non quia sed nostrum inventore earum ut. Quia et nemo quia dolor aut et.', 1, 3);
INSERT INTO `apiary` (`id`, `name`, `latitude`, `longitude`, `creation_date`, `end_date`, `comment`, `is_active`, `person_id`) VALUES (24, 'magni', '-20.2113', '57.7917', '2007-01-02', '1993-01-06', 'Alias id dolore fugiat laboriosam laudantium consequatur. Cupiditate aperiam quos vitae. Non error nemo debitis tempora ex voluptatibus commodi ut. Iste incidunt sed sint quod nihil necessitatibus.', 1, 4);
INSERT INTO `apiary` (`id`, `name`, `latitude`, `longitude`, `creation_date`, `end_date`, `comment`, `is_active`, `person_id`) VALUES (25, 'sequi', '-14.1679', '-160.5431', '1993-02-04', '1975-12-08', 'Nihil dolor laudantium quaerat velit repellendus ea aperiam magnam. Animi omnis consectetur suscipit ratione.', 1, 5);

-- #
-- # TABLE STRUCTURE FOR: hive
-- #

-- DROP TABLE IF EXISTS `hive`;

-- CREATE TABLE `hive` (
--   `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
--   `name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
--   `latitude` decimal(8,6) NOT NULL,
--   `longitude` decimal(9,6) NOT NULL,
--   `altitude_in_m` int(11) NOT NULL,
--   `orientation` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
--   `type` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
--   `bee_type` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
--   `initial_weight_in_g` int(11) NOT NULL,
--   `purchase_date` date NOT NULL,
--   `super_count` int(11) DEFAULT NULL,
--   `comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
--   `is_active` tinyint(4) DEFAULT NULL,
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `hive` (`id`, `name`, `latitude`, `longitude`, `altitude_in_m`, `orientation`, `type`, `bee_type`, `initial_weight_in_g`, `purchase_date`, `super_count`, `comment`, `is_active`, `apiary_id`) VALUES (1, 'neque', '-63.006434', '88.903945', 2586, 'N', 'Dadant', 'Dadant', 27643, '1987-08-19', 17, '', 1, 5);
INSERT INTO `hive` (`id`, `name`, `latitude`, `longitude`, `altitude_in_m`, `orientation`, `type`, `bee_type`, `initial_weight_in_g`, `purchase_date`, `super_count`, `comment`, `is_active`, `apiary_id`) VALUES (2, 'ipsa', '55.967200', '-113.679737', 2442, 'SO', 'Dadant', 'Dadant', 6792, '2007-10-27', 2, '', 1, 1);
INSERT INTO `hive` (`id`, `name`, `latitude`, `longitude`, `altitude_in_m`, `orientation`, `type`, `bee_type`, `initial_weight_in_g`, `purchase_date`, `super_count`, `comment`, `is_active`, `apiary_id`) VALUES (3, 'laboriosam', '69.495036', '-106.642538', 1682, 'SO', 'Dadant', 'Dadant', 1771, '1995-12-10', 6, 'Facilis et expedita sint quia mollitia esse. Ut qui voluptas modi enim qui voluptatem. Mollitia corporis aut quos sunt neque qui at beatae.', 1, 1);
INSERT INTO `hive` (`id`, `name`, `latitude`, `longitude`, `altitude_in_m`, `orientation`, `type`, `bee_type`, `initial_weight_in_g`, `purchase_date`, `super_count`, `comment`, `is_active`, `apiary_id`) VALUES (4, 'voluptatem', '73.648702', '-145.988279', 1206, 'N', 'Dadant', 'Dadant', 98324, '1984-01-15', 3, '', 1, 22);
INSERT INTO `hive` (`id`, `name`, `latitude`, `longitude`, `altitude_in_m`, `orientation`, `type`, `bee_type`, `initial_weight_in_g`, `purchase_date`, `super_count`, `comment`, `is_active`, `apiary_id`) VALUES (5, 'assumenda', '33.369445', '127.240367', 2544, 'NE', 'Dadant', 'Dadant', 69804, '1995-03-30', 4, '', 1, 10);
INSERT INTO `hive` (`id`, `name`, `latitude`, `longitude`, `altitude_in_m`, `orientation`, `type`, `bee_type`, `initial_weight_in_g`, `purchase_date`, `super_count`, `comment`, `is_active`, `apiary_id`) VALUES (6, 'velit', '-36.799833', '90.062195', 2794, 'O', 'Dadant', 'Dadant', 29947, '2019-04-11', 10, 'Tempore rem enim dicta et ea consectetur. Aut molestiae itaque ipsam et neque rerum pariatur. Cum qui quibusdam ut hic distinctio ab qui ducimus.', 1, 18);
INSERT INTO `hive` (`id`, `name`, `latitude`, `longitude`, `altitude_in_m`, `orientation`, `type`, `bee_type`, `initial_weight_in_g`, `purchase_date`, `super_count`, `comment`, `is_active`, `apiary_id`) VALUES (7, 'sit', '26.227073', '-134.886973', 1317, 'O', 'Dadant', 'Dadant', 33881, '1990-03-15', 11, '', 1, 3);
INSERT INTO `hive` (`id`, `name`, `latitude`, `longitude`, `altitude_in_m`, `orientation`, `type`, `bee_type`, `initial_weight_in_g`, `purchase_date`, `super_count`, `comment`, `is_active`, `apiary_id`) VALUES (8, 'porro', '-2.770006', '-133.470239', 2405, 'O', 'Dadant', 'Dadant', 40420, '1983-09-18', 11, '', 1, 18);
INSERT INTO `hive` (`id`, `name`, `latitude`, `longitude`, `altitude_in_m`, `orientation`, `type`, `bee_type`, `initial_weight_in_g`, `purchase_date`, `super_count`, `comment`, `is_active`, `apiary_id`) VALUES (9, 'ut', '65.895656', '-13.215423', 753, 'NE', 'Dadant', 'Dadant', 45938, '2013-07-05', 16, '', 1, 16);
INSERT INTO `hive` (`id`, `name`, `latitude`, `longitude`, `altitude_in_m`, `orientation`, `type`, `bee_type`, `initial_weight_in_g`, `purchase_date`, `super_count`, `comment`, `is_active`, `apiary_id`) VALUES (10, 'molestiae', '29.721687', '57.890548', 1242, 'NO', 'Dadant', 'Dadant', 62973, '2011-08-13', 9, 'Eaque error animi unde vitae est. Voluptas nam eius quibusdam ipsum. Tenetur atque quasi nesciunt sint ipsa voluptatem tenetur.', 1, 1);
INSERT INTO `hive` (`id`, `name`, `latitude`, `longitude`, `altitude_in_m`, `orientation`, `type`, `bee_type`, `initial_weight_in_g`, `purchase_date`, `super_count`, `comment`, `is_active`, `apiary_id`) VALUES (11, 'sed', '21.540632', '37.809803', 303, 'NE', 'Dadant', 'Dadant', 66357, '2012-11-29', 3, 'Sunt voluptatem exercitationem est molestiae numquam. Necessitatibus accusantium quasi asperiores dolor sit recusandae atque. Facilis quis non provident aut magni. Omnis officia nisi possimus soluta iste nulla velit.', 1, 8);
INSERT INTO `hive` (`id`, `name`, `latitude`, `longitude`, `altitude_in_m`, `orientation`, `type`, `bee_type`, `initial_weight_in_g`, `purchase_date`, `super_count`, `comment`, `is_active`, `apiary_id`) VALUES (12, 'qui', '-9.242055', '134.073576', 928, 'N', 'Dadant', 'Dadant', 84951, '1970-02-16', 16, 'Facilis incidunt omnis est corrupti occaecati. Dignissimos explicabo pariatur laudantium sunt voluptas enim.', 1, 19);
INSERT INTO `hive` (`id`, `name`, `latitude`, `longitude`, `altitude_in_m`, `orientation`, `type`, `bee_type`, `initial_weight_in_g`, `purchase_date`, `super_count`, `comment`, `is_active`, `apiary_id`) VALUES (13, 'voluptatem', '-41.338242', '-1.817732', 2254, 'SE', 'Dadant', 'Dadant', 87414, '1981-02-07', 18, 'Labore voluptatem omnis omnis voluptatibus nemo. Quia aperiam labore repellendus repudiandae. Repellat quis nesciunt temporibus voluptatem rerum maiores nostrum. Officiis quia accusantium fugiat doloremque doloremque dolor velit.', 1, 24);
INSERT INTO `hive` (`id`, `name`, `latitude`, `longitude`, `altitude_in_m`, `orientation`, `type`, `bee_type`, `initial_weight_in_g`, `purchase_date`, `super_count`, `comment`, `is_active`, `apiary_id`) VALUES (14, 'exercitationem', '11.265464', '10.024058', 2432, 'N', 'Dadant', 'Dadant', 58015, '2007-10-03', 12, 'Nisi eos quia hic sit excepturi ut. Amet sint sit id enim sed voluptatem. Inventore repudiandae est voluptatum quis voluptatum sit.', 1,10);
INSERT INTO `hive` (`id`, `name`, `latitude`, `longitude`, `altitude_in_m`, `orientation`, `type`, `bee_type`, `initial_weight_in_g`, `purchase_date`, `super_count`, `comment`, `is_active`, `apiary_id`) VALUES (15, 'blanditiis', '36.790380', '-33.163893', 2242, 'SO', 'Dadant', 'Dadant', 17015, '2002-10-28', 0, '', 1, 15);
INSERT INTO `hive` (`id`, `name`, `latitude`, `longitude`, `altitude_in_m`, `orientation`, `type`, `bee_type`, `initial_weight_in_g`, `purchase_date`, `super_count`, `comment`, `is_active`, `apiary_id`) VALUES (16, 'consequatur', '66.876362', '120.922806', 470, 'N', 'Dadant', 'Dadant', 87085, '2003-03-29', 20, '', 1, 7);
INSERT INTO `hive` (`id`, `name`, `latitude`, `longitude`, `altitude_in_m`, `orientation`, `type`, `bee_type`, `initial_weight_in_g`, `purchase_date`, `super_count`, `comment`, `is_active`, `apiary_id`) VALUES (17, 'tempora', '37.288377', '49.462620', 290, 'S', 'Dadant', 'Dadant', 9920, '1977-06-30', 3, 'Explicabo dolor illo aut maiores porro. Qui corrupti culpa molestiae sit quod animi. Mollitia nihil et quidem.', 1, 21);
INSERT INTO `hive` (`id`, `name`, `latitude`, `longitude`, `altitude_in_m`, `orientation`, `type`, `bee_type`, `initial_weight_in_g`, `purchase_date`, `super_count`, `comment`, `is_active`, `apiary_id`) VALUES (18, 'dolorum', '69.104866', '75.711042', 846, 'S', 'Dadant', 'Dadant', 70208, '2000-08-17', 0, 'Nam quis rerum numquam. Praesentium et commodi possimus voluptatem ipsam hic nesciunt. Odio et saepe quaerat qui nostrum voluptas enim. Tenetur dolor harum illum molestiae porro aut.', 1, 8);
INSERT INTO `hive` (`id`, `name`, `latitude`, `longitude`, `altitude_in_m`, `orientation`, `type`, `bee_type`, `initial_weight_in_g`, `purchase_date`, `super_count`, `comment`, `is_active`, `apiary_id`) VALUES (19, 'atque', '-19.947726', '-14.468419', 2022, 'SE', 'Dadant', 'Dadant', 52683, '1978-09-30', 4, 'Deserunt iusto ducimus possimus pariatur excepturi voluptatem. Voluptatem animi ab omnis aut commodi voluptatem. Ut eveniet aut sed. Voluptatibus incidunt illo consequatur maiores veritatis et ipsam. Omnis tempora molestiae odio aut velit esse nihil.', 1, 2);
INSERT INTO `hive` (`id`, `name`, `latitude`, `longitude`, `altitude_in_m`, `orientation`, `type`, `bee_type`, `initial_weight_in_g`, `purchase_date`, `super_count`, `comment`, `is_active`, `apiary_id`) VALUES (20, 'laboriosam', '30.500437', '145.174566', 1029, 'NE', 'Dadant', 'Dadant', 86780, '1992-11-25', 5, '', 1, 25);
INSERT INTO `hive` (`id`, `name`, `latitude`, `longitude`, `altitude_in_m`, `orientation`, `type`, `bee_type`, `initial_weight_in_g`, `purchase_date`, `super_count`, `comment`, `is_active`, `apiary_id`) VALUES (21, 'commodi', '14.032712', '177.435667', 887, 'NO', 'Dadant', 'Dadant', 44454, '1980-06-18', 3, 'Officia id et culpa est nostrum iure pariatur ab. Qui laborum rerum est autem assumenda tempore. Aut provident totam dicta doloribus dignissimos molestiae assumenda. At quia aliquam in sunt ut. Ab asperiores enim quia ex nihil ad ipsum.', 1, 21);
INSERT INTO `hive` (`id`, `name`, `latitude`, `longitude`, `altitude_in_m`, `orientation`, `type`, `bee_type`, `initial_weight_in_g`, `purchase_date`, `super_count`, `comment`, `is_active`, `apiary_id`) VALUES (22, 'adipisci', '0.242658', '-109.488007', 354, 'O', 'Dadant', 'Dadant', 89976, '2022-07-13', 7, '', 1, 19);
INSERT INTO `hive` (`id`, `name`, `latitude`, `longitude`, `altitude_in_m`, `orientation`, `type`, `bee_type`, `initial_weight_in_g`, `purchase_date`, `super_count`, `comment`, `is_active`, `apiary_id`) VALUES (23, 'qui', '-41.249723', '-33.800339', 2860, 'NO', 'Dadant', 'Dadant', 75122, '1996-02-07', 17, 'Quia molestiae quia pariatur aut eligendi. Dolor tempora unde quas officiis voluptatem. Quia quis enim et consequatur atque. Magnam ipsa dolorem doloribus dicta et aut. Aut saepe quaerat enim nesciunt.', 1, 15);
INSERT INTO `hive` (`id`, `name`, `latitude`, `longitude`, `altitude_in_m`, `orientation`, `type`, `bee_type`, `initial_weight_in_g`, `purchase_date`, `super_count`, `comment`, `is_active`, `apiary_id`) VALUES (24, 'explicabo', '-10.924300', '-160.576254', 1706, 'N', 'Dadant', 'Dadant', 41029, '2003-04-23', 8, '', 1, 17);
INSERT INTO `hive` (`id`, `name`, `latitude`, `longitude`, `altitude_in_m`, `orientation`, `type`, `bee_type`, `initial_weight_in_g`, `purchase_date`, `super_count`, `comment`, `is_active`, `apiary_id`) VALUES (25, 'ullam', '51.625429', '78.837104', 174, 'N', 'Dadant', 'Dadant', 54083, '1976-08-15', 18, 'Vero molestiae eos error deserunt sunt soluta reprehenderit. In eius sunt aut sapiente dolore. Quo omnis est tempore repellat vero fugit. Illum at molestias blanditiis et eveniet a.', 1, 25);
INSERT INTO `hive` (`id`, `name`, `latitude`, `longitude`, `altitude_in_m`, `orientation`, `type`, `bee_type`, `initial_weight_in_g`, `purchase_date`, `super_count`, `comment`, `is_active`, `apiary_id`) VALUES (26, 'culpa', '-42.054318', '136.992924', 1710, 'SO', 'Dadant', 'Dadant', 90206, '1982-01-22', 9, '', 1, 12);
INSERT INTO `hive` (`id`, `name`, `latitude`, `longitude`, `altitude_in_m`, `orientation`, `type`, `bee_type`, `initial_weight_in_g`, `purchase_date`, `super_count`, `comment`, `is_active`, `apiary_id`) VALUES (27, 'magnam', '12.058549', '-89.861334', 2804, 'NE', 'Dadant', 'Dadant', 43804, '1989-08-28', 16, '', 1, 24);
INSERT INTO `hive` (`id`, `name`, `latitude`, `longitude`, `altitude_in_m`, `orientation`, `type`, `bee_type`, `initial_weight_in_g`, `purchase_date`, `super_count`, `comment`, `is_active`, `apiary_id`) VALUES (28, 'est', '-69.360799', '-44.089549', 247, 'N', 'Dadant', 'Dadant', 96221, '2001-11-15', 4, 'Eum aliquam quam neque aut. Eaque vel illo vitae molestias vel eaque quas.', 1, 14);
INSERT INTO `hive` (`id`, `name`, `latitude`, `longitude`, `altitude_in_m`, `orientation`, `type`, `bee_type`, `initial_weight_in_g`, `purchase_date`, `super_count`, `comment`, `is_active`, `apiary_id`) VALUES (29, 'magnam', '74.347379', '107.582754', 75, 'N', 'Dadant', 'Dadant', 75552, '1985-12-12', 15, '', 1, 21);
INSERT INTO `hive` (`id`, `name`, `latitude`, `longitude`, `altitude_in_m`, `orientation`, `type`, `bee_type`, `initial_weight_in_g`, `purchase_date`, `super_count`, `comment`, `is_active`, `apiary_id`) VALUES (30, 'voluptate', '56.696176', '-152.850859', 647, 'NE', 'Dadant', 'Dadant', 94460, '1982-05-22', 10, '', 1, 22);
INSERT INTO `hive` (`id`, `name`, `latitude`, `longitude`, `altitude_in_m`, `orientation`, `type`, `bee_type`, `initial_weight_in_g`, `purchase_date`, `super_count`, `comment`, `is_active`, `apiary_id`) VALUES (31, 'nesciunt', '-77.286937', '-23.312830', 429, 'E', 'Dadant', 'Dadant', 61770, '1997-04-06', 20, '', 1, 9);
INSERT INTO `hive` (`id`, `name`, `latitude`, `longitude`, `altitude_in_m`, `orientation`, `type`, `bee_type`, `initial_weight_in_g`, `purchase_date`, `super_count`, `comment`, `is_active`, `apiary_id`) VALUES (32, 'et', '-50.813466', '85.213706', 2682, 'N', 'Dadant', 'Dadant', 6078, '1987-04-02', 2, '', 1, 10);
INSERT INTO `hive` (`id`, `name`, `latitude`, `longitude`, `altitude_in_m`, `orientation`, `type`, `bee_type`, `initial_weight_in_g`, `purchase_date`, `super_count`, `comment`, `is_active`, `apiary_id`) VALUES (33, 'incidunt', '-83.020130', '-38.023160', 742, 'S', 'Dadant', 'Dadant', 54142, '2018-02-19', 11, '', 1, 10);
INSERT INTO `hive` (`id`, `name`, `latitude`, `longitude`, `altitude_in_m`, `orientation`, `type`, `bee_type`, `initial_weight_in_g`, `purchase_date`, `super_count`, `comment`, `is_active`, `apiary_id`) VALUES (34, 'reprehenderit', '16.989504', '173.845223', 209, 'N', 'Dadant', 'Dadant', 24225, '1985-04-16', 20, '', 1, 6);
INSERT INTO `hive` (`id`, `name`, `latitude`, `longitude`, `altitude_in_m`, `orientation`, `type`, `bee_type`, `initial_weight_in_g`, `purchase_date`, `super_count`, `comment`, `is_active`, `apiary_id`) VALUES (35, 'voluptatem', '-32.458758', '49.660781', 2910, 'SO', 'Dadant', 'Dadant', 70650, '1989-12-29', 6, '', 1, 18);
INSERT INTO `hive` (`id`, `name`, `latitude`, `longitude`, `altitude_in_m`, `orientation`, `type`, `bee_type`, `initial_weight_in_g`, `purchase_date`, `super_count`, `comment`, `is_active`, `apiary_id`) VALUES (36, 'omnis', '43.285508', '12.335998', 2790, 'N', 'Dadant', 'Dadant', 50869, '1982-03-10', 19, 'Voluptas blanditiis rem dolor nihil aliquid et totam. Qui sit maxime alias. Ipsum doloribus earum at ut.', 1, 11);
INSERT INTO `hive` (`id`, `name`, `latitude`, `longitude`, `altitude_in_m`, `orientation`, `type`, `bee_type`, `initial_weight_in_g`, `purchase_date`, `super_count`, `comment`, `is_active`, `apiary_id`) VALUES (37, 'et', '-41.389384', '-165.759878', 1841, 'NO', 'Dadant', 'Dadant', 25547, '2017-12-22', 14, 'Nulla atque tempore nam officia molestias modi rem. Et ullam repellat harum dolor. Qui veritatis qui sed excepturi perspiciatis sunt non.', 1, 19);
INSERT INTO `hive` (`id`, `name`, `latitude`, `longitude`, `altitude_in_m`, `orientation`, `type`, `bee_type`, `initial_weight_in_g`, `purchase_date`, `super_count`, `comment`, `is_active`, `apiary_id`) VALUES (38, 'sunt', '-49.527475', '-10.596437', 2013, 'SE', 'Dadant', 'Dadant', 6440, '2002-09-17', 5, 'Nobis reprehenderit repellendus dolore non nihil porro reiciendis iste. Sit incidunt explicabo autem assumenda rerum atque. Odit aut architecto et natus sint ullam repellendus ut. Porro delectus nulla et et.', 1, 15);
INSERT INTO `hive` (`id`, `name`, `latitude`, `longitude`, `altitude_in_m`, `orientation`, `type`, `bee_type`, `initial_weight_in_g`, `purchase_date`, `super_count`, `comment`, `is_active`, `apiary_id`) VALUES (39, 'quia', '-13.276193', '59.276674', 933, 'NO', 'Dadant', 'Dadant', 92984, '2008-07-13', 5, 'Quod ut sint aliquid eaque laboriosam enim voluptatibus. Voluptatem quidem est harum aperiam. Atque dolor laborum explicabo sunt modi qui non. Sequi nesciunt ex qui laboriosam quidem voluptatem.', 1, 5);
INSERT INTO `hive` (`id`, `name`, `latitude`, `longitude`, `altitude_in_m`, `orientation`, `type`, `bee_type`, `initial_weight_in_g`, `purchase_date`, `super_count`, `comment`, `is_active`, `apiary_id`) VALUES (40, 'quidem', '-76.383861', '-83.272481', 1515, 'O', 'Dadant', 'Dadant', 15626, '1996-06-01', 6, '', 1, 11);
INSERT INTO `hive` (`id`, `name`, `latitude`, `longitude`, `altitude_in_m`, `orientation`, `type`, `bee_type`, `initial_weight_in_g`, `purchase_date`, `super_count`, `comment`, `is_active`, `apiary_id`) VALUES (41, 'eum', '-48.406814', '-109.012104', 908, 'SE', 'Dadant', 'Dadant', 90439, '2014-07-30', 19, 'Quas nobis deleniti alias natus. Earum perferendis perferendis corrupti.', 1, 13);
INSERT INTO `hive` (`id`, `name`, `latitude`, `longitude`, `altitude_in_m`, `orientation`, `type`, `bee_type`, `initial_weight_in_g`, `purchase_date`, `super_count`, `comment`, `is_active`, `apiary_id`) VALUES (42, 'ducimus', '5.115302', '90.298666', 1568, 'SE', 'Dadant', 'Dadant', 73443, '2009-10-01', 1, 'Est consectetur deleniti nulla et non dolor asperiores. At consequuntur unde ipsum expedita explicabo tempora voluptas. Soluta et quo aut quis ipsum. Facere facere doloribus nihil voluptatem nihil.', 1, 9);
INSERT INTO `hive` (`id`, `name`, `latitude`, `longitude`, `altitude_in_m`, `orientation`, `type`, `bee_type`, `initial_weight_in_g`, `purchase_date`, `super_count`, `comment`, `is_active`, `apiary_id`) VALUES (43, 'eum', '42.869411', '-97.977525', 5, 'E', 'Dadant', 'Dadant', 29575, '1977-03-21', 0, '', 1, 21);
INSERT INTO `hive` (`id`, `name`, `latitude`, `longitude`, `altitude_in_m`, `orientation`, `type`, `bee_type`, `initial_weight_in_g`, `purchase_date`, `super_count`, `comment`, `is_active`, `apiary_id`) VALUES (44, 'pariatur', '20.196662', '76.291423', 1417, 'SO', 'Dadant', 'Dadant', 34140, '2014-07-13', 16, '', 1, 17);
INSERT INTO `hive` (`id`, `name`, `latitude`, `longitude`, `altitude_in_m`, `orientation`, `type`, `bee_type`, `initial_weight_in_g`, `purchase_date`, `super_count`, `comment`, `is_active`, `apiary_id`) VALUES (45, 'ipsum', '68.070026', '-171.315853', 238, 'NO', 'Dadant', 'Dadant', 80568, '1987-03-17', 5, 'Dolores hic vel est aut non qui. Occaecati natus et atque voluptatem magnam ea.', 1, 3);
INSERT INTO `hive` (`id`, `name`, `latitude`, `longitude`, `altitude_in_m`, `orientation`, `type`, `bee_type`, `initial_weight_in_g`, `purchase_date`, `super_count`, `comment`, `is_active`, `apiary_id`) VALUES (46, 'nulla', '-73.574786', '-69.026644', 1513, 'O', 'Dadant', 'Dadant', 49697, '2017-04-17', 0, 'Quod minima reprehenderit est et officiis id. Doloribus in fugit maxime molestias repellat dicta culpa. Ad quam eaque beatae dignissimos autem. Quos iure quam tempora et fugit voluptatum.', 1, 6);
INSERT INTO `hive` (`id`, `name`, `latitude`, `longitude`, `altitude_in_m`, `orientation`, `type`, `bee_type`, `initial_weight_in_g`, `purchase_date`, `super_count`, `comment`, `is_active`, `apiary_id`) VALUES (47, 'et', '-7.746400', '-106.198990', 1076, 'SO', 'Dadant', 'Dadant', 60311, '2020-09-06', 7, 'Et tempora et maxime adipisci autem. Quia iusto nesciunt sunt quidem odit autem nemo. Quia officia magnam dolorem quidem itaque quis.', 1, 8);
INSERT INTO `hive` (`id`, `name`, `latitude`, `longitude`, `altitude_in_m`, `orientation`, `type`, `bee_type`, `initial_weight_in_g`, `purchase_date`, `super_count`, `comment`, `is_active`, `apiary_id`) VALUES (48, 'occaecati', '-9.961038', '101.387163', 2524, 'S', 'Dadant', 'Dadant', 42671, '2020-12-04', 20, 'Veritatis illum illum rem qui aspernatur. Esse consequatur excepturi voluptate itaque facere. Nobis aut error fugit officiis occaecati consectetur. Ut odio inventore aperiam.', 1, 3);
INSERT INTO `hive` (`id`, `name`, `latitude`, `longitude`, `altitude_in_m`, `orientation`, `type`, `bee_type`, `initial_weight_in_g`, `purchase_date`, `super_count`, `comment`, `is_active`, `apiary_id`) VALUES (49, 'non', '15.667679', '170.604204', 2807, 'S', 'Dadant', 'Dadant', 82320, '2015-01-29', 6, '', 1, 7);
INSERT INTO `hive` (`id`, `name`, `latitude`, `longitude`, `altitude_in_m`, `orientation`, `type`, `bee_type`, `initial_weight_in_g`, `purchase_date`, `super_count`, `comment`, `is_active`, `apiary_id`) VALUES (50, 'quam', '-48.776155', '-136.827781', 1094, 'S', 'Dadant', 'Dadant', 61749, '2020-04-17', 14, 'Autem quisquam dolores illo quo quas. Hic mollitia eveniet modi molestiae aut libero odio ratione. Magni illo error harum reiciendis fuga.', 1, 11);

-- #
-- # TABLE STRUCTURE FOR: sensor
-- #

-- DROP TABLE IF EXISTS `sensor`;

-- CREATE TABLE `sensor` (
--   `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
--   `ref` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
--   `type` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
--   `is_active` tinyint(4) DEFAULT NULL,
--   `id_hive` int(10) unsigned DEFAULT NULL,
--   `id_apiary` int(10) unsigned DEFAULT NULL,
--   PRIMARY KEY (`id`),
--   KEY `fk_sensor_hive1_idx` (`id_hive`),
--   KEY `fk_sensor_apiary1_idx` (`id_apiary`),
--   CONSTRAINT `fk_sensor_hive1` FOREIGN KEY (`id_hive`) REFERENCES `hive` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
--   CONSTRAINT `fk_sensor_apiary1` FOREIGN KEY (`id_apiary`) REFERENCES `apiary` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
-- ) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (1, 'mwx-958029', 'hygrométrie', 1, 25, 6);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (2, 'mag-194455', 'pression atmosphérique', 1, 47, 23);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (3, 'ryw-238069', 'pression atmosphérique', 1, 34, 25);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (4, 'bsp-828869', 'température', 1, 34, 17);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (5, 'tbb-440682', 'hygrométrie', 1, 10, 25);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (6, 'amh-128937', 'hygrométrie', 1, 44, 11);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (7, 'ekz-619061', 'poids', 1, 23, 12);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (8, 'mnd-008998', 'pression atmosphérique', 1, 47, 14);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (9, 'uyb-204637', 'hygrométrie', 1, 12, 5);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (10, 'evb-092817', 'pression atmosphérique', 1, 2, 25);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (11, 'fik-781671', 'hygrométrie', 1, 6, 25);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (12, 'inz-264544', 'température', 1, 4, 8);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (13, 'zko-349469', 'hygrométrie', 1, 37, 22);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (14, 'qhm-160724', 'poids', 1, 48, 21);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (15, 'ydm-302399', 'pression atmosphérique', 1, 34, 19);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (16, 'dan-938388', 'température', 1, 47, 5);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (17, 'ixp-208293', 'pression atmosphérique', 1, 48, 22);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (18, 'rao-894310', 'hygrométrie', 1, 4, 16);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (19, 'tlo-587263', 'poids', 1, 42, 19);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (20, 'tsk-046032', 'poids', 1, 14, 1);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (21, 'gid-097345', 'pression atmosphérique', 1, 37, 4);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (22, 'twe-884386', 'poids', 1, 22, 5);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (23, 'evi-042365', 'pression atmosphérique', 1, 30, 10);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (24, 'lpi-674773', 'température', 1, 36, 21);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (25, 'asy-184637', 'hygrométrie', 1, 27, 19);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (26, 'mlj-762764', 'poids', 1, 40, 16);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (27, 'ytq-649858', 'pression atmosphérique', 1, 37, 22);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (28, 'qsl-638411', 'hygrométrie', 1, 47, 12);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (29, 'czg-298854', 'poids', 1, 38, 23);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (30, 'lnu-804925', 'hygrométrie', 1, 13, 11);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (31, 'ova-508541', 'hygrométrie', 1, 32, 5);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (32, 'qlr-200692', 'poids', 1, 30, 15);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (33, 'ofx-696976', 'poids', 1, 2, 17);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (34, 'odf-318534', 'pression atmosphérique', 1, 10, 22);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (35, 'dcf-485342', 'température', 1, 20, 12);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (36, 'hqx-439953', 'température', 1, 45, 3);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (37, 'uaw-321464', 'hygrométrie', 1, 31, 9);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (38, 'hxd-106137', 'hygrométrie', 1, 16, 5);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (39, 'mwh-742103', 'poids', 1, 35, 1);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (40, 'int-794735', 'température', 1, 1, 6);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (41, 'ldo-967496', 'hygrométrie', 1, 39, 21);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (42, 'hmh-163298', 'poids', 1, 44, 13);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (43, 'qhw-179193', 'poids', 1, 34, 20);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (44, 'fpk-747680', 'hygrométrie', 1, 47, 11);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (45, 'frk-525127', 'poids', 1, 35, 5);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (46, 'gfe-278057', 'hygrométrie', 1, 43, 8);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (47, 'gqr-369661', 'température', 1, 18, 11);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (48, 'kbr-292834', 'pression atmosphérique', 1, 44, 10);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (49, 'hhj-006626', 'hygrométrie', 1, 4, 2);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (50, 'yhe-835340', 'poids', 1, 12, 12);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (51, 'aay-997253', 'pression atmosphérique', 1, 28, 4);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (52, 'fdo-837303', 'poids', 1, 30, 4);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (53, 'dvx-355112', 'température', 1, 23, 23);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (54, 'haw-968036', 'pression atmosphérique', 1, 17, 4);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (55, 'yjs-217648', 'température', 1, 46, 9);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (56, 'wwh-296657', 'pression atmosphérique', 1, 18, 17);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (57, 'wwp-298774', 'température', 1, 7, 6);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (58, 'yfm-032618', 'pression atmosphérique', 1, 9, 21);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (59, 'cfo-260634', 'température', 1, 1, 3);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (60, 'wxm-536510', 'hygrométrie', 1, 12, 18);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (61, 'hpu-257479', 'pression atmosphérique', 1, 14, 2);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (62, 'qyj-841985', 'poids', 1, 1, 16);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (63, 'tli-477216', 'poids', 1, 26, 23);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (64, 'koy-556294', 'température', 1, 1, 15);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (65, 'kcv-117964', 'poids', 1, 48, 7);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (66, 'fgt-394854', 'température', 1, 3, 13);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (67, 'axy-836285', 'poids', 1, 19, 17);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (68, 'ymp-124342', 'poids', 1, 33, 21);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (69, 'twl-105869', 'pression atmosphérique', 1, 27, 25);
INSERT INTO `sensor` (`id`, `ref`, `type`, `is_active`, `id_hive`, `id_apiary`) VALUES (70, 'ovp-935057', 'température', 1, 48, 12);

-- #
-- # TABLE STRUCTURE FOR: measurement
-- #

-- DROP TABLE IF EXISTS `measurement`;

-- CREATE TABLE `measurement` (
--   `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
--   `value` decimal(7,4) NOT NULL,
--   `measurement_date` date NOT NULL,
--   `measurement_hour` time NOT NULL,
--   `unit` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
--   `id_sensor` int(10) unsigned NOT NULL,
--   PRIMARY KEY (`id`),
--   KEY `fk_measurement_sensor1_idx` (`id_sensor`),
--   CONSTRAINT `fk_measurement_sensor1` FOREIGN KEY (`id_sensor`) REFERENCES `sensor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
-- ) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (1, '712.9100', '1990-05-31', '13:27:19', '°C', 29);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (2, '-9.5460', '1980-07-19', '07:32:08', '°C', 52);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (3, '388.0588', '2021-05-28', '12:13:34', '%', 26);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (4, '995.8681', '2002-03-04', '10:38:56', 'mbar', 62);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (5, '301.4091', '2010-11-30', '19:44:31', 'g', 38);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (6, '266.4975', '2009-04-26', '02:30:33', '%', 44);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (7, '8.9883', '1992-01-06', '21:04:13', '°C', 7);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (8, '137.4121', '2005-10-12', '00:55:45', 'mbar', 63);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (9, '834.9826', '2001-03-30', '20:13:17', '°C', 34);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (10, '358.3700', '2000-05-03', '15:50:11', 'mbar', 32);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (11, '893.8368', '1978-07-26', '02:08:45', 'g', 60);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (12, '519.8410', '2009-02-18', '01:16:17', 'mbar', 6);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (13, '655.0100', '1972-04-05', '22:27:29', 'mbar', 62);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (14, '970.8690', '2004-02-25', '21:39:49', '%', 44);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (15, '212.3949', '2008-04-25', '19:07:29', 'g', 38);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (16, '857.9718', '1975-08-06', '13:42:07', '°C', 54);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (17, '577.5146', '1980-12-26', '01:50:00', '°C', 4);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (18, '121.5877', '1990-05-23', '20:06:06', 'mbar', 43);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (19, '48.5920', '1973-12-28', '11:58:33', 'g', 36);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (20, '269.8000', '1977-08-09', '04:07:32', 'g', 6);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (21, '230.4395', '1988-12-23', '15:07:57', '%', 17);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (22, '145.0000', '2011-04-03', '14:03:24', 'mbar', 22);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (23, '765.3560', '1971-02-20', '20:23:03', 'mbar', 47);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (24, '514.5753', '1977-06-04', '01:52:44', 'g', 48);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (25, '293.0000', '1999-09-28', '18:46:32', 'g', 40);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (26, '761.6384', '1999-04-14', '04:48:08', '%', 13);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (27, '724.5926', '1973-07-24', '22:56:16', '°C', 2);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (28, '479.7479', '1993-10-07', '04:55:36', '°C', 21);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (29, '663.0000', '2002-07-14', '10:12:43', 'g', 39);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (30, '690.0490', '2009-12-10', '09:11:30', 'mbar', 10);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (31, '440.0911', '1972-11-04', '20:38:33', 'mbar', 46);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (32, '258.1988', '1986-07-06', '07:05:31', '°C', 67);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (33, '-0.2641', '2022-02-26', '07:55:01', 'mbar', 62);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (34, '712.7013', '1982-12-18', '21:02:02', 'mbar', 2);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (35, '272.3046', '1983-02-17', '19:07:04', 'g', 58);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (36, '-12.6662', '1978-03-16', '16:53:58', '°C', 29);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (37, '110.0000', '2021-11-15', '19:14:09', 'g', 46);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (38, '75.2197', '2004-05-31', '09:15:36', '°C', 65);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (39, '871.6000', '2008-01-08', '02:11:55', '%', 22);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (40, '337.7848', '1978-12-19', '23:33:59', '%', 10);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (41, '-56.0000', '1994-10-13', '19:32:57', '%', 27);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (42, '884.8946', '1972-01-02', '02:00:43', '°C', 11);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (43, '358.6642', '1994-11-22', '21:55:23', '%', 15);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (44, '916.0000', '2007-09-08', '04:16:53', '°C', 19);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (45, '-90.4016', '2019-09-29', '17:40:22', '%', 55);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (46, '482.2862', '2002-09-20', '14:23:55', 'g', 53);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (47, '55.8700', '2010-06-27', '21:40:46', 'g', 2);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (48, '212.7694', '2022-09-29', '10:41:26', '°C', 58);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (49, '739.2160', '1994-11-17', '02:24:01', '°C', 25);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (50, '927.4000', '2009-09-30', '13:55:13', 'g', 38);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (51, '964.4239', '1979-10-03', '10:17:38', 'mbar', 64);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (52, '840.8352', '1979-05-24', '21:31:50', 'mbar', 41);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (53, '597.1814', '2013-04-12', '02:21:24', '%', 60);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (54, '211.0247', '1994-02-07', '09:24:46', 'mbar', 41);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (55, '239.4000', '1991-04-20', '22:26:37', 'mbar', 18);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (56, '879.0670', '1994-07-09', '21:33:42', '%', 30);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (57, '-17.9700', '2004-11-22', '20:29:26', '%', 54);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (58, '307.0000', '2019-04-24', '19:22:43', '°C', 20);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (59, '205.5800', '2019-10-18', '11:55:57', '%', 50);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (60, '816.8426', '2014-03-24', '19:50:17', '°C', 22);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (61, '282.0000', '2016-10-13', '10:38:03', '°C', 29);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (62, '286.2248', '2020-06-18', '21:49:36', '%', 26);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (63, '-49.9852', '1984-03-04', '20:33:34', '°C', 18);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (64, '842.6000', '1976-08-02', '15:54:58', '°C', 20);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (65, '650.3722', '1986-02-21', '06:54:47', '°C', 27);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (66, '38.9589', '2013-05-20', '11:54:30', '%', 6);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (67, '468.4539', '2002-11-14', '01:23:11', '%', 49);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (68, '739.7396', '2021-08-29', '07:43:34', '°C', 3);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (69, '378.4000', '1984-06-10', '23:15:32', 'g', 1);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (70, '227.4300', '1995-12-23', '19:20:45', '%', 70);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (71, '671.6927', '1998-05-20', '14:53:43', 'g', 12);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (72, '180.5000', '2001-10-26', '19:00:54', '%', 28);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (73, '588.3000', '2011-04-24', '11:17:17', '%', 11);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (74, '140.0000', '1985-10-27', '19:15:21', '%', 26);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (75, '32.0105', '2012-03-05', '23:41:18', 'mbar', 46);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (76, '-29.3000', '1977-09-14', '14:57:31', 'g', 66);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (77, '963.0653', '2014-05-04', '03:13:13', '°C', 8);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (78, '242.8700', '2019-05-13', '20:55:00', '°C', 48);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (79, '811.0000', '1987-12-25', '03:56:23', 'mbar', 54);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (80, '852.0000', '1982-08-29', '15:40:20', '%', 32);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (81, '672.2598', '1987-07-10', '16:51:58', 'mbar', 16);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (82, '399.2400', '2009-09-17', '07:18:50', 'g', 47);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (83, '351.5691', '1978-06-17', '19:17:40', 'g', 3);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (84, '479.4000', '1993-01-29', '09:38:39', '°C', 5);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (85, '908.9577', '1978-05-22', '03:35:25', '%', 18);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (86, '114.5543', '1999-09-15', '16:32:19', '%', 20);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (87, '453.9900', '1985-11-18', '23:52:00', 'mbar', 34);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (88, '524.8521', '1976-12-18', '01:29:14', '°C', 1);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (89, '9.5640', '1997-05-11', '02:46:13', 'g', 40);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (90, '211.9732', '1989-02-16', '08:20:05', '°C', 14);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (91, '564.6404', '1992-06-02', '19:49:39', 'g', 22);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (92, '794.0000', '2011-02-13', '14:46:51', 'g', 68);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (93, '968.8301', '1973-08-29', '03:24:09', '%', 40);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (94, '995.5349', '2001-02-05', '15:09:57', '°C', 40);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (95, '555.8081', '1993-07-06', '20:08:57', '°C', 18);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (96, '712.7543', '2016-12-08', '03:07:09', 'mbar', 67);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (97, '101.7086', '2013-06-27', '17:27:13', '%', 45);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (98, '451.6000', '1987-10-09', '07:28:02', 'g', 67);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (99, '993.0000', '2008-03-28', '01:15:07', 'g', 69);
INSERT INTO `measurement` (`id`, `value`, `measurement_date`, `measurement_hour`, `unit`, `id_sensor`) VALUES (100, '705.9358', '1976-10-26', '18:35:45', 'mbar', 46);

-- #
-- # TABLE STRUCTURE FOR: alert_config
-- #

-- DROP TABLE IF EXISTS `alert_config`;

-- CREATE TABLE `alert_config` (
--   `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
--   `alert_type` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
--   `upper_limit` decimal(5,2) DEFAULT NULL,
--   `lower_limit` decimal(5,2) DEFAULT NULL,
--   `variation` decimal(4,2) DEFAULT NULL,
--   `interval` int(11) DEFAULT NULL,
--   `interval_unit` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
--   `id_sensor` int(10) unsigned NOT NULL,
--   PRIMARY KEY (`id`),
--   KEY `fk_alert_config_sensor1_idx` (`id_sensor`),
--   CONSTRAINT `fk_alert_config_sensor` FOREIGN KEY (`id_sensor`) REFERENCES `sensor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
-- ) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `alert_config` (`id`, `alert_type`, `upper_limit`, `lower_limit`, `variation`, `interval`, `interval_unit`, `id_sensor`) VALUES (1, '%', '0.00', '0.00', '0.00', 0, 'heures', 16);
INSERT INTO `alert_config` (`id`, `alert_type`, `upper_limit`, `lower_limit`, `variation`, `interval`, `interval_unit`, `id_sensor`) VALUES (2, 'g', '0.00', '0.00', '0.00', 1, 'jours', 59);
INSERT INTO `alert_config` (`id`, `alert_type`, `upper_limit`, `lower_limit`, `variation`, `interval`, `interval_unit`, `id_sensor`) VALUES (3, '°C', '90.00', '0.00', '-15.00', 0, 'jours', 53);
INSERT INTO `alert_config` (`id`, `alert_type`, `upper_limit`, `lower_limit`, `variation`, `interval`, `interval_unit`, `id_sensor`) VALUES (4, 'g', '0.00', '0.00', '0.00', 0, '', 63);
INSERT INTO `alert_config` (`id`, `alert_type`, `upper_limit`, `lower_limit`, `variation`, `interval`, `interval_unit`, `id_sensor`) VALUES (5, 'g', '0.00', '0.00', '-9.00', 0, 'jours', 55);
INSERT INTO `alert_config` (`id`, `alert_type`, `upper_limit`, `lower_limit`, `variation`, `interval`, `interval_unit`, `id_sensor`) VALUES (6, '°C', '89.00', '0.00', '5.00', 0, '', 43);
INSERT INTO `alert_config` (`id`, `alert_type`, `upper_limit`, `lower_limit`, `variation`, `interval`, `interval_unit`, `id_sensor`) VALUES (7, '%', '95.00', '0.00', '-1.00', 0, 'heures', 64);
INSERT INTO `alert_config` (`id`, `alert_type`, `upper_limit`, `lower_limit`, `variation`, `interval`, `interval_unit`, `id_sensor`) VALUES (8, 'mbar', '0.00', '98.00', '0.00', 0, 'jours', 30);
INSERT INTO `alert_config` (`id`, `alert_type`, `upper_limit`, `lower_limit`, `variation`, `interval`, `interval_unit`, `id_sensor`) VALUES (9, '°C', '0.00', '0.00', '0.00', 5, '', 8);
INSERT INTO `alert_config` (`id`, `alert_type`, `upper_limit`, `lower_limit`, `variation`, `interval`, `interval_unit`, `id_sensor`) VALUES (10, '°C', '25.00', '0.00', '15.00', 0, '', 59);