-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 21, 2024 at 04:40 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `forum`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `discussion_id` int(11) NOT NULL,
  `author` varchar(100) NOT NULL DEFAULT 'Anonymous',
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `discussion_id`, `author`, `content`, `created_at`) VALUES
(1, 1, 'Anonymous', 'ttttttt', '2024-07-07 14:51:09'),
(2, 1, 'Anonymous', 'tttttttttt', '2024-07-07 14:51:10'),
(3, 1, 'Anonymous', 'ttttttttttttqeqe', '2024-07-07 14:51:13'),
(4, 2, 'Anonymous', 'aaaaaaaaaa', '2024-07-07 14:52:13'),
(5, 2, 'Anonymous', 'dddddddddd', '2024-07-07 14:52:14'),
(6, 3, 'Anonymous', 'aqeqeqwe', '2024-07-07 14:52:19'),
(7, 1, 'Anonymous', 'dadad', '2024-07-07 14:53:48'),
(8, 1, 'Anonymous', 'dadad', '2024-07-07 14:53:52'),
(9, 1, 'Anonymous', 'dadad', '2024-07-07 15:00:23'),
(10, 1, 'Anonymous', 'dadad', '2024-07-07 15:00:32'),
(11, 1, 'Anonymous', 'dadad', '2024-07-07 15:00:38'),
(12, 5, 'Anonymous', 'adadad', '2024-07-10 05:33:03'),
(13, 5, 'Anonymous', 'adad', '2024-07-10 05:33:04'),
(14, 5, 'Anonymous', 'adad', '2024-07-10 05:33:05'),
(15, 5, 'Anonymous', 'adada', '2024-07-10 05:33:06'),
(16, 5, 'Anonymous', 'dada', '2024-07-10 05:33:07'),
(17, 5, 'Anonymous', 'dada', '2024-07-10 05:33:08'),
(18, 5, 'Anonymous', 'dad', '2024-07-10 05:33:08'),
(19, 5, 'Anonymous', 'adadad', '2024-07-10 05:33:09'),
(20, 5, 'Anonymous', 'adad', '2024-07-10 05:33:10'),
(21, 5, 'Anonymous', 'adad', '2024-07-10 05:33:11'),
(22, 5, 'Anonymous', 'adad', '2024-07-10 05:33:12'),
(23, 5, 'Anonymous', 'ad', '2024-07-10 05:33:12'),
(24, 5, 'Anonymous', '', '2024-07-10 05:33:13'),
(27, 6, 'Anonymous', 'ada', '2024-07-10 05:45:54'),
(28, 6, 'Anonymous', 'adad', '2024-07-10 05:45:55'),
(29, 7, 'Anonymous', 'adad', '2024-07-10 05:59:26'),
(30, 7, 'Anonymous', 'a', '2024-07-10 05:59:27'),
(31, 7, 'Anonymous', 'a', '2024-07-10 06:00:35'),
(32, 9, 'Anonymous', 'ddD', '2024-07-10 07:49:17'),
(33, 5, 'Anonymous', 'adadad', '2024-07-10 08:00:39'),
(34, 5, 'Anonymous', 'adad', '2024-07-10 08:00:40'),
(35, 11, 'Anonymous', 'You know the stock market where you own the stock digitally right? Same concept for digital gold. Physical gold so troublesome to keep and sell.', '2024-07-10 08:34:34'),
(36, 11, 'Anonymous', 'Have no issues with digital gold. The whole world is going digital anyway. Had a look at TNG\'s e-MAS and its pretty good as there\'s no fees imposed for the user. Minimum invest RM10, will give that platform a try.', '2024-07-10 08:34:40'),
(37, 11, 'Anonymous', 'Physical gold lets you look at the shiny when you need cheering.', '2024-07-10 08:34:55'),
(38, 11, 'Anonymous', 'Physical gold lets you look at the shiny when you need cheering.', '2024-07-10 08:36:31'),
(39, 11, 'Anonymous', 'Physical gold lets you look at the shiny when you need cheering.', '2024-07-10 08:36:52'),
(40, 2, 'Anonymous', 'kelvin', '2024-07-10 09:19:32'),
(41, 2, 'Anonymous', 'kelvin', '2024-07-10 09:20:07'),
(42, 10, 'Anonymous', 'ada', '2024-07-11 09:59:00'),
(43, 10, 'Anonymous', 'dad', '2024-07-11 09:59:01'),
(44, 10, 'Anonymous', 'dad', '2024-07-11 10:04:02'),
(45, 10, 'Anonymous', 'ADAD', '2024-07-11 10:04:10'),
(46, 13, 'Anonymous', 'adadad', '2024-07-12 09:05:53'),
(47, 13, 'Anonymous', 'da', '2024-07-12 09:05:54'),
(48, 14, 'Anonymous', 'adad', '2024-07-12 09:13:07'),
(49, 14, 'Anonymous', 'dada', '2024-07-12 09:13:08'),
(50, 14, 'Anonymous', 'dad', '2024-07-12 09:13:09'),
(51, 14, 'gay', 'dad', '2024-07-12 09:17:02'),
(52, 14, 'Anonymous', 'adad', '2024-07-12 09:17:29'),
(53, 14, 'q', 'adad', '2024-07-12 09:19:00'),
(54, 16, 'Anonymous', 'adad', '2024-07-12 09:26:13'),
(55, 16, 'kelvin', 'adad', '2024-07-12 09:28:23'),
(56, 16, 'kelvin', 'adad', '2024-07-12 09:28:32'),
(57, 16, 'kelvin', '', '2024-07-12 09:28:33'),
(58, 16, 'kelvin', '', '2024-07-12 09:29:38'),
(59, 16, 'kelvin', 'adad', '2024-07-12 09:29:41'),
(60, 16, 'kelvin', 'add', '2024-07-12 09:29:44'),
(61, 16, 'kelvin', 'add', '2024-07-12 09:29:49'),
(62, 16, 'q', 'adadad', '2024-07-12 09:31:18'),
(63, 16, 'q', 'adqqqq', '2024-07-12 09:31:21'),
(64, 16, 'face', 'nijao\r\n', '2024-07-12 09:33:25'),
(65, 17, 'q', 'nihao\r\n', '2024-07-15 02:01:08'),
(66, 14, 'q', 'hello\r\n', '2024-07-15 03:50:34'),
(67, 14, 'q', 'hello\r\n', '2024-07-15 03:50:39'),
(68, 19, 'q', 'adad', '2024-07-15 07:53:15'),
(69, 19, 'q', 'dadad', '2024-07-15 07:53:18'),
(70, 19, 'kelvin', 'adadad', '2024-07-15 07:54:58'),
(71, 19, 'kelvin', '', '2024-07-15 07:54:58'),
(72, 21, 'jacky', 'adadad', '2024-07-17 06:43:13'),
(73, 21, 'jacky', 'adad', '2024-07-17 06:43:15'),
(74, 21, 'jacky', 'adad', '2024-07-17 06:43:16'),
(75, 22, 'Lee', 'atat', '2024-07-17 08:59:09'),
(76, 22, 'Lee', 'ada', '2024-07-18 08:00:51'),
(77, 22, 'Lee', '', '2024-07-18 08:00:52'),
(78, 25, 'Lee', 'ad', '2024-07-18 08:05:04'),
(79, 25, 'Lee', 'adad', '2024-07-18 08:05:07'),
(80, 29, 'Lee', 'dada', '2024-07-18 15:09:27'),
(81, 29, 'Lee', 'dad', '2024-07-18 15:09:28'),
(82, 29, 'Lee', 'dad', '2024-07-18 15:09:29'),
(83, 34, 'Lee', 'adada', '2024-07-20 14:32:29'),
(84, 34, 'Lee', 'dadad', '2024-07-20 14:32:31'),
(85, 35, 'Lee', 'ada', '2024-07-21 04:50:30'),
(86, 35, 'Lee', 'adad', '2024-07-21 04:50:32'),
(87, 35, 'Lee', 'adad', '2024-07-21 05:19:26'),
(88, 35, 'Lee', 'qqq', '2024-07-21 05:34:14'),
(89, 35, 'Lee', '', '2024-07-21 05:36:09'),
(90, 35, 'Lee', 'dada', '2024-07-21 05:36:11'),
(91, 35, 'Lee', 'dada', '2024-07-21 05:36:29'),
(92, 35, 'Lee', 'adad', '2024-07-21 05:40:39'),
(93, 35, 'Lee', 'adad', '2024-07-21 05:41:45'),
(94, 35, 'Lee', 'adad', '2024-07-21 05:41:50'),
(95, 35, 'Lee', 'adad', '2024-07-21 05:41:59'),
(96, 35, 'Lee', 'adad', '2024-07-21 05:42:00'),
(97, 35, 'Lee', 'adad', '2024-07-21 05:42:12'),
(98, 35, 'Lee', 'adad', '2024-07-21 05:43:35'),
(99, 35, 'Lee', 'adad', '2024-07-21 05:43:58'),
(100, 35, 'Lee', 'adad', '2024-07-21 05:43:59'),
(101, 35, 'Lee', '宋海哦', '2024-07-21 06:23:06'),
(102, 35, 'Lee', 'dadad', '2024-07-21 06:28:25'),
(103, 35, 'Lee', 'adad', '2024-07-21 06:32:25'),
(104, 35, 'Lee', 'adad', '2024-07-21 06:34:41'),
(105, 36, 'jacky', 'adad', '2024-07-21 06:52:04'),
(106, 36, 'jacky', 'dada', '2024-07-21 06:52:06'),
(107, 37, 'jacky', 'adad', '2024-07-21 06:54:20'),
(108, 37, 'jacky', 'dad', '2024-07-21 06:54:21'),
(109, 35, 'Lee', 'dada', '2024-07-21 06:57:21'),
(110, 37, 'jacky', 'adad', '2024-07-21 07:03:39'),
(111, 39, 'Lee', 'qqq', '2024-07-21 07:11:40'),
(112, 39, 'Lee', 'qqq', '2024-07-21 07:11:41'),
(113, 39, 'jacky', 'a', '2024-07-21 07:52:34'),
(114, 39, 'jacky', 'a', '2024-07-21 07:55:08'),
(115, 39, 'jacky', 'dadad', '2024-07-21 07:55:12'),
(116, 39, 'jacky', 'dadad', '2024-07-21 07:55:27'),
(117, 39, 'jacky', 'dadad', '2024-07-21 07:56:39'),
(118, 39, 'jacky', 'ada', '2024-07-21 07:56:41'),
(119, 39, 'jacky', 'ada', '2024-07-21 07:57:44'),
(120, 39, 'jacky', 'ada', '2024-07-21 08:01:49'),
(121, 39, 'jacky', 'ada', '2024-07-21 08:02:42'),
(122, 39, 'jacky', 'ada', '2024-07-21 08:03:43'),
(123, 29, 'jacky', 'ad', '2024-07-21 08:04:05'),
(124, 38, 'jacky', 'ad', '2024-07-21 08:11:23'),
(125, 38, 'jacky', 'adad', '2024-07-21 08:27:44'),
(126, 38, 'jacky', 'adad', '2024-07-21 08:44:47'),
(127, 39, 'jacky', 'a', '2024-07-21 09:10:36'),
(128, 39, 'jacky', 'a', '2024-07-21 09:11:13'),
(129, 39, 'jacky', 'a', '2024-07-21 09:11:13'),
(130, 39, 'jacky', 'a', '2024-07-21 09:11:25'),
(131, 39, 'jacky', 'dada', '2024-07-21 09:11:28'),
(132, 39, 'Lee', 'dd', '2024-07-21 12:27:49'),
(133, 39, 'Lee', 'dd', '2024-07-21 12:30:20'),
(134, 39, 'Lee', 'dd', '2024-07-21 12:35:07'),
(135, 39, 'Lee', 'dd', '2024-07-21 12:37:44'),
(136, 39, 'Lee', 'dd', '2024-07-21 12:37:50'),
(137, 39, 'Lee', 'dad', '2024-07-21 12:37:53'),
(138, 39, 'Lee', 'dad', '2024-07-21 12:40:40'),
(139, 39, 'Lee', 'qqq', '2024-07-21 13:10:46'),
(140, 39, 'Lee', 'qqq', '2024-07-21 13:14:38'),
(141, 39, 'Lee', 'qqq', '2024-07-21 13:15:42'),
(142, 39, 'Lee', 'qqq', '2024-07-21 13:15:45'),
(143, 39, 'lee', 'haha', '2024-07-21 14:12:15');

-- --------------------------------------------------------

--
-- Table structure for table `discussions`
--

CREATE TABLE `discussions` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `image_path` varchar(255) DEFAULT NULL,
  `view_count` int(11) DEFAULT 0,
  `nickname` varchar(255) DEFAULT NULL,
  `avatar_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `discussions`
--

INSERT INTO `discussions` (`id`, `title`, `content`, `created_at`, `image_path`, `view_count`, `nickname`, `avatar_url`) VALUES
(1, 'test 1', 'nihao', '2024-07-07 14:42:52', 'photo\\L.P.jpg\"', 11, NULL, NULL),
(2, 'test 1', 'nihao', '2024-07-07 08:44:50', NULL, 2, NULL, NULL),
(3, 'test 1', 'qqq', '2024-07-07 08:47:50', NULL, 1, NULL, NULL),
(4, 'adad', 'ada', '2024-07-09 09:39:45', NULL, 6, NULL, NULL),
(5, '\"Cryin\" Cut and Sew Wide-body Long Sleeved Tee Black', 'face', '2024-07-09 23:32:55', NULL, 0, NULL, NULL),
(6, '\"Cryin\" Cut and Sew Wide-body Long Sleeved Tee Black', 'fafaf', '2024-07-09 23:44:03', '', 2, NULL, NULL),
(7, '\"Neothaicivilization: The Adventure\" Taper-Fit Heavy Cotton Long Sleeve Tee Mint', 'adadad', '2024-07-09 23:59:11', 'uploads/gold-medal.png', 0, NULL, NULL),
(8, '(group 3)', 'adadd', '2024-07-10 00:23:34', '', 3, NULL, NULL),
(9, 'complaint to kevin', 'fafafafffafafafaf', '2024-07-10 01:48:53', 'uploads/bronze-medal (1).png', 4, NULL, NULL),
(10, 'test', '\r\n HOME\r\nMAIL\r\nNEWS\r\nFINANCE\r\nSPORT\r\nENTERTAINMENT\r\nLIFE\r\nSEARCH\r\nSHOPPING\r\nMORE...\r\nYahoo Finance\r\nSearch for news, symbols or companies\r\n\r\nSign in\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n Mail\r\nSingapore markets close in 2 hours 21 minutes\r\nStraits Times Index\r\n3,446.51\r\n+20.42 (+0.60%)\r\n \r\nNikkei\r\n41,738.00\r\n+157.83 (+0.38%)\r\n \r\nHang Seng\r\n17,537.98\r\n+14.75 (+0.08%)\r\n \r\nFTSE 100\r\n8,139.81\r\n-53.68 (-0.66%)\r\n \r\nBitcoin USD\r\n58,948.95\r\n+1,635.63 (+2.85%)\r\n \r\nCMC Crypto 200\r\n1,226.78\r\n+11.95 (+0.98%)\r\n \r\nS&P 500\r\n5,576.98\r\n+4.13 (+0.07%)\r\n \r\nDow\r\n39,291.97\r\n-52.82 (-0.13%)\r\n \r\nNasdaq\r\n18,429.29\r\n+25.55 (+0.14%)\r\n \r\nGold\r\n2,374.20\r\n+6.30 (+0.27%)\r\n \r\nCrude Oil\r\n81.21\r\n-0.20 (-0.25%)\r\n \r\n10-Yr Bond\r\n4.3000\r\n+0.0310 (+0.73%)\r\n \r\nFTSE Bursa Malaysia\r\n1,617.05\r\n+2.63 (+0.16%)\r\n \r\nJakarta Composite Index\r\n7,298.96\r\n+29.16 (+0.40%)\r\n \r\nPSE Index\r\n6,507.32\r\n-49.34 (-0.75%)\r\n \r\n\r\nBenzingaBenzinga\r\nIntel Is Getting Closer To Staging Its Comeback\r\n\r\nINTC\r\n+1.77%\r\n\r\nAMD\r\n-0.89%\r\n\r\nTSM\r\n-1.13%\r\nUpwallstreet\r\nWed, 10 July 2024 at 1:57 am MYT·3-min read\r\nIn this article:\r\n\r\nINTC\r\n+1.77%\r\n\r\n\r\nAMD\r\n-0.89%\r\n\r\n\r\nTSM\r\n-1.13%\r\n\r\nIntel Is Getting Closer To Staging Its Comeback\r\nIntel Is Getting Closer To Staging Its Comeback\r\nBack in 2009, Advanced Micro Devices Inc (NASDAQ: AMD) decided to give up on manufacturing its own chips and turned to Taiwan Semiconductor Manufacturing Company (NYSE: TSM). Fast forward, with long delays and missteps, Intel Corporation (NASDAQ: INTC) ended up with inferior manufacturing technology. But, this is set to change later this year.\r\n\r\nIntel opened up to outsourcing to TSMC.\r\n\r\nIntel has launched products on its Intel 4 and Intel 3 process nodes, but neither can compare to TSMC\'s best. But, Intel will be using TSMC\'s advanced 3nm process node for in its Lunar Lake laptop CPUs. AMD is using the same process node for its Ryzen AI laptop chips that are scheduled for release this month.\r\n\r\nIntel is expected to close the gap with Intel 20A, which it will use for this year\'s Arrow Lake desktop CPUs, and Intel 18A, which will be ready early next year. Panther Lake will use the Intel 18A process and is expected to launch sometime in 2025. Simply matching TSMC in manufacturing means AMD’s competitive edge will diminish.\r\n\r\nIntel is aiming to become the world\'s second-largest foundry.\r\n\r\nBecoming a foundry and a world-class one is a costly endeavour, but for now, Intel is rising to the challenge. Intel showed it is on track to reach its ambitious goal by the end of the decade, under the leadership of CEO Pat Gelsinger. Gelsinger’s bold plan has been named IDM 2.0, with the IDM standing for Integrated Device Manufacturer to describe Intel’s new identity of a semiconductor companies that both designs and manufactures chips. Embedded in its bold goals is also the promise to deliver five new process nodes in four years that will help Intel regain its process technology leadership.\r\n\r\nNew competition is looming.\r\n\r\nDuring a tale as old as time, Intel and AMD have been enjoying the PC CPU market duopoly. But that began to change when Microsoft Corporation (NASDAQ: MSFT) chose CPUs from Arm Holdings plc (NASDAQ: ARM), the world\'s leading designer of mobile CPUs. Arm itself doesn\'t face any meaningful competitors in its core market as its dominant chip designs are used in almost all premium smartphones. But, Arm is gradually lowering its dependence on smartphones by designing new chips for the cloud and auto markets. Besides this higher growth sector, Arm also anticipates the rising demand for its higher-royalty AI-optimized Armv9 chip designs to fuel its near-term expansion across the smartphone, cloud, and auto sectors. For fiscal 2025, Arm expects its revenue to grow from 18% to 27%, with adjusted EPS increasing from 14%-30%, showing its intent to gradually diversify its business is on track. Even Intel entered a multigeneration collaboration last year. Together, Intel and Arm are co-optimizing the design technology of the Intel 18A process and Arm’s chips.\r\n\r\nStory continues\r\nTRENDING\r\n1.\r\n3 Singapore Blue-Chip Stocks Whose Share Prices May Be Poised for a Rebound\r\n2.\r\nDyson to cut about 1,000 UK jobs as new CEO reviews strategy\r\n3.\r\nSingapore Banks’ Share Prices Are Hitting All-Time Highs: Can Their Momentum Continue?\r\n4.\r\nS&P 500, Nasdaq set records as European bourses fall\r\n5.\r\n4 Promising US Growth Stocks That Can Dish Up Tantalising Returns for Your Portfolio\r\nTerms/Privacy PolicyPrivacy DashboardAbout Our Ads\r\nLatest stories\r\n\r\nThe Telegraph\r\nMicrosoft staff told to use iPhones in China amid security fears\r\nMicrosoft has ordered staff in China to swap their Android devices for iPhones amid mounting security concerns.\r\n\r\n2 days ago\r\n\r\nBarrons.com\r\nApple, AMD and Intel Should Be ‘Catch-Up’ AI Winners for the Second Half\r\nNvidia, Broadcom, and a few other chip makers were the big winners from artificial intelligence in the first six months of 2024. Melius Reseach says other companies now stand to benefit.\r\n\r\n2 days ago\r\n\r\nAd\r\n•\r\nOur Better World\r\n\r\nAd\r\nTalenpac: From Refugee to Entrepreneur\r\nTalenpac, a social enterprise in Malaysia that runs a free micro-entrepreneurship programme for refugees goes beyond temporary solutions by...\r\n\r\n\r\nEngadget\r\nEarly Prime Day deals bring the third-gen AirPods back down to $140\r\nGet Apple\'s third-gen AirPods for their all-time low price.\r\n\r\n2 days ago\r\n\r\nThe Guardian\r\nChinese developers scramble as OpenAI blocks access in China\r\nUS firm’s move, amid Beijing-Washington tensions, sparks rush to lure users to homegrown models\r\n\r\na day ago\r\n\r\nZacks\r\nNokia (NOK) Facilitates 5G Carrier Aggregation for BT Group\r\nNokia (NOK) in collaboration with Qualcomm help make BT Group the first European operator to achieve 5G 5CC carrier aggregation.\r\n\r\n2 days ago\r\n\r\nAd\r\n•\r\nThe Fifth Person\r\n\r\nAd\r\nAI’s Impact: These Industries That Will Never Be the Same\r\n\r\nTechCrunch\r\nGoogle Maps is rolling out speedometer, speed limits on iPhone and CarPlay globally\r\nGoogle Maps has introduced speedometer and speed limits on iOS and CarPlay — more than five years after their debut on Android — to help iPhone users avoid speed ticketing while driving. TechCrunch has exclusively learned that Google has begun rolling out speedometers and speed limits for iPhone users globally. When people start navigation on Google Maps, the vehicle\'s speed is shown in miles or kilometers, depending on the region.\r\n\r\n15 hours ago\r\n\r\nNextShark\r\nSouth Korea records its first robot \'suicide\'\r\nNearly a year into its operations, the first civil servant robot of Gumi City, South Korea, was discovered unresponsive after falling down a staircase in the city council building. The incident, which occurred at around 4 p.m. on June 20, has been dubbed the country’s first robot “suicide.”\r\n\r\na day ago\r\nReuters\r\nTurkey launches first home-grown communication satellite into orbit\r\nTurkey launched its first domestically-produced communications satellite, Turksat 6A, into orbit early on Tuesday, in a move Ankara said would widen the country\'s satellite coverage and meet its television broadcasting needs. A SpaceX Falcon 9 rocket carried the satellite into space from Space Launch Complex 40 (SLC-40) at Cape Canaveral Space Force Station in Florida, United States. Turkish President Tayyip Erdogan said the launch marked the opening of a \"new phase\" for Turkey in satellite production.\r\n\r\na day ago\r\n\r\nAd\r\n•\r\nOutbyte Driver Updater\r\n\r\nAd\r\nMost Computer Owners Don\'t Know This. Do It Today!\r\nThis Could Be the Most Important Tip You Read This Year\r\n\r\n\r\nZacks\r\nNokia (NOK) Teams Up With GFiber for 50G PON Speeds Trial\r\nNokia (NOK) and Google Fiber join forces to carry out the first-ever trial of 50G PON technology in the United States.\r\n\r\n17 hours ago\r\n\r\nBarrons.com\r\nThe New Laptops Are Here, and They Don’t Have Intel or AMD Inside\r\nThe CoPilot+ laptops shown in May at Microsoft artificial-intelligence rollout are now on store shelves. CoPilot+ laptops can be had for $1,000 and up, from a variety of manufacturers that include Microsoft, Dell Technologies HP Acer, Asus, Lenovo, and Samsung They have been publicized for their hardware chip that accelerates AI-applications like Microsoft’s CoPilot, but until AI apps come into widespread use, they’ll be more prized for their long battery lives. The main processor in all these laptops is the Snapdragon X Elite, which is a team effort.\r\n\r\n8 hours ago\r\n\r\nDigital Spy\r\nThe CMF Buds Pro 2 are among the best budget buds\r\nI\'ve been testing CMF by Nothing\'s new budget noise-cancelling buds, for just £59. These tiny earphones are surprisingly capable for the low price.\r\n\r\n2 days ago\r\n\r\nAd\r\n•\r\nLocal Plan\r\n\r\nAd\r\nA New SUV for Seniors in Malaysia Is Cheaper Than You...\r\n\r\nThe Guardian\r\nSurface Pro 11 review: Microsoft’s big Arm leap almost pays off\r\nDumping Intel for Qualcomm chips delivers big boost in speed but not battery life and breaks some apps\r\n\r\na day ago\r\n\r\nReuters\r\nMicrosoft to offer Apple devices to employees in China, cites absence of Android services\r\nMicrosoft has been under increased scrutiny after a series of security breaches, the latest being that of Russian hackers who spied and accessed emails of the company\'s employees and customers earlier this year. The development was first reported by Bloomberg News, which, citing an internal memo, said the Windows OS-maker instructed its employees in China to use Apple devices at workplace from September.\r\n\r\na day ago\r\n\r\nTechCrunch\r\nApple removes VPN apps at request of Russian authorities, say app makers\r\nApple has removed several VPN apps from its App Store in Russia at the request of the government’s communications watchdog, according to VPN makers. Last week, Russian news agency Interfax reported that Apple had removed 25 VPN apps from its App Store in Russia after Roskomnadzor, a government body that regulates the internet — including what Russians can access — demanded the removals.\r\n\r\na day ago\r\n\r\nAd\r\n•\r\nJRFX\r\n\r\nAd\r\nOnly $1: Dive into Trading Options\r\nSimple 3-step registration. Low investment, high versatility. Start your investment journey with as little as $1.\r\n\r\n\r\nFuturism\r\nAfter Just Ten Months, Amazon Says Its \"Security Guard\" Robot Will Become a Useless Brick\r\nBusiness Decision Despite being out for less than a year, Amazon has announced that its Astro patrol robot for small and medium businesses will be bricked at the end of August. First reported by GeekWire, this sad news for business robotics enthusiasts comes from a leaked internal email to Amazon employees about the $2,350 security guard […]\r\n\r\na day ago\r\n\r\nThe Independent\r\nWoman, 61, arrested after ‘dousing man in gasoline and lighting him on fire’ then throwing Molotov cocktails\r\nThe 25-year-old victim died on June 25\r\n\r\n6 hours ago\r\n\r\nThe Independent\r\nShe was forced to have sex with 8 men a day: Victims reveal the horrors of sex trafficking at more than 100 hotels\r\nINVESTIGATION: Sex trafficking survivors say the hotel chain ignored obvious signs that they were being trafficked to protect its profits. The company is set to face hundreds of lawsuits across the country, write Richard Hall and Alicja Hagopian\r\n\r\n2 days ago\r\n\r\nAd\r\n•\r\nHealthyLife\r\n\r\nAd\r\nPeople with knee and hip pain need to read this\r\n\r\nThe Independent\r\nThai police investigating Chinese couple for having sex in car park at tourism hotspot\r\nAuthorities are pursuing tourist couple for violating public decency laws\r\n\r\n16 hours ago\r\n\r\nMoneySmart\r\nWedding Ang Bao Rates in Singapore 2024—How Much Should You Give?\r\nWedding dinners in Singapore can sometimes be a mercenary affair. Don’t be fooled into thinking that wedding ang baos (red packets) are purely a gift from the heart. In Singapore,... The post Wedding Ang Bao Rates in Singapore 2024—How Much Should You Give? appeared first on MoneySmart Blog.\r\n\r\n2 days ago\r\n\r\nWWD\r\nKylie Jenner Debuts Her Khy Clothing Line’s Bikinis, One-pieces and More for First Swimwear Collection Campaign\r\nKhy unveiled its eighth drop and debut swimwear collection which will be available on Thursday.\r\n\r\na day ago\r\n', '2024-07-10 01:51:24', '', 19, NULL, NULL),
(11, 'Digital gold vs Physical gold', 'Recently TNG has come up with their version through their launch of e-MAS platform. What do you guys think about this platform? What\'s the difference between physical Gold and digital gold? Digital has taken the bad rep due to its unavailability to posses the actual asset.\r\n\r\nBut yet there are many platforms offering this form of investment for those looking to add into their portfolio.\r\n\r\nWill appreciate your thoughts on this.', '2024-07-10 02:28:42', '', 27, NULL, NULL),
(12, '', 'some kind of snake has crawled into my home', '2024-07-11 23:48:39', 'uploads/seating plan.jpg', 15, NULL, NULL),
(13, 'exercise', 'aahahhahah', '2024-07-12 03:00:49', '', 23, 'q', NULL),
(14, ' Research: Pipu sleep early are bodoh', 'Researchers led by academics at Imperial College London studied data from the UK Biobank study on more than 26,000 people who had completed intelligence, reasoning, reaction time and memory tests.\r\n\r\nThey then examined how participants’ sleep duration, quality, and chronotype (which determines what time of day we feel most alert and productive) affected brain performance.\r\n\r\nThey found that those who stay up late and those classed as “intermediate” had “superior cognitive function”, while morning larks had the lowest scores.', '2024-07-12 03:12:45', '', 34, 'gay', NULL),
(15, ' Research: Pipu sleep early are bodoh', 'qeqeqeqe', '2024-07-12 03:20:48', '', 9, 'kelvin', NULL),
(16, 'Remembering MH17 ten years on', 'KUALA LUMPUR: It has been a decade since the downing of Malaysia Airlines flight MH17 in 2014, which took the lives of all 298 people on board, including 80 children.\r\n\r\nAs a tribute to the innocent souls that perished in the devastating tragedy, the 10th commemoration will be held on July 17 at the National Monument MH17 at Vijfhuizen Park near Amsterdam\'s Schiphol Airport, according to the Netherlands embassy in Malaysia.\r\n\r\n\"Apart from the next-of-kin, almost 1,500 people from across the world will gather for the ceremony. The pain of their (victims) passing is still felt intensely today, by their families and friends all over the world.\r\n\r\n\"As we approach ten years since this tragedy, Australia, Belgium, Malaysia, the Netherlands and Ukraine wish to underline that we remain steadfast in our commitment to achieving truth, justice and accountability for the victims of the downing of flight MH17 and their next-of-kin.\r\n\r\n\"Those who have been left behind deserve closure. They need to know that everything that can be done has been done to prevent these tragedies from happening in the future,” the embassy embassy said in a statement Friday (July 12).\r\n\r\nOn July 17, 2014, MH17 was downed by a BUK missile while flying over the conflict-hit eastern Ukraine, and everybody on board was killed.\r\n\r\nThe victims came from 17 countries and included 198 Dutch nationals, 43 Malaysians, 38 Australians, and 10 from the United Kingdom.\r\n\r\nFollowing the horrific incident, on Nov 17, 2022, the Hague District Court convicted in absentia two Russians and a Ukrainian to life imprisonment after finding them guilty on charges of causing the downing of MH17 and the murders of all 298 people on board.\r\n\r\nThey are Russians Igor Girkin and Sergei Dubinsky and Ukrainian citizen Leonid Kharchenko. However, the court acquitted another Russian, Oleg Pulatov, of the same charges.\r\n\r\nThe court also ordered the three men to pay more than €16mil (RM80.9mil) in compensation to the relatives of the victims. – Bernama\r\n\r\nhttps://www.thestar.com.my/news/nation/2024...UJB5xQ70emtlMXw', '2024-07-12 03:25:53', '', 25, 'kelvin', NULL),
(17, 'kuchig', '12313', '2024-07-14 00:50:08', '', 6, 'q', NULL),
(18, 'test picture', 'nihao', '2024-07-15 00:52:48', 'image/project logo.png', 7, 'q', NULL),
(19, 'Borrow money from family or friends', 'This is a rant, if you someone who had borrowed money from you family or friend. Just pay them back if you already got money.\r\n\r\nWtf kind of mindset, eating large, go on holiday and post it on social media while you still owe money to someone.\r\n\r\nIf you can\'t pay the full amount, just pay installment, 50/ month is better than just hopping you friend forget about the money they lend you.\r\n\r\nCan you imagine got someone who borrowed your money, then act like they forget for months, never contact your for months, then suddenly get whatapp, thinking they gonna pay, but instead asking for MORE.', '2024-07-15 01:52:40', 'image/Screenshot 2023-05-19 155658.png', 179, 'q', NULL),
(20, 'My tenant refuse to move out. and has a lot of furniture inside the house. [ please advise if wrong section]', 'so my tenant didnt pay rent for 3month, i tried chasing him out but to not avail, then i cut the water, i tried asking him to move out, he finally decided to move out, then he leave so many furnished inside, and now he delayed in passing the keys to me.\r\n\r\nHow ya?\r\n\r\nwhich court should i go to? i wanna cut his lock.', '2024-07-15 02:59:35', 'image/2023-05-17 (8).png', 200, 'kelvin', NULL),
(21, 'nihao', 'test 1', '2024-07-17 00:42:50', 'image/download (1).jpeg', 202, 'jacky', 'image/avatars/download (1).jpeg'),
(22, 'Celebration Hari Raya 2024', 'Selamat Hari Raya🌙 \r\n\r\nSRC will organise Celebration Hari Raya 2024 on 24/4/2024 ( Wednesday). All lecturers and students are invited to join our celebration Hari Raya!\r\n\r\n\r\n\r\nThrough Celebration Hari Raya, we can learn about Malay traditional culture, Kuih-raya, traditional games and much more! 🥳Everyone can invite your friends to come along, and it was free entry!\r\n\r\n\r\n\r\nDetail of Celebration Hari Raya🌙\r\n\r\nDate: 24th April 2924 (Wednesday)\r\n\r\nTime: 9:30a.m.-11:30a.m.\r\n\r\nVenue: Main Building\r\n\r\nActivity: Batik painting, Batu serembam, Kuih \r\n\r\n-raya, Congkak and more!\r\n\r\n\r\n\r\nℹ️For more information, please visit our Instagram page: @mdismsrc_', '2024-07-17 02:44:54', 'image/Poster hari raya.pdf', 387, 'Lee', 'image/avatars/WhatsApp Image 2024-07-02 at 15.11.15_a68f12c7.jpg'),
(23, 'SPM 2023 Results Megathread (Check pinned comment for a list of 50 Nyets who have volunteered to answer any career enquiries regarding different fields/areas)', 'This thread is for all SPM related discussions, may it be results, universities, courses etc. The intention is to help school leavers talk about the SPM in one central spot on the subreddit.\r\n\r\nFor both public school and private SPM candidates, you can check your results online at myresultspm.moe.gov.my or retrieve via SMS by sending SPM < space> IC number <space> Examination number (Angka giliran) to 15888. Example: SPM 000527031234 WY189A123\r\n\r\nMental health resources\r\n\r\nIf you are feeling intense emotional distress and need someone to talk to, please call (a) the Befrienders Suicide Hotline at +603-79568145, (b) Talian Kasih at 15999 any time 24/7, or (c) the Buddy Bear Childline at 1800-18-BEAR (2327) if you’re under 18\r\n\r\nMore mental health resources\r\n\r\nLinks to relevant post-SPM posts\r\n\r\nWhy aren\'t there many SPM graduates enrolling in government politeknik or TVET?\r\n\r\nA Discussion on Should You Take a Degree\r\n\r\nAlmost done with STPM and here\'s my experience if anyone is interested in it\r\n\r\nI feel completely hopeless after secondary school\r\n\r\nIt\'s been almost 2 years since I got straight As for SPM\r\n\r\nMore posts\r\n\r\nFor young Nyets who are interested in TVET (Pendidikan Teknikal Dan Latihan Vokasional):\r\n\r\nApply to TVET courses (Pendidikan dan Latihan Teknikal dan Vokasional) offered by 7 different ministries and over 15,000 spots through https://mohon.tvet.gov.my/\r\n\r\nSkills For Life programme by Youth and Sports Ministry that offers basic skills training to local youth through short-term courses. Registration link\r\n\r\nApply to SKM (Sijil Kemahiran Malaysia) courses. Check out Group SKM on Facebook for opportunities\r\n\r\nProgram Latihan Kompetensi Kemahiran Belia - sponsored fully by CIDB (Construction Industry Development Board) in 6 campuses; Kedah, KL, Johor, Terengganu, Sabah and Sarawak\r\n\r\nEducation Fair Dates\r\n\r\nTheStar Education Fair in Penang, KL and Putrajaya\r\n\r\nStudyMalaysia Education Fair in Sabah and Sarawak - (22-23 June and 29-30 June)\r\n\r\nSureWorks Education and Further Studies Fair in KL and Johor\r\n\r\nJelajah Jom Masuk U\r\n\r\nFree courses to explore new/existing interest:\r\n\r\nNational Training Week (NTW) 2024 from 24 – 30 June, when up to 150,000 free training courses covering essential life skills, future readiness, creativity, financial literacy, and sustainable development\r\n\r\ne-Latih - free e-Learning platform for Malaysians with over 1800+ courses\r\n\r\nFree digital tech training by MDEC\r\n\r\n42KL - Learn to code for free (F2F classes)\r\n\r\nFreeCodeCamp - Learn to code for free\r\n\r\nEdX (choose free audit track)\r\n\r\nCoursera\r\n\r\nVolunteering/internship after SPM:\r\n\r\nKechara Soup Kitchen [Link]\r\n\r\nSPCA Selangor Link\r\n\r\nMNS (Persatuan Pencinta Alam Malaysia) [Link]\r\n\r\nWWF Malaysia Link\r\n\r\nMyKasih Link\r\n\r\nFree Tree Society Link\r\n\r\nAIESEC Link\r\n\r\nGeneral Scholarship info links\r\n\r\nTelegram channel for a list of scholarships, constantly updated\r\n\r\nTelegram channel for any questions regarding UPU, matriculation, STPM,asasi\r\n\r\nAfterschool.my\r\n\r\nInternational Scholarships for Malaysians\r\n\r\nFB Group: Biasiswa Dalam dan Luar Negara (for undergraduates, Masters/Postgrad and PhD)\r\n\r\nFully Sponsored Overseas Scholarships\r\n\r\nYayasan Khazanah Scholarships\r\n\r\nASEAN Scholarship for Malaysians\r\n\r\nSHELL Scholarship\r\n\r\nHungarian Government Fully-funded Scholarships for Bachelor\'s, Masters and PhD. Malaysia is one of the partners\r\n\r\nGovernment of Japan Scholarships\r\n\r\nStudying in Egypt and Jordan Scholarships\r\n\r\nThe Belt and Road Scholarship (Study in Macao)\r\n\r\nIndian Council for Cultural Relations Scholarship - 3 slots for Malaysians\r\n\r\nGlobal Korean Scholarship\r\n\r\nThe Kingdom of Saudi Arabia Scholarships\r\n\r\nCIMB ASEAN Scholarship\r\n\r\nDAAD Malaysia: German Academic Exchange Service\r\n\r\nMOE Taiwan Scholarships', '2024-07-17 03:53:06', 'image/download (1).jpeg', 60, 'Lee', 'image/avatars/WhatsApp Image 2024-07-02 at 15.11.15_a68f12c7.jpg'),
(24, 'trst', 'This thread is for all SPM related discussions, may it be results, universities, courses etc. The intention is to help school leavers talk about the SPM in one central spot on the subreddit.\r\n\r\nFor both public school and private SPM candidates, you can check your results online at myresultspm.moe.gov.my or retrieve via SMS by sending SPM < space> IC number <space> Examination number (Angka giliran) to 15888. Example: SPM 000527031234 WY189A123\r\n\r\nMental health resources\r\n\r\nIf you are feeling intense emotional distress and need someone to talk to, please call (a) the Befrienders Suicide Hotline at +603-79568145, (b) Talian Kasih at 15999 any time 24/7, or (c) the Buddy Bear Childline at 1800-18-BEAR (2327) if you’re under 18\r\n\r\nMore mental health resources\r\n\r\nLinks to relevant post-SPM posts\r\n\r\nWhy aren\'t there many SPM graduates enrolling in government politeknik or TVET?\r\n\r\nA Discussion on Should You Take a Degree\r\n\r\nAlmost done with STPM and here\'s my experience if anyone is interested in it\r\n\r\nI feel completely hopeless after secondary school\r\n\r\nIt\'s been almost 2 years since I got straight As for SPM\r\n\r\nMore posts\r\n\r\nFor young Nyets who are interested in TVET (Pendidikan Teknikal Dan Latihan Vokasional):\r\n\r\nApply to TVET courses (Pendidikan dan Latihan Teknikal dan Vokasional) offered by 7 different ministries and over 15,000 spots through https://mohon.tvet.gov.my/\r\n\r\nSkills For Life programme by Youth and Sports Ministry that offers basic skills training to local youth through short-term courses. Registration link\r\n\r\nApply to SKM (Sijil Kemahiran Malaysia) courses. Check out Group SKM on Facebook for opportunities\r\n\r\nProgram Latihan Kompetensi Kemahiran Belia - sponsored fully by CIDB (Construction Industry Development Board) in 6 campuses; Kedah, KL, Johor, Terengganu, Sabah and Sarawak\r\n\r\nEducation Fair Dates\r\n\r\nTheStar Education Fair in Penang, KL and Putrajaya\r\n\r\nStudyMalaysia Education Fair in Sabah and Sarawak - (22-23 June and 29-30 June)\r\n\r\nSureWorks Education and Further Studies Fair in KL and Johor\r\n\r\nJelajah Jom Masuk U\r\n\r\nFree courses to explore new/existing interest:\r\n\r\nNational Training Week (NTW) 2024 from 24 – 30 June, when up to 150,000 free training courses covering essential life skills, future readiness, creativity, financial literacy, and sustainable development\r\n\r\ne-Latih - free e-Learning platform for Malaysians with over 1800+ courses\r\n\r\nFree digital tech training by MDEC\r\n\r\n42KL - Learn to code for free (F2F classes)\r\n\r\nFreeCodeCamp - Learn to code for free\r\n\r\nEdX (choose free audit track)\r\n\r\nCoursera\r\n\r\nVolunteering/internship after SPM:\r\n\r\nKechara Soup Kitchen [Link]\r\n\r\nSPCA Selangor Link\r\n\r\nMNS (Persatuan Pencinta Alam Malaysia) [Link]\r\n\r\nWWF Malaysia Link\r\n\r\nMyKasih Link\r\n\r\nFree Tree Society Link\r\n\r\nAIESEC Link\r\n\r\nGeneral Scholarship info links\r\n\r\nTelegram channel for a list of scholarships, constantly updated\r\n\r\nTelegram channel for any questions regarding UPU, matriculation, STPM,asasi\r\n\r\nAfterschool.my\r\n\r\nInternational Scholarships for Malaysians\r\n\r\nFB Group: Biasiswa Dalam dan Luar Negara (for undergraduates, Masters/Postgrad and PhD)\r\n\r\nFully Sponsored Overseas Scholarships\r\n\r\nYayasan Khazanah Scholarships\r\n\r\nASEAN Scholarship for Malaysians\r\n\r\nSHELL Scholarship\r\n\r\nHungarian Government Fully-funded Scholarships for Bachelor\'s, Masters and PhD. Malaysia is one of the partners\r\n\r\nGovernment of Japan Scholarships\r\n\r\nStudying in Egypt and Jordan Scholarships\r\n\r\nThe Belt and Road Scholarship (Study in Macao)\r\n\r\nIndian Council for Cultural Relations Scholarship - 3 slots for Malaysians\r\n\r\nGlobal Korean Scholarship\r\n\r\nThe Kingdom of Saudi Arabia Scholarships\r\n\r\nCIMB ASEAN Scholarship\r\n\r\nDAAD Malaysia: German Academic Exchange Service\r\n\r\nMOE Taiwan Scholarships', '2024-07-17 03:59:26', '', 70, 'Lee', 'image/avatars/WhatsApp Image 2024-07-02 at 15.11.15_a68f12c7.jpg'),
(25, 'adadad', 'adadadadadad', '2024-07-17 04:04:14', '', 98, 'Lee', 'image/avatars/WhatsApp Image 2024-07-02 at 15.11.15_a68f12c7.jpg'),
(26, 'q', 'a', '2024-07-18 05:09:14', '', 49, 'Lee', 'image/avatars/WhatsApp Image 2024-07-02 at 15.11.15_a68f12c7.jpg'),
(27, 'ada', 'dadad', '2024-07-18 08:06:01', 'image/download (1).jpeg', 1, 'Lee', 'image/avatars/WhatsApp Image 2024-07-02 at 15.11.15_a68f12c7.jpg'),
(28, 'aa', 'aaa', '2024-07-18 08:22:44', 'image/download (1).jpeg', 12, 'Lee', 'image/avatars/WhatsApp Image 2024-07-02 at 15.11.15_a68f12c7.jpg'),
(29, '跟男友看minion看到差点分手😇', '最近不是上映了despicable me 4嘛\r\nminion对我来说是我的童年\r\n123我以前都看过了 自然不想错过4啊\r\n\r\n昨天就跟男友说要看minion\r\n因为担心很多人看买不到很好的位子\r\n所以我早早就订了两个人的电影票\r\n他当下听了一脸不爽\r\n说我为什么没有问过他要不要看就订票\r\n我解释原因他也不接受\r\n还讲我几岁人了还这么幼稚看cartoon\r\n说minion是小孩子才看的blablabla\r\n\r\n我当下有点不开心\r\n但我想说出来约会就不要搞到不开心就没说什么\r\n那天看完后他全程不说话脸很臭\r\n平常都会吃宵夜但他这次直接开车回家\r\n当时我真的火都来了直接说他这样真的很扫兴\r\n想当然他也是骂回我 然后我们就因为这件事大吵\r\n过后我们就一直冷战到现在\r\n\r\n看电影的票钱是我出的\r\n这个系列的电影是我的童年\r\n我就不明白为什么他就不能陪我看\r\n看完了还要摆一副臭脸在那边真的很讨厌\r\n这种男友是不是可以放生了🙃', '2024-07-18 09:07:37', 'image/download (1).jpeg', 76, 'Lee', 'image/avatars/WhatsApp Image 2024-07-02 at 15.11.15_a68f12c7.jpg'),
(30, 'Group Assignment / Project 很迷茫', '每次到了 group assignment / project 的环节时， 朋友变成了陌生人。我永远都是落单的那位。从diploma至今。我从不划水也不是freerider，都有把份内的工作做完。但是为什幺却永远找不到固定的projectmate？ 身边的人都有固定的projectmate，搞小团体。不管是做什幺都是在一起。好羡慕他们。我该怎幺办？ 一个sem换一批projectmate，不想再换了。我甚至也萌生休学的想法了。', '2024-07-18 09:26:10', 'image/Screenshot 2023-05-19 155658.png', 13, 'Lee', 'image/avatars/WhatsApp Image 2024-07-02 at 15.11.15_a68f12c7.jpg'),
(31, 'dadad', 'dadadadadadadadaaaaaaaaa100000000sssssssssssssssssssssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadadadadadadadadaaaaaaaaa100000000sssssssssssssssssssssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadadadadadadadadaaaaaaaaa100000000sssssssssssssssssssssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadadadadadadadadaaaaaaaaa100000000sssssssssssssssssssssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadadadadadadadadaaaaaaaaa100000000sssssssssssssssssssssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadadadadadadadadaaaaaaaaa100000000sssssssssssssssssssssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadadadadadadadadaaaaaaaaa100000000sssssssssssssssssssssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadadadadadadadadaaaaaaaaa100000000sssssssssssssssssssssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadadadadadadadadaaaaaaaaa100000000sssssssssssssssssssssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadadadadadadadadaaaaaaaaa100000000sssssssssssssssssssssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadadadadadadadadaaaaaaaaa100000000sssssssssssssssssssssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadadadadadadadadaaaaaaaaa100000000sssssssssssssssssssssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadadadadadadadadaaaaaaaaa100000000sssssssssssssssssssssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadadadadadadadadaaaaaaaaa100000000sssssssssssssssssssssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadadadadadadadadaaaaaaaaa100000000sssssssssssssssssssssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadadadadadadadadaaaaaaaaa100000000sssssssssssssssssssssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadadadadadadadadaaaaaaaaa100000000sssssssssssssssssssssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadadadadadadadadaaaaaaaaa100000000sssssssssssssssssssssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadadadadadadadadaaaaaaaaa100000000sssssssssssssssssssssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadadadadadadadadaaaaaaaaa100000000sssssssssssssssssssssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadadadadadadadadaaaaaaaaa100000000sssssssssssssssssssssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '2024-07-18 09:33:26', '', 2, 'Lee', 'image/avatars/WhatsApp Image 2024-07-02 at 15.11.15_a68f12c7.jpg'),
(32, 'dad', 'add ada a a a a  a da da  ad aa a da dad a ad ad ad a dad ad\r\nda\r\nd a\r\nda\r\n da\r\nd\r\nad\r\nad\r\na\r\ndDcard\r\nSearch in MY_Learning forum\r\n\r\nMY_Learning\r\nMY_Learning\r\nMY_Learning\r\n\r\nTrending\r\nLatest\r\nRule\r\nMonash University Malaysia\r\n4h\r\n\r\n想买平板 不知道哪一个比较好\r\niPad\r\niPad Air\r\nIPad Pro\r\niPad mini\r\n20 votes・19 hours 24 minutes remaining\r\nLike\r\n22\r\nComment\r\nSave\r\n\r\n\r\nHeriot-Watt University Malaysia\r\n10h\r\n\r\n有没有heriot watt 的学生玩这个？\r\n看到好多taruc的而已\r\nLike\r\n22\r\n2\r\nSave\r\nR\r\nanonymous\r\n2d\r\n\r\nutm space是政府还是私人的？\r\n大家好，因为我弟弟即将去UTM kl branch上课。所以想请教大家UTM space是政府还是私人的吗？只是纯粹想知道\r\nLike\r\n17\r\n10\r\nSave\r\nTAR UMT\r\n2d\r\n\r\n想问问\r\n一个subject可以缺席多少次 for那些有practical的subject🥹\r\nLike\r\n17\r\nComment\r\nSave\r\nB\r\n...\r\n2d\r\n\r\n感觉自己是一个吸血虫\r\n我一直都知道我自己的起点是很高的，我出生在一个很富裕的家庭，我目前在澳大利亚留学就读business management。我现在21岁了 我想要在澳洲找part time 但是我的英语能力不是很好，\r\nLike\r\n60\r\n27\r\n1\r\nTAR UMT\r\n3d\r\n\r\n吉他牌子\r\n这里的音乐店通常会不会有卖farida还是ibanez的牌子\r\nLike\r\n24\r\nComment\r\nSave\r\nMultimedia University\r\n4d\r\n\r\nGPA & CGPA\r\n我的gpa ＆ cgpa的分数从未有过3.5以上。diploma的cgpa 2.98分上degree。上了degree第一个sem不幸挂了一科，但是gpa也保持在2.00以上。感觉到自己的成绩高不成低\r\nLike\r\n20\r\nComment\r\nSave\r\nMY_Learning\r\nMY_Learning\r\n13 new posts weekly\r\nBe a better version of yourself! Any learning tips or insights, including languages, music, sports, handcrafts, time management and etc... can be shared and discussed here! Dcard rules: https://www.dcard.tw/f/my_official/p/253958488\r\nTerms of service\r\nHelp Center\r\nHiring\r\nTraditional Chinese converted to Simplified Chinese\r\nMY_Learning\r\nMY_Learning\r\n\r\nGroup Assignment / Project 很迷茫\r\nMultimedia University\r\n9/7 21:51 (edited)\r\n每次到了 group assignment / project 的环节时， 朋友变成了陌生人。我永远都是落单的那位。从diploma至今。我从不划水也不是freerider，都有把份内的工作做完。但是为什幺却永远找不到固定的projectmate？ 身边的人都有固定的projectmate，搞小团体。不管是做什幺都是在一起。好羡慕他们。我该怎幺办？ 一个sem换一批projectmate，不想再换了。我甚至也萌生休学的想法了。\r\n大学生\r\n生活\r\nLike\r\n17\r\n1\r\n\r\n\r\n\r\nMY_Learning\r\nMore posts from MY_Learning\r\n不想在这家公司工作了怎么办\r\n25 reactions・5 comments\r\nInternship\r\n16 reactions・3 comments\r\n注重assignment好还是midterm\r\n10 reactions・3 comments\r\n我班\r\n13 reactions・2 comments\r\npresentation 主隊友like shit ！\r\n36 reactions・4 comments\r\nassignment 好难\r\n54 reactions・23 comments\r\n1 comments\r\nAsia Pacific University\r\n\r\n0\r\n\r\n\r\n我理解你的感受\r\nB114/7 15:06\r\nReply\r\n\r\n\r\n\r\n\r\nMY_Learning forum | Dcard\r\nad\r\n', '2024-07-18 09:39:28', 'image/Poster hari raya.pdf', 3, 'Lee', 'image/avatars/WhatsApp Image 2024-07-02 at 15.11.15_a68f12c7.jpg'),
(33, 'dad', 'dadada ddocument.addEventListener(\'DOMContentLoaded\', function() {\r\n    const contentInput = document.getElementById(\'content\');\r\n    const wordCount = document.getElementById(\'wordCount\');\r\n    const warningMessage = document.getElementById(\'warningMessage\');\r\n    const createSubmitBtn = document.getElementById(\'createSubmitBtn\'); // Add this line\r\n\r\n    contentInput.addEventListener(\'input\', function() {\r\n        const content = this.value;\r\n        const length = content.length;\r\n        wordCount.textContent = length + \' / 1000 characters\';\r\n\r\n        // Check if exceeds limit and show warning\r\n        if (length > 1000) {\r\n            wordCount.style.color = \'red\'; // Change color to indicate exceeding limit\r\n            warningMessage.style.display = \'block\';\r\n            createSubmitBtn.disabled = true; // Disable submit button\r\n        } else {\r\n            wordCount.style.color = \'#666\'; // Reset color if within limit\r\n            warningMessage.style.display = \'none\';\r\n            createSubmitBtn.disabled = false; // Enable submit button\r\n        }\r\n    });\r\n});', '2024-07-18 09:41:17', '', 5, 'Lee', 'image/avatars/WhatsApp Image 2024-07-02 at 15.11.15_a68f12c7.jpg'),
(34, 'dadad', '1', '2024-07-18 09:43:42', '', 15, 'Lee', 'image/avatars/WhatsApp Image 2024-07-02 at 15.11.15_a68f12c7.jpg'),
(35, 'test2', 'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq\r\nq\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nqqqqqqqqqqqqqqqqqqqqqqqqqq', '2024-07-20 08:36:48', 'image/IMG_2844.jpg', 249, 'Lee', 'image/avatars/WhatsApp Image 2024-07-02 at 15.11.15_a68f12c7.jpg'),
(36, 'tt', 'aa', '2024-07-21 00:48:23', '', 9, 'jacky', 'image/avatars/download (1).jpeg'),
(37, 'dada', 'dada', '2024-07-21 00:52:58', '', 27, 'jacky', 'image/avatars/download (1).jpeg'),
(38, 'adad', 'adad', '2024-07-21 01:08:39', '', 23, 'Lee', 'image/avatars/WhatsApp Image 2024-07-02 at 15.11.15_a68f12c7.jpg'),
(39, '\"Neothaicivilization: The Adventure\" Taper-Fit Heavy Cotton Long Sleeve Tee Mint', 'qq', '2024-07-21 01:11:34', 'image/bronze-medal.png', 349, 'Lee', 'image/avatars/WhatsApp Image 2024-07-02 at 15.11.15_a68f12c7.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `discussion_tags`
--

CREATE TABLE `discussion_tags` (
  `id` int(11) NOT NULL,
  `discussion_id` int(11) NOT NULL,
  `tag` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `discussion_tags`
--

INSERT INTO `discussion_tags` (`id`, `discussion_id`, `tag`) VALUES
(1, 27, 'PROPERTY MANAGEMENT'),
(2, 27, 'HOSTEL MANAGEMENT'),
(3, 27, 'QUALITY MANAGEMENT'),
(4, 27, 'student-discussions'),
(5, 27, 'academic-support'),
(6, 28, 'acfac'),
(7, 28, 'z'),
(8, 29, 'general'),
(9, 29, 'dtm'),
(10, 29, 'love'),
(11, 30, 'dia'),
(12, 30, 'dbm'),
(13, 30, 'dmc'),
(14, 30, 'dtm'),
(15, 30, 'adad'),
(16, 31, 'general'),
(17, 31, 'dia'),
(18, 31, 'dbm'),
(19, 32, 'dia'),
(20, 33, 'dad'),
(21, 34, 'DIB'),
(22, 35, 'general'),
(23, 35, 'dia'),
(24, 35, 'dbm'),
(25, 35, 'dim'),
(26, 36, 'general'),
(27, 37, 'DIB'),
(28, 38, 'ditdm'),
(29, 39, 'aaa');

-- --------------------------------------------------------

--
-- Table structure for table `replies`
--

CREATE TABLE `replies` (
  `id` int(11) NOT NULL,
  `parent_comment_id` int(11) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `parent_reply_id` int(11) DEFAULT NULL,
  `avatar_url` varchar(255) DEFAULT NULL,
  `replies_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `replies`
--

INSERT INTO `replies` (`id`, `parent_comment_id`, `content`, `author`, `parent_reply_id`, `avatar_url`, `replies_at`) VALUES
(1, 86, 'dd', 'Lee', NULL, NULL, '2024-07-21 06:25:41'),
(2, 86, 'dadad', 'Lee', NULL, NULL, '2024-07-21 06:25:41'),
(3, 86, 'adad', 'Lee', NULL, NULL, '2024-07-21 06:25:41'),
(4, 86, 'dadad', 'Lee', NULL, NULL, '2024-07-21 06:25:41'),
(5, 87, 'dadad', 'Lee', NULL, NULL, '2024-07-21 06:25:41'),
(6, 87, 'adad', 'Lee', NULL, NULL, '2024-07-21 06:25:41'),
(7, 89, 'dad', 'Lee', NULL, NULL, '2024-07-21 06:25:41'),
(8, 100, 'dad', 'Lee', NULL, NULL, '2024-07-21 06:25:41'),
(9, 100, 'dad', 'Lee', 8, NULL, '2024-07-21 06:25:41'),
(10, 100, 'dadad', 'Lee', 8, NULL, '2024-07-21 06:25:41'),
(11, 100, 'dad', 'Lee', 10, NULL, '2024-07-21 06:25:41'),
(12, 100, 'really?\r\n', 'jacky', 11, NULL, '2024-07-21 06:25:41'),
(13, 100, 'ada', 'Lee', 8, NULL, '2024-07-21 06:25:41'),
(14, 100, 'adad', 'Lee', NULL, NULL, '2024-07-21 06:25:41'),
(15, 101, '你才sohai', 'Lee', NULL, NULL, '2024-07-21 06:25:41'),
(16, 102, 'dd', 'Lee', NULL, NULL, '2024-07-21 06:28:51'),
(17, 103, 'dad', 'Lee', NULL, NULL, '2024-07-21 06:32:30'),
(18, 104, 'ddd', 'Lee', NULL, NULL, '2024-07-21 06:34:45'),
(19, 104, 'tt', 'jacky', NULL, NULL, '2024-07-21 06:35:04'),
(20, 106, 'adad', 'jacky', NULL, NULL, '2024-07-21 06:52:51'),
(21, 108, 'dad', 'Lee', NULL, NULL, '2024-07-21 07:07:47'),
(22, 110, 'sophai', 'Lee', NULL, NULL, '2024-07-21 07:08:14'),
(23, 110, 'dad', 'Lee', NULL, NULL, '2024-07-21 07:08:24'),
(24, 112, 'qq', 'Lee', NULL, NULL, '2024-07-21 07:11:46'),
(25, 124, 'dadad', 'jacky', NULL, NULL, '2024-07-21 08:11:27'),
(26, 124, 'adad', 'jacky', 25, NULL, '2024-07-21 08:11:31'),
(27, 124, 'dadad', 'jacky', 26, NULL, '2024-07-21 08:11:33'),
(28, 124, 'dd', 'jacky', NULL, NULL, '2024-07-21 08:14:37'),
(29, 111, 'sohai', 'jacky', NULL, NULL, '2024-07-21 08:55:23'),
(30, 131, 'qqq', 'jacky', NULL, NULL, '2024-07-21 09:12:47'),
(31, 131, 'dd', 'Lee', NULL, NULL, '2024-07-21 12:40:48'),
(32, 0, 'ad', 'Lee', NULL, NULL, '2024-07-21 13:26:06'),
(33, 0, 'dad', 'Lee', NULL, NULL, '2024-07-21 13:26:08');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `gender` enum('MALE','FEMALE') NOT NULL,
  `age` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `country` varchar(50) NOT NULL,
  `user_type` varchar(50) NOT NULL,
  `program` varchar(100) NOT NULL,
  `department` varchar(50) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `avatar_url` varchar(255) DEFAULT NULL,
  `registration_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `nickname`, `user_id`, `gender`, `age`, `address`, `email`, `phone_number`, `country`, `user_type`, `program`, `department`, `password`, `avatar_url`, `registration_date`) VALUES
(17, 'jeffrey', 'jacky', '22/23S1-2543DIT', 'FEMALE', 20, '27,jalan nakhoho 2777', 'leeyong01162004@gmail.com', '011-11803223', 'UK', 'STAFF', 'CERTIFICATE IN ENGLISH LANGUAGE', 'FINANCE', '$2y$10$Q86.mhvxOgfiZGRcw6vk1OyJReGSKyES1SBFNwqeKpovcCS6KRTw6', 'image/avatars/download (1).jpeg', '2024-07-17 02:14:28'),
(18, 'Lee Cheng Yong', 'lee', '22/23S1-2343DIT', 'MALE', 20, '27,jalan nakhoda 29', 'leeyong01162004@gmail.com', '22/23S1-2343DIT', 'MY', 'STUDENT', 'DIT', '', '$2y$10$5a3qSU9aFOlHkpPCGtT8zew8CUKpsPRf3HE4RY4QsNDdNLwq6AEN2', 'image/avatars/WhatsApp Image 2024-07-02 at 15.11.15_a68f12c7.jpg', '2024-07-17 07:38:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discussion_id` (`discussion_id`);

--
-- Indexes for table `discussions`
--
ALTER TABLE `discussions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discussion_tags`
--
ALTER TABLE `discussion_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discussion_id` (`discussion_id`);

--
-- Indexes for table `replies`
--
ALTER TABLE `replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_comment_id` (`parent_comment_id`),
  ADD KEY `parent_reply_id` (`parent_reply_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT for table `discussions`
--
ALTER TABLE `discussions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `discussion_tags`
--
ALTER TABLE `discussion_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `replies`
--
ALTER TABLE `replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`discussion_id`) REFERENCES `discussions` (`id`);

--
-- Constraints for table `discussion_tags`
--
ALTER TABLE `discussion_tags`
  ADD CONSTRAINT `discussion_tags_ibfk_1` FOREIGN KEY (`discussion_id`) REFERENCES `discussions` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
