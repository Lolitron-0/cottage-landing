--
-- Файл сгенерирован с помощью SQLiteStudio v3.3.3 в Сб июн 10 16:23:41 2023
--
-- Использованная кодировка текста: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Таблица: auth_group
CREATE TABLE "auth_group" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(150) NOT NULL UNIQUE);

-- Таблица: auth_group_permissions
CREATE TABLE "auth_group_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);

-- Таблица: auth_permission
CREATE TABLE "auth_permission" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "content_type_id" integer NOT NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "codename" varchar(100) NOT NULL, "name" varchar(255) NOT NULL);
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (1, 1, 'add_house', 'Can add house');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (2, 1, 'change_house', 'Can change house');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (3, 1, 'delete_house', 'Can delete house');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (4, 1, 'view_house', 'Can view house');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (5, 2, 'add_image', 'Can add image');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (6, 2, 'change_image', 'Can change image');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (7, 2, 'delete_image', 'Can delete image');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (8, 2, 'view_image', 'Can view image');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (9, 3, 'add_logentry', 'Can add log entry');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (10, 3, 'change_logentry', 'Can change log entry');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (11, 3, 'delete_logentry', 'Can delete log entry');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (12, 3, 'view_logentry', 'Can view log entry');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (13, 4, 'add_permission', 'Can add permission');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (14, 4, 'change_permission', 'Can change permission');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (15, 4, 'delete_permission', 'Can delete permission');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (16, 4, 'view_permission', 'Can view permission');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (17, 5, 'add_group', 'Can add group');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (18, 5, 'change_group', 'Can change group');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (19, 5, 'delete_group', 'Can delete group');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (20, 5, 'view_group', 'Can view group');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (21, 6, 'add_user', 'Can add user');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (22, 6, 'change_user', 'Can change user');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (23, 6, 'delete_user', 'Can delete user');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (24, 6, 'view_user', 'Can view user');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (25, 7, 'add_contenttype', 'Can add content type');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (26, 7, 'change_contenttype', 'Can change content type');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (27, 7, 'delete_contenttype', 'Can delete content type');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (28, 7, 'view_contenttype', 'Can view content type');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (29, 8, 'add_session', 'Can add session');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (30, 8, 'change_session', 'Can change session');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (31, 8, 'delete_session', 'Can delete session');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (32, 8, 'view_session', 'Can view session');

-- Таблица: auth_user
CREATE TABLE "auth_user" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "password" varchar(128) NOT NULL, "last_login" datetime NULL, "is_superuser" bool NOT NULL, "username" varchar(150) NOT NULL UNIQUE, "last_name" varchar(150) NOT NULL, "email" varchar(254) NOT NULL, "is_staff" bool NOT NULL, "is_active" bool NOT NULL, "date_joined" datetime NOT NULL, "first_name" varchar(150) NOT NULL);
INSERT INTO auth_user (id, password, last_login, is_superuser, username, last_name, email, is_staff, is_active, date_joined, first_name) VALUES (1, 'pbkdf2_sha256$260000$uBQI0imeWbIgXsEXIaWPg3$vWVTMj5H2WSWGoR95lLku41mhzV6BC4g2yN+Vy3AgL8=', '2023-06-02 21:20:23.238847', 1, 'niten', '', 'ovcharov_05@mail.ru', 1, 1, '2023-06-02 21:20:18.798961', '');

-- Таблица: auth_user_groups
CREATE TABLE "auth_user_groups" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED);

-- Таблица: auth_user_user_permissions
CREATE TABLE "auth_user_user_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);

-- Таблица: django_admin_log
CREATE TABLE "django_admin_log" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "action_time" datetime NOT NULL, "object_id" text NULL, "object_repr" varchar(200) NOT NULL, "change_message" text NOT NULL, "content_type_id" integer NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "action_flag" smallint unsigned NOT NULL CHECK ("action_flag" >= 0));
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (1, '2023-06-02 21:24:33.909011', '1', 'PREV   16.5X18.3  ---  images/Дом_1_filmic_Hue_cIU1La9.jpg', '[{"added": {}}]', 2, 1, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (2, '2023-06-02 21:24:39.373230', '2', '16.5X18.3  ---  images/Дом_2_filmic_Hue_FXfyFPS.jpg', '[{"added": {}}]', 2, 1, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (3, '2023-06-02 21:24:45.138775', '3', '16.5X18.3  ---  images/Дом_3_filmic_Hue_UDnk8XN.jpg', '[{"added": {}}]', 2, 1, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (4, '2023-06-02 21:25:01.082475', '4', '16.5X18.3  ---  images/Дом_4_filmic_Hue_SGAjmdF.jpg', '[{"added": {}}]', 2, 1, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (5, '2023-06-02 21:26:26.089561', '5', '16.5X18.3  ---  images/планировка_page-0001_TEZio1D.jpg', '[{"added": {}}]', 2, 1, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (6, '2023-06-02 21:27:01.694538', '6', 'PREV   15.5X15  ---  images/Виз1_YwAaxRP.jpg', '[{"added": {}}]', 2, 1, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (7, '2023-06-02 21:27:07.951411', '7', '15.5X15  ---  images/Виз_3_IKzUHlG.jpg', '[{"added": {}}]', 2, 1, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (8, '2023-06-02 21:27:12.655473', '8', '15.5X15  ---  images/Виз2_6VN0XTz.jpg', '[{"added": {}}]', 2, 1, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (9, '2023-06-02 21:27:16.006067', '9', '15.5X15  ---  images/Виз4_poBMZpx.jpg', '[{"added": {}}]', 2, 1, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (10, '2023-06-02 21:27:48.820258', '10', '15.5X15  ---  images/планировка_page-0001_uzrGW0s.jpg', '[{"added": {}}]', 2, 1, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (11, '2023-06-02 21:28:43.471736', '11', 'PREV   14X22  ---  images/вид_1_4mwW8nP.jpg', '[{"added": {}}]', 2, 1, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (12, '2023-06-02 21:28:46.918090', '12', '14X22  ---  images/вид_2_Pz5M2Ur.jpg', '[{"added": {}}]', 2, 1, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (13, '2023-06-02 21:28:50.985292', '13', '14X22  ---  images/вид_3_dXD5Cop.jpg', '[{"added": {}}]', 2, 1, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (14, '2023-06-02 21:28:55.828455', '14', '14X22  ---  images/вид_4_LasoQXM.jpg', '[{"added": {}}]', 2, 1, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (15, '2023-06-02 21:29:12.882883', '15', '14X22  ---  images/планировка_page-0001_kpjOuPg.jpg', '[{"added": {}}]', 2, 1, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (16, '2023-06-02 21:29:48.409327', '16', 'PREV   16X16.2  ---  images/Вид_1_f7EURlc.jpg', '[{"added": {}}]', 2, 1, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (17, '2023-06-02 21:29:52.736925', '17', '16X16.2  ---  images/Вид_2_rpHcmjH.jpg', '[{"added": {}}]', 2, 1, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (18, '2023-06-02 21:29:55.958235', '18', '16X16.2  ---  images/Вид_3_OubQ881.jpg', '[{"added": {}}]', 2, 1, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (19, '2023-06-02 21:30:01.305476', '19', '16X16.2  ---  images/Вид_4_jyjuoA3.jpg', '[{"added": {}}]', 2, 1, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (20, '2023-06-02 21:30:17.847151', '20', '16X16.2  ---  images/планировка_page-0001_rNgSVRk.jpg', '[{"added": {}}]', 2, 1, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (21, '2023-06-02 21:32:10.900148', '21', 'PREV   18X19  ---  images/Дом_18х19_1_final_vQgp2Ar.jpg', '[{"added": {}}]', 2, 1, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (22, '2023-06-02 21:32:15.139788', '22', '18X19  ---  images/Дом_18х19_2.effectsResult_g62if1y.jpg', '[{"added": {}}]', 2, 1, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (23, '2023-06-02 21:32:20.757825', '23', '18X19  ---  images/Дом_18х19_3_final_c3vmGS0.jpg', '[{"added": {}}]', 2, 1, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (24, '2023-06-02 21:32:24.103776', '24', '18X19  ---  images/Дом_18х19_4_final_5fFMnf5.jpg', '[{"added": {}}]', 2, 1, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (25, '2023-06-02 21:32:40.385716', '25', '18X19  ---  images/планировка_page-0001_3L1ZdEm.jpg', '[{"added": {}}]', 2, 1, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (26, '2023-06-02 21:32:52.588342', '26', 'PREV   21X12  ---  images/Виз1_YP61fZq.jpg', '[{"added": {}}]', 2, 1, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (27, '2023-06-02 21:32:55.783467', '27', '21X12  ---  images/Виз2_EIqOEia.jpg', '[{"added": {}}]', 2, 1, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (28, '2023-06-02 21:32:58.604891', '28', '21X12  ---  images/Виз3_H5CDy0s.jpg', '[{"added": {}}]', 2, 1, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (29, '2023-06-02 21:33:02.459406', '29', '21X12  ---  images/Виз4_7qY1tyu.jpg', '[{"added": {}}]', 2, 1, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (30, '2023-06-02 21:33:17.249160', '30', '21X12  ---  images/планировка_page-0001_rQDC6kn.jpg', '[{"added": {}}]', 2, 1, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (31, '2023-06-02 21:33:40.059643', '31', 'PREV   15X14  ---  images/вид_1_zLQuyOZ.jpg', '[{"added": {}}]', 2, 1, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (32, '2023-06-02 21:33:43.765506', '32', '15X14  ---  images/вид_2_jKHgsdQ.jpg', '[{"added": {}}]', 2, 1, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (33, '2023-06-02 21:33:46.825524', '33', '15X14  ---  images/вид_3_vSiyNJl.jpg', '[{"added": {}}]', 2, 1, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (34, '2023-06-02 21:33:50.963971', '34', '15X14  ---  images/вид_4_pGUmLg5.jpg', '[{"added": {}}]', 2, 1, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (35, '2023-06-02 21:34:06.994683', '35', '15X14  ---  images/планировка_page-0001_5iZNmgM.jpg', '[{"added": {}}]', 2, 1, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (36, '2023-06-03 11:38:43.134656', '1', '16.5X18.3  ---  images/Дом_1_filmic_Hue_cIU1La9.jpg', '[{"changed": {"fields": ["IsPreview"]}}]', 2, 1, 2);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (37, '2023-06-03 11:38:54.273038', '2', 'PREV   16.5X18.3  ---  images/Дом_2_filmic_Hue_FXfyFPS.jpg', '[{"changed": {"fields": ["IsPreview"]}}]', 2, 1, 2);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (38, '2023-06-03 11:39:53.459124', '31', '15X14  ---  images/вид_1_zLQuyOZ.jpg', '[{"changed": {"fields": ["IsPreview"]}}]', 2, 1, 2);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (39, '2023-06-03 11:40:00.652834', '33', 'PREV   15X14  ---  images/вид_3_vSiyNJl.jpg', '[{"changed": {"fields": ["IsPreview"]}}]', 2, 1, 2);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (40, '2023-06-09 17:52:39.285178', '7', '15x13', '[{"changed": {"fields": ["YSize"]}}]', 1, 1, 2);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (41, '2023-06-09 17:53:33.424655', '7', '15x13', '[{"changed": {"fields": ["Area", "ConstructingTime", "Bedrooms", "Toilets"]}}]', 1, 1, 2);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (42, '2023-06-09 17:54:48.083234', '6', '21x12', '[{"changed": {"fields": ["Area", "ConstructingTime", "Bedrooms", "Toilets"]}}]', 1, 1, 2);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (43, '2023-06-09 17:55:35.504806', '5', '18x19', '[{"changed": {"fields": ["Area", "ConstructingTime", "Bedrooms", "Toilets"]}}]', 1, 1, 2);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (44, '2023-06-09 17:56:07.614083', '4', '16x16.2', '[{"changed": {"fields": ["Area", "ConstructingTime", "Bedrooms", "Toilets"]}}]', 1, 1, 2);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (45, '2023-06-09 17:56:44.362716', '3', '14x22', '[{"changed": {"fields": ["Area", "ConstructingTime", "Bedrooms", "Toilets"]}}]', 1, 1, 2);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (46, '2023-06-09 17:57:15.898194', '2', '15.5x15', '[{"changed": {"fields": ["Area", "ConstructingTime", "Bedrooms", "Toilets"]}}]', 1, 1, 2);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (47, '2023-06-09 17:57:56.072779', '1', '16.5x18.3', '[{"changed": {"fields": ["Area", "ConstructingTime", "Bedrooms", "Toilets"]}}]', 1, 1, 2);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (48, '2023-06-09 18:10:31.841183', '7', '15x13', '[{"changed": {"fields": ["Price"]}}]', 1, 1, 2);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (49, '2023-06-09 18:10:40.244012', '6', '21x12', '[{"changed": {"fields": ["Price"]}}]', 1, 1, 2);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (50, '2023-06-09 18:10:49.476843', '5', '18x19', '[{"changed": {"fields": ["Price"]}}]', 1, 1, 2);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (51, '2023-06-09 18:10:57.459746', '4', '16x16.2', '[{"changed": {"fields": ["Price"]}}]', 1, 1, 2);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (52, '2023-06-09 18:11:09.200006', '3', '14x22', '[{"changed": {"fields": ["Price"]}}]', 1, 1, 2);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (53, '2023-06-09 18:11:28.474961', '2', '15.5x15', '[{"changed": {"fields": ["Price"]}}]', 1, 1, 2);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) VALUES (54, '2023-06-09 18:11:37.474612', '1', '16.5x18.3', '[{"changed": {"fields": ["Price"]}}]', 1, 1, 2);

-- Таблица: django_content_type
CREATE TABLE "django_content_type" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app_label" varchar(100) NOT NULL, "model" varchar(100) NOT NULL);
INSERT INTO django_content_type (id, app_label, model) VALUES (1, 'web', 'house');
INSERT INTO django_content_type (id, app_label, model) VALUES (2, 'web', 'image');
INSERT INTO django_content_type (id, app_label, model) VALUES (3, 'admin', 'logentry');
INSERT INTO django_content_type (id, app_label, model) VALUES (4, 'auth', 'permission');
INSERT INTO django_content_type (id, app_label, model) VALUES (5, 'auth', 'group');
INSERT INTO django_content_type (id, app_label, model) VALUES (6, 'auth', 'user');
INSERT INTO django_content_type (id, app_label, model) VALUES (7, 'contenttypes', 'contenttype');
INSERT INTO django_content_type (id, app_label, model) VALUES (8, 'sessions', 'session');

-- Таблица: django_migrations
CREATE TABLE "django_migrations" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app" varchar(255) NOT NULL, "name" varchar(255) NOT NULL, "applied" datetime NOT NULL);
INSERT INTO django_migrations (id, app, name, applied) VALUES (1, 'contenttypes', '0001_initial', '2023-06-02 21:15:27.444458');
INSERT INTO django_migrations (id, app, name, applied) VALUES (2, 'auth', '0001_initial', '2023-06-02 21:15:27.468395');
INSERT INTO django_migrations (id, app, name, applied) VALUES (3, 'admin', '0001_initial', '2023-06-02 21:15:27.485349');
INSERT INTO django_migrations (id, app, name, applied) VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2023-06-02 21:15:27.499311');
INSERT INTO django_migrations (id, app, name, applied) VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2023-06-02 21:15:27.512277');
INSERT INTO django_migrations (id, app, name, applied) VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2023-06-02 21:15:27.532223');
INSERT INTO django_migrations (id, app, name, applied) VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2023-06-02 21:15:27.545189');
INSERT INTO django_migrations (id, app, name, applied) VALUES (8, 'auth', '0003_alter_user_email_max_length', '2023-06-02 21:15:27.558155');
INSERT INTO django_migrations (id, app, name, applied) VALUES (9, 'auth', '0004_alter_user_username_opts', '2023-06-02 21:15:27.569125');
INSERT INTO django_migrations (id, app, name, applied) VALUES (10, 'auth', '0005_alter_user_last_login_null', '2023-06-02 21:15:27.583087');
INSERT INTO django_migrations (id, app, name, applied) VALUES (11, 'auth', '0006_require_contenttypes_0002', '2023-06-02 21:15:27.590069');
INSERT INTO django_migrations (id, app, name, applied) VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2023-06-02 21:15:27.601040');
INSERT INTO django_migrations (id, app, name, applied) VALUES (13, 'auth', '0008_alter_user_username_max_length', '2023-06-02 21:15:27.614006');
INSERT INTO django_migrations (id, app, name, applied) VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2023-06-02 21:15:27.625973');
INSERT INTO django_migrations (id, app, name, applied) VALUES (15, 'auth', '0010_alter_group_name_max_length', '2023-06-02 21:15:27.637941');
INSERT INTO django_migrations (id, app, name, applied) VALUES (16, 'auth', '0011_update_proxy_permissions', '2023-06-02 21:15:27.648913');
INSERT INTO django_migrations (id, app, name, applied) VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2023-06-02 21:15:27.662875');
INSERT INTO django_migrations (id, app, name, applied) VALUES (18, 'sessions', '0001_initial', '2023-06-02 21:15:27.676837');
INSERT INTO django_migrations (id, app, name, applied) VALUES (19, 'web', '0001_initial', '2023-06-02 21:15:27.692794');
INSERT INTO django_migrations (id, app, name, applied) VALUES (20, 'web', '0002_alter_image_priority', '2023-06-02 21:23:46.167988');
INSERT INTO django_migrations (id, app, name, applied) VALUES (21, 'web', '0003_auto_20230609_2050', '2023-06-09 17:51:28.677913');
INSERT INTO django_migrations (id, app, name, applied) VALUES (22, 'web', '0004_rename_buildarea_house_area', '2023-06-09 17:52:03.772653');
INSERT INTO django_migrations (id, app, name, applied) VALUES (23, 'web', '0005_house_price', '2023-06-09 18:01:23.703177');
INSERT INTO django_migrations (id, app, name, applied) VALUES (24, 'web', '0006_alter_house_price', '2023-06-09 18:10:17.633519');

-- Таблица: django_session
CREATE TABLE "django_session" ("session_key" varchar(40) NOT NULL PRIMARY KEY, "session_data" text NOT NULL, "expire_date" datetime NOT NULL);
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('41xp5kin5bkh0dxg9tcz06xdlsrcoyzd', '.eJxVjMsOwiAQRf-FtSEwtTxcuu83EAZmpGogKe3K-O_apAvd3nPOfYkQt7WErdMS5iwuQovT74YxPajuIN9jvTWZWl2XGeWuyIN2ObVMz-vh_h2U2Mu3HtgDsfKgzwYB2SkLmm3WmighuCGPSM468DxAQlYm0pitU2iIvHLi_QHiojgO:1q5CC7:WyJt8zDMQbexliKn5Yml3czGG6xYNvNyDq40wXGW798', '2023-06-16 21:20:23.244831');

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
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (1, 'images/Дом_1_filmic_Hue_cIU1La9.jpg', 0, 1, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (2, 'images/Дом_2_filmic_Hue_FXfyFPS.jpg', 1, 1, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (3, 'images/Дом_3_filmic_Hue_UDnk8XN.jpg', 0, 1, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (4, 'images/Дом_4_filmic_Hue_SGAjmdF.jpg', 0, 1, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (5, 'images/планировка_page-0001_TEZio1D.jpg', 0, 1, -1);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (6, 'images/Виз1_YwAaxRP.jpg', 1, 2, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (7, 'images/Виз_3_IKzUHlG.jpg', 0, 2, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (8, 'images/Виз2_6VN0XTz.jpg', 0, 2, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (9, 'images/Виз4_poBMZpx.jpg', 0, 2, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (10, 'images/планировка_page-0001_uzrGW0s.jpg', 0, 2, -1);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (11, 'images/вид_1_4mwW8nP.jpg', 1, 3, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (12, 'images/вид_2_Pz5M2Ur.jpg', 0, 3, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (13, 'images/вид_3_dXD5Cop.jpg', 0, 3, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (14, 'images/вид_4_LasoQXM.jpg', 0, 3, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (15, 'images/планировка_page-0001_kpjOuPg.jpg', 0, 3, -1);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (16, 'images/Вид_1_f7EURlc.jpg', 1, 4, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (17, 'images/Вид_2_rpHcmjH.jpg', 0, 4, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (18, 'images/Вид_3_OubQ881.jpg', 0, 4, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (19, 'images/Вид_4_jyjuoA3.jpg', 0, 4, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (20, 'images/планировка_page-0001_rNgSVRk.jpg', 0, 4, -1);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (21, 'images/Дом_18х19_1_final_vQgp2Ar.jpg', 1, 5, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (22, 'images/Дом_18х19_2.effectsResult_g62if1y.jpg', 0, 5, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (23, 'images/Дом_18х19_3_final_c3vmGS0.jpg', 0, 5, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (24, 'images/Дом_18х19_4_final_5fFMnf5.jpg', 0, 5, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (25, 'images/планировка_page-0001_3L1ZdEm.jpg', 0, 5, -1);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (26, 'images/Виз1_YP61fZq.jpg', 1, 6, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (27, 'images/Виз2_EIqOEia.jpg', 0, 6, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (28, 'images/Виз3_H5CDy0s.jpg', 0, 6, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (29, 'images/Виз4_7qY1tyu.jpg', 0, 6, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (30, 'images/планировка_page-0001_rQDC6kn.jpg', 0, 6, -1);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (31, 'images/вид_1_zLQuyOZ.jpg', 0, 7, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (32, 'images/вид_2_jKHgsdQ.jpg', 0, 7, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (33, 'images/вид_3_vSiyNJl.jpg', 1, 7, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (34, 'images/вид_4_pGUmLg5.jpg', 0, 7, 0);
INSERT INTO web_image (id, image, isPreview, house_id, priority) VALUES (35, 'images/планировка_page-0001_5iZNmgM.jpg', 0, 7, -1);

-- Индекс: auth_group_permissions_group_id_b120cbf9
CREATE INDEX "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" ("group_id");

-- Индекс: auth_group_permissions_group_id_permission_id_0cd325b0_uniq
CREATE UNIQUE INDEX "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" ("group_id", "permission_id");

-- Индекс: auth_group_permissions_permission_id_84c5c92e
CREATE INDEX "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" ("permission_id");

-- Индекс: auth_permission_content_type_id_2f476e4b
CREATE INDEX "auth_permission_content_type_id_2f476e4b" ON "auth_permission" ("content_type_id");

-- Индекс: auth_permission_content_type_id_codename_01ab375a_uniq
CREATE UNIQUE INDEX "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" ("content_type_id", "codename");

-- Индекс: auth_user_groups_group_id_97559544
CREATE INDEX "auth_user_groups_group_id_97559544" ON "auth_user_groups" ("group_id");

-- Индекс: auth_user_groups_user_id_6a12ed8b
CREATE INDEX "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" ("user_id");

-- Индекс: auth_user_groups_user_id_group_id_94350c0c_uniq
CREATE UNIQUE INDEX "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" ("user_id", "group_id");

-- Индекс: auth_user_user_permissions_permission_id_1fbb5f2c
CREATE INDEX "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" ("permission_id");

-- Индекс: auth_user_user_permissions_user_id_a95ead1b
CREATE INDEX "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" ("user_id");

-- Индекс: auth_user_user_permissions_user_id_permission_id_14a6b632_uniq
CREATE UNIQUE INDEX "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" ("user_id", "permission_id");

-- Индекс: django_admin_log_content_type_id_c4bce8eb
CREATE INDEX "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" ("content_type_id");

-- Индекс: django_admin_log_user_id_c564eba6
CREATE INDEX "django_admin_log_user_id_c564eba6" ON "django_admin_log" ("user_id");

-- Индекс: django_content_type_app_label_model_76bd3d3b_uniq
CREATE UNIQUE INDEX "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" ("app_label", "model");

-- Индекс: django_session_expire_date_a5c62663
CREATE INDEX "django_session_expire_date_a5c62663" ON "django_session" ("expire_date");

-- Индекс: web_image_house_id_760e9408
CREATE INDEX "web_image_house_id_760e9408" ON "web_image" ("house_id");

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
