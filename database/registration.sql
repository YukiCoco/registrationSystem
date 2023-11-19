-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主机： db
-- 生成日期： 2023-11-19 14:02:31
-- 服务器版本： 5.7.43
-- PHP 版本： 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `registration`
--

-- --------------------------------------------------------

--
-- 表的结构 `department`
--

CREATE TABLE `department` (
  `departmentId` int(11) NOT NULL,
  `departmentName` char(50) DEFAULT NULL,
  `departmentDes` char(50) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `departmentArea` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `department`
--

INSERT INTO `department` (`departmentId`, `departmentName`, `departmentDes`, `status`, `departmentArea`) VALUES
(1, '牙科2', '测试', 1, '3楼A厅'),
(2, '妇科2', '测试', 1, '4楼A厅'),
(3, '儿科3', '测试', 1, '4楼A厅'),
(4, '口腔科', '测试描述', 1, '4楼B厅'),
(5, '测试科室', '测试介绍', 1, '4楼A厅'),
(6, '牙科2', '测试', 1, '4楼A厅'),
(7, '3楼C厅', '测试', 1, '4楼A厅'),
(8, '测试科室1', '测试', 1, '测试'),
(9, '测试科室2', '测试', 1, '测试'),
(10, '测试科室3', '测试', 1, '测试'),
(11, '测试科室4', '测试', 1, '测试'),
(12, '测试科室5', '测试', 1, '测试'),
(13, '测试科室6', '测试', 1, '测试'),
(14, '测试科室7', '测试', 1, '测试'),
(15, '测试', '测试', 1, '测试'),
(16, '测试', '测试', 1, '测试'),
(17, '测试', '测试', 1, '测试'),
(18, '测试', '测试', 1, '测试'),
(19, '测试', '测试', 1, '测试');

-- --------------------------------------------------------

--
-- 表的结构 `doctor`
--

CREATE TABLE `doctor` (
  `doctorId` int(11) NOT NULL,
  `doctorName` char(50) DEFAULT NULL,
  `deptId` int(11) DEFAULT NULL COMMENT '科室id',
  `deptName` char(50) DEFAULT NULL COMMENT '科室名字',
  `workTime` char(50) DEFAULT NULL COMMENT '值班时间',
  `workStatus` tinyint(1) DEFAULT NULL COMMENT '上班状态 0请假 1正常',
  `doctorDes` varchar(255) DEFAULT NULL COMMENT '医生介绍',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `doctor`
--

INSERT INTO `doctor` (`doctorId`, `doctorName`, `deptId`, `deptName`, `workTime`, `workStatus`, `doctorDes`, `status`) VALUES
(1, '测试2', 1, '科室1', '星期一,星期二,星期三', 0, '测试', 1),
(2, '测试2', 3, '科室2', '星期二,星期四,星期五', 1, '测试介绍测试介绍测试介绍测试介绍测试介绍测试介绍测试介绍测试介绍测试介绍测试介绍测试介绍测试介绍测试介绍测试介绍测试介绍测试介绍测试介绍测试介绍测试介绍测试介绍测试介绍', 1),
(3, '测试3', 4, '科室4', '星期二,星期三,星期四,星期五', 1, '测试', 1);

-- --------------------------------------------------------

--
-- 表的结构 `register`
--

CREATE TABLE `register` (
  `registerId` int(11) NOT NULL,
  `doctorName` char(50) DEFAULT NULL COMMENT '医生姓名',
  `doctorId` int(11) DEFAULT NULL COMMENT '医生id',
  `hzName` char(50) DEFAULT NULL COMMENT '患者姓名',
  `hzId` int(11) DEFAULT NULL COMMENT '患者id',
  `deptId` int(11) DEFAULT NULL COMMENT '部门id',
  `deptName` char(50) DEFAULT NULL COMMENT '科室名字',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态',
  `ghStatus` int(11) DEFAULT NULL COMMENT '挂号状态',
  `registerTime` datetime(6) DEFAULT NULL COMMENT '预约时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `user_account`
--

CREATE TABLE `user_account` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `level` tinyint(1) DEFAULT NULL COMMENT '0为普通用户,1为admin，2为医生',
  `status` tinyint(1) DEFAULT NULL COMMENT '1有效，0无效',
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `tel` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `user_account`
--

INSERT INTO `user_account` (`user_id`, `username`, `password`, `level`, `status`, `name`, `address`, `tel`) VALUES
(1, 'admin', 'admin', 1, 1, NULL, NULL, NULL),
(2, 'user', 'user', 2, 1, NULL, NULL, NULL),
(3, 'test', 'test', 2, 1, NULL, NULL, NULL),
(4, 'kurisu', '123456', 2, 1, 'kurisu', 'NMU', '16608831561');

--
-- 转储表的索引
--

--
-- 表的索引 `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`departmentId`) USING BTREE;

--
-- 表的索引 `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doctorId`) USING BTREE;

--
-- 表的索引 `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`registerId`) USING BTREE;

--
-- 表的索引 `user_account`
--
ALTER TABLE `user_account`
  ADD PRIMARY KEY (`user_id`) USING BTREE;

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `department`
--
ALTER TABLE `department`
  MODIFY `departmentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- 使用表AUTO_INCREMENT `doctor`
--
ALTER TABLE `doctor`
  MODIFY `doctorId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `user_account`
--
ALTER TABLE `user_account`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
