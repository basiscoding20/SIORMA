/*
 Navicat Premium Data Transfer

 Source Server         : phpmyadmin
 Source Server Type    : MySQL
 Source Server Version : 100420
 Source Host           : localhost:3306
 Source Schema         : siorma

 Target Server Type    : MySQL
 Target Server Version : 100420
 File Encoding         : 65001

 Date: 15/10/2021 23:01:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `attr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES (1, 'APP_NAME', 'Sekolah BasisCoding');
INSERT INTO `config` VALUES (2, 'APP_NAME_SLUG', 'sekolah-basiscoding');
INSERT INTO `config` VALUES (3, 'LOGO_SEKOLAH', 'logo.png');
INSERT INTO `config` VALUES (4, 'NAMA_SEKOLAH', 'SEKOLAH BASISCODING');
INSERT INTO `config` VALUES (5, 'NPSN', '1234567890');
INSERT INTO `config` VALUES (6, 'STATUS', 'Negeri');
INSERT INTO `config` VALUES (7, 'ALAMAT', 'JL. RAYA CILEGON KM. 03');
INSERT INTO `config` VALUES (8, 'RT', '02');
INSERT INTO `config` VALUES (9, 'RW', '02');
INSERT INTO `config` VALUES (10, 'KODE_POS', '42162');
INSERT INTO `config` VALUES (11, 'KELURAHAN', 'DRANGONG');
INSERT INTO `config` VALUES (12, 'KECAMATAN', 'TAKTAKAN');
INSERT INTO `config` VALUES (13, 'KABUPATEN', 'KOTA SERANG');
INSERT INTO `config` VALUES (14, 'PROVINSI', 'BANTEN');
INSERT INTO `config` VALUES (15, 'LATTITUDE', '-6.1067488');
INSERT INTO `config` VALUES (16, 'LONGITUDE', '106.1370279');
INSERT INTO `config` VALUES (17, 'SK_PENDIRIAN', NULL);
INSERT INTO `config` VALUES (18, 'TANGGAL_SK_PENDIRIAN', NULL);
INSERT INTO `config` VALUES (19, 'STATUS_KEPEMILIKAN', 'Pemerintah Daerah');
INSERT INTO `config` VALUES (20, 'SK_IZIN_OPRS', NULL);
INSERT INTO `config` VALUES (21, 'TANGGAL_SK_IZIN_OPRS', NULL);
INSERT INTO `config` VALUES (22, 'NO_REKENING', '1500002212010');
INSERT INTO `config` VALUES (23, 'NAMA_BANK', 'BANK BRI');
INSERT INTO `config` VALUES (24, 'CABANG_KCP', 'SERANG');
INSERT INTO `config` VALUES (25, 'REK_ATAS_NAMA', 'AHMAD FATONI');
INSERT INTO `config` VALUES (26, 'NAMA_WAJIB_PAJAK', 'Sekolah BasisCoding');
INSERT INTO `config` VALUES (27, 'NPWP', '0056767252516123');
INSERT INTO `config` VALUES (28, 'TELEPON', '0254650281');
INSERT INTO `config` VALUES (29, 'FAX', '0254123354');
INSERT INTO `config` VALUES (30, 'EMAIL', 'basiscoding20@gmail.com');
INSERT INTO `config` VALUES (31, 'WEBSITE', 'sekolahbasiscoding.com');
INSERT INTO `config` VALUES (32, 'APP_ICON', 'color.png');
INSERT INTO `config` VALUES (34, 'SLOGAN_SEKOLAH', 'Terdepan dalam antisipasi masa depan');

-- ----------------------------
-- Table structure for departemen
-- ----------------------------
DROP TABLE IF EXISTS `departemen`;
CREATE TABLE `departemen`  (
  `id_departemen` int NOT NULL AUTO_INCREMENT,
  `organisasi_id` int NULL DEFAULT NULL,
  `nama_departemen` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `update_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_departemen`) USING BTREE,
  INDEX `departemen_organisasi`(`organisasi_id`) USING BTREE,
  CONSTRAINT `departemen_organisasi` FOREIGN KEY (`organisasi_id`) REFERENCES `organisasi` (`id_organisasi`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of departemen
-- ----------------------------

-- ----------------------------
-- Table structure for dokumen
-- ----------------------------
DROP TABLE IF EXISTS `dokumen`;
CREATE TABLE `dokumen`  (
  `id_dokumen` int NOT NULL AUTO_INCREMENT,
  `organisasi_id` int NOT NULL,
  `judul_dokumen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `update_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_dokumen`) USING BTREE,
  INDEX `dokumen_organisasi`(`organisasi_id`) USING BTREE,
  CONSTRAINT `dokumen_organisasi` FOREIGN KEY (`organisasi_id`) REFERENCES `organisasi` (`id_organisasi`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dokumen
-- ----------------------------

-- ----------------------------
-- Table structure for menus
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama_menu` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `link` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `color` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `parrent_id` int NOT NULL,
  `sequence` int NOT NULL,
  `role_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  CONSTRAINT `menus_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id_roles`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menus
-- ----------------------------

-- ----------------------------
-- Table structure for organisasi
-- ----------------------------
DROP TABLE IF EXISTS `organisasi`;
CREATE TABLE `organisasi`  (
  `id_organisasi` int NOT NULL AUTO_INCREMENT,
  `logo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_organisasi` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `periode_id` int NOT NULL,
  `sk_pendirian` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `slogan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `misi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `visi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `update_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_organisasi`) USING BTREE,
  INDEX `periode_organisasi`(`periode_id`) USING BTREE,
  CONSTRAINT `periode_organisasi` FOREIGN KEY (`periode_id`) REFERENCES `periode` (`id_periode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of organisasi
-- ----------------------------

-- ----------------------------
-- Table structure for periode
-- ----------------------------
DROP TABLE IF EXISTS `periode`;
CREATE TABLE `periode`  (
  `id_periode` int NOT NULL AUTO_INCREMENT,
  `tahun_ajaran` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `update_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_periode`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of periode
-- ----------------------------

-- ----------------------------
-- Table structure for proker
-- ----------------------------
DROP TABLE IF EXISTS `proker`;
CREATE TABLE `proker`  (
  `id_proker` int NOT NULL AUTO_INCREMENT,
  `departemen_id` int NOT NULL,
  `nama_proker` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `bulan` datetime NOT NULL,
  `nama_penanggungjawab` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tujuan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `status_acc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status_validasi` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `update_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_proker`) USING BTREE,
  INDEX `departemen_proker`(`departemen_id`) USING BTREE,
  CONSTRAINT `departemen_proker` FOREIGN KEY (`departemen_id`) REFERENCES `departemen` (`id_departemen`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2147483648 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of proker
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id_roles` int NOT NULL AUTO_INCREMENT,
  `name_role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name_slug` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `update_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_roles`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------

-- ----------------------------
-- Table structure for super_admin
-- ----------------------------
DROP TABLE IF EXISTS `super_admin`;
CREATE TABLE `super_admin`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama_lengkap` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `alamat_lengkap` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `no_hp` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role_id` int NOT NULL,
  `status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `update_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `role_superadmin`(`role_id`) USING BTREE,
  CONSTRAINT `role_superadmin` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id_roles`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of super_admin
-- ----------------------------

-- ----------------------------
-- Table structure for surat
-- ----------------------------
DROP TABLE IF EXISTS `surat`;
CREATE TABLE `surat`  (
  `id_surat` int NOT NULL AUTO_INCREMENT,
  `organisasi_id` int NOT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `jenis_surat` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `judul_surat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `no_surat` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pengirim` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `perihal` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tanggal` datetime NOT NULL,
  `tujuan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_surat`) USING BTREE,
  INDEX `organisasi_surat`(`organisasi_id`) USING BTREE,
  CONSTRAINT `organisasi_surat` FOREIGN KEY (`organisasi_id`) REFERENCES `organisasi` (`id_organisasi`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of surat
-- ----------------------------

-- ----------------------------
-- Table structure for transaksi_keuangan
-- ----------------------------
DROP TABLE IF EXISTS `transaksi_keuangan`;
CREATE TABLE `transaksi_keuangan`  (
  `id_keuangan` int NOT NULL AUTO_INCREMENT,
  `organisasi_id` int NOT NULL,
  `judul` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `jenis_transaksi` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `debit` bigint NOT NULL,
  `kredit` bigint NOT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `update_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_keuangan`) USING BTREE,
  INDEX `organisasi_transaksi`(`organisasi_id`) USING BTREE,
  CONSTRAINT `organisasi_transaksi` FOREIGN KEY (`organisasi_id`) REFERENCES `organisasi` (`id_organisasi`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of transaksi_keuangan
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `nim` bigint NOT NULL,
  `organisasi_id` int NULL DEFAULT NULL,
  `departemen_id` int NULL DEFAULT NULL,
  `fakultas_id` int NOT NULL,
  `jurusan_id` int NOT NULL,
  `role_id` int NOT NULL,
  `nama_lengkap` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `jenis_kelamin` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `jenis_kelas` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `alamat_lengkap` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email_verified_at` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `verification_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `no_hp` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `update_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`nim`) USING BTREE,
  INDEX `departemen`(`departemen_id`) USING BTREE,
  INDEX `organisasi`(`organisasi_id`) USING BTREE,
  INDEX `role_users`(`role_id`) USING BTREE,
  CONSTRAINT `departemen` FOREIGN KEY (`departemen_id`) REFERENCES `departemen` (`id_departemen`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `organisasi` FOREIGN KEY (`organisasi_id`) REFERENCES `organisasi` (`id_organisasi`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_users` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id_roles`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
