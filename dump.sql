--
-- Файл сгенерирован с помощью SQLiteStudio v3.3.3 в Сб июн 10 18:29:31 2023
--
-- Использованная кодировка текста: windows-1251
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Таблица: web_house
CREATE TABLE "web_house" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "xSize" varchar(5) NOT NULL, "ySize" varchar(5) NOT NULL, "bedrooms" varchar(5) NOT NULL, "constructingTime" varchar(5) NOT NULL, "toilets" varchar(5) NOT NULL, "area" varchar(5) NOT NULL, "price" varchar(20) NOT NULL);
INSERT INTO web_house (id, xSize, ySize, bedrooms, constructingTime, toilets, area, price) VALUES (1, '16.5', '18.3', '3', '3', '2', '302', '17 500 000');
INSERT INTO web_house (id, xSize, ySize, bedrooms, constructingTime, toilets, area, price) VALUES (2, '15.5', '15', '3', '2.5', '1', '255', '13 400 000');
INSERT INTO web_house (id, xSize, ySize, bedrooms, constructingTime, toilets, area, price) VALUES (3, '14', '22', '3', '3.5', '2', '308', '18 200 000');
INSERT INTO web_house (id, xSize, ySize, bedrooms, constructingTime, toilets, area, price) VALUES (4, '16', '16.2', '3', '2.5', '2', '156', '11 700 000');
INSERT INTO web_house (id, xSize, ySize, bedrooms, constructingTime, toilets, area, price) VALUES (5, '18', '19', '3', '3.5', '2', '342', '20 600 000');
INSERT INTO web_house (id, xSize, ySize, bedrooms, constructingTime, toilets, area, price) VALUES (6, '21', '12', '3', '3.5', '2', '252', '15 200 000');
INSERT INTO web_house (id, xSize, ySize, bedrooms, constructingTime, toilets, area, price) VALUES (7, '15', '13', '2', '2.5', '1', '195', '12 400 000');

-- Таблица: web_image
CREATE TABLE "web_image" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "image" varchar(100) NULL, "isPreview" bool NOT NULL, "house_id" bigint NOT NULL REFERENCES "web_house" ("id") DEFERRABLE INITIALLY DEFERRED, "priority" integer NOT NULL);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (36, 'images/2.jpg', 1, 1, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (37, 'images/1.jpg', 0, 1, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (38, 'images/3.jpg', 0, 1, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (39, 'images/4.jpg', 0, 1, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (40, 'images/plan.jpg', 0, 1, -1);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (41, 'images/1_n3SIDNt.jpg', 1, 2, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (42, 'images/2_BNakuJk.jpg', 0, 2, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (43, 'images/3_01467ya.jpg', 0, 2, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (44, 'images/4_okAC4N6.jpg', 0, 2, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (45, 'images/plan_VNaXQXW.jpg', 0, 2, -1);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (46, 'images/1_Bn0blXZ.jpg', 1, 3, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (47, 'images/2_tGiceFK.jpg', 0, 3, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (48, 'images/3_enaPqDo.jpg', 0, 3, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (49, 'images/4_ZVlTg1x.jpg', 0, 3, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (50, 'images/plan_LW8VjXM.jpg', 0, 3, -1);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (51, 'images/3_RXJTvZd.jpg', 1, 4, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (52, 'images/1_N0bEST5.jpg', 0, 4, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (53, 'images/2_gAAIeoL.jpg', 0, 4, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (54, 'images/4_YEGKygL.jpg', 0, 4, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (55, 'images/plan_Ur0R6nL.jpg', 0, 4, -1);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (56, 'images/1_XPI9SO8.jpg', 1, 5, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (57, 'images/2_Vpzsnh5.jpg', 0, 5, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (58, 'images/3_z8hGB5B.jpg', 0, 5, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (59, 'images/4_c6gBcy7.jpg', 0, 5, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (60, 'images/plan_JwUL9yR.jpg', 0, 5, -1);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (61, 'images/1_6biXtOA.jpg', 1, 6, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (62, 'images/2_wW6fwvZ.jpg', 0, 6, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (63, 'images/3_9B65roZ.jpg', 0, 6, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (64, 'images/4_ZhD9TqO.jpg', 0, 6, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (65, 'images/plan_J9q4Z4c.jpg', 0, 6, -1);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (66, 'images/1_VUgTzcp.jpg', 1, 7, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (67, 'images/2_PHNpbBh.jpg', 0, 7, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (68, 'images/3_4UnUXGO.jpg', 0, 7, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (69, 'images/4_rsnfCTI.jpg', 0, 7, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (70, 'images/plan_FWnl8aK.jpg', 0, 7, -1);

-- Индекс: web_image_house_id_760e9408
CREATE INDEX "web_image_house_id_760e9408" ON "web_image" ("house_id");

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
