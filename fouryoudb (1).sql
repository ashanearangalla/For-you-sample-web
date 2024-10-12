-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 12, 2024 at 03:58 AM
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
-- Database: `fouryoudb`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `cat_added_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `cat_added_date`) VALUES
(1, 'Home Appliances', '2023-11-01 09:34:59'),
(2, 'Sanitary', '2023-11-04 18:24:37'),
(3, 'Education', '2023-11-04 18:25:05'),
(4, 'Electronics', '2023-11-04 18:25:39'),
(5, 'Energy Saving', '2023-11-04 18:26:03'),
(6, 'Fashion', '2023-11-04 18:26:26'),
(7, 'Entertainment', '2023-11-04 18:26:59'),
(8, 'Mobile Accessories', '2023-11-04 18:27:57'),
(9, 'Vehicle Accessories', '2023-11-04 18:28:24'),
(10, 'Air Conditioners', '2023-11-04 18:28:49'),
(11, 'Services', '2023-11-04 18:29:06');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_charges`
--

CREATE TABLE `delivery_charges` (
  `delivery_id` int(11) NOT NULL,
  `district` char(100) NOT NULL,
  `delivery_amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE `order_product` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_table`
--

CREATE TABLE `order_table` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `province` char(100) NOT NULL,
  `district` char(100) NOT NULL,
  `town` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `mobile_number_1` varchar(50) NOT NULL,
  `mobile_number_2` varchar(50) NOT NULL,
  `qty` int(11) NOT NULL,
  `sub_total` double NOT NULL,
  `shipping` double NOT NULL,
  `total` double NOT NULL,
  `payment_method` char(50) NOT NULL,
  `order_status` char(50) NOT NULL,
  `ordered_date` datetime NOT NULL DEFAULT current_timestamp(),
  `additional_info` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_table`
--

INSERT INTO `order_table` (`order_id`, `user_id`, `province`, `district`, `town`, `address`, `mobile_number_1`, `mobile_number_2`, `qty`, `sub_total`, `shipping`, `total`, `payment_method`, `order_status`, `ordered_date`, `additional_info`) VALUES
(1, 2, 'Western Province', 'Gampaha', 'Ja-ela', 'No 233,St Mary Road,\r\nKandana', '0772833133', '0772531311', 3, 32000, 250, 32250, 'Cash On Delivery', 'Processing', '2023-11-09 14:10:22', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `sub_category_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_description` text NOT NULL,
  `color` varchar(50) NOT NULL,
  `popular` char(10) NOT NULL DEFAULT 'No',
  `actual_price` double NOT NULL,
  `discount` double NOT NULL,
  `total_price` double NOT NULL,
  `in_stock` int(11) NOT NULL,
  `out_stock` int(11) NOT NULL,
  `remaining_stock` int(11) NOT NULL,
  `stock` varchar(50) NOT NULL,
  `added_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `sub_category_id`, `product_name`, `product_description`, `color`, `popular`, `actual_price`, `discount`, `total_price`, `in_stock`, `out_stock`, `remaining_stock`, `stock`, `added_date`) VALUES
(1, 1, 'Airpod Pro 2nd Gen', 'The H2-powered AirPods Pro now feature Adaptive Audio, 2 automatically prioritizing sounds that need your attention as you move through the world. By seamlessly blending Active Noise Cancellation with Transparency mode when you need it, Adaptive Audio magically delivers the right mix of sound for any environment.', 'White', 'Yes', 4400, 400, 4000, 10, 0, 10, 'In Stock', '2023-11-01 09:38:17'),
(2, 1, 'Beats Fit Pro', 'Beats Fit Pro supports Spatial Audio with dynamic head tracking for immersive music, movies, and games². Dynamic head tracking uses gyroscopes and accelerometers to adjust the sound as you turn your head, for a multi-dimensional experience that makes you feel like you\'re inside of it.', 'Blue', 'No', 57990, 7990, 50000, 10, 5, 5, 'In Stock', '2023-11-01 09:39:58'),
(3, 2, 'TK13 Mini Smartwatch', 'Device Name: Tk13 Mini\r\nType: Smartwatch\r\nDisplay: Amoled\r\nBattery: 1 Week\r\nGender: Ladies\r\nStarp: Ocean Band\r\nGift: Analogue Watch+ Ladies Bracelet\r\nThe Perfect Gift For Elegance And Functionality Looking For The Ideal Gift\r\nIt Comes Equipped With Advanced Health Monitoring Features, Including Heart Rate Tracking, Sleep Analysis, And Step Counting. With These Insights, She Can Make Informed Decisions About Her Health And Fitness Goals.', 'Pink', 'No', 10000, 1000, 9000, 10, 0, 10, 'In Stock', '2023-11-01 09:41:51'),
(4, 2, 'HK10 Pro Max Smartwatch', 'The HK10 Pro Max Smart Watch, brought to you by OpenAI, is a multifunctional and cutting-edge timepiece that boasts a wide array of features. Crafted with precision and designed for ultimate convenience, this smartwatch is a testament to innovation.\r\nEmbedded within the sleek and stylish exterior lies a multitude of functionalities, making it an ideal companion for tech enthusiasts and fitness aficionados alike. Seamlessly blending technology and fashion, the HK10 Pro Max Smart Watch sets new standards in the world of wearable gadgets.', 'Black', 'Yes', 10300, 500, 9800, 10, 6, 4, 'In Stock', '2023-11-01 09:43:38'),
(5, 3, 'Google Chromecast 3', 'Expand your home entertainment without buying a new TV; Google Chromecast [1] lets you stream your favorites from your phone, tablet, or laptop; no remote needed [2]\r\nChromecast is easy to set up up; just plug it in, connect to Wi-Fi, and start streaming [2] to turn your TV into a smart TV; it works with almost any TV that has an HDMI port\r\nWorks with the apps you already know and love; enjoy shows, movies, music, games, sports, photos, live TV, and more from over 2,000 streaming apps in up to 1080p [2,3]\r\nWith Chromecast, you can stream, pause, play, or adjust the volume right from your phone with just a tap; while you’re streaming, you can still use your phone as you normally do\r\nMirror your laptop screen or turn your tablet into an even better entertainment system; surf the web or see your media on the big screen [2,3]\r\nSee what’s happening at home; with Chromecast and the Google Home app [1], you can check your Nest cameras or Nest video doorbell [4] right from your couch\r\nChromecast supports most wireless networks with Wi-Fi 802.11ac (2.4GHz/5GHz)', 'Black', 'Yes', 3500, 200, 3300, 10, 0, 10, 'In Stock', '2023-11-01 09:47:12'),
(6, 5, 'USB Fast charge Type C Data sync Cable', 'High-quality copper wire maximizes signal quality and increases durability. Sync and Charge at fast speeds on your devices. Our technology teams make thousands of tests to ensure 100% safety for your device.\r\nHigh-quality PVC The cable uses a pure copper core design to ensure high quality and support 3A high current charging. With a tested 5000+ bend lifespan,the cables is more durable,wear-resistant and pull-resistant. \r\n\r\nMaterial: PVC\r\nStyle:Charging Cable\r\nColor:White\r\nCurrent: 3A\r\nLength: 1m\r\nFunction: Charging+Data Transmission\r\nCompatible:For Type-cdevice', 'White', 'Yes', 1000, 520, 480, 10, 0, 10, 'In Stock', '2023-11-07 11:25:03'),
(7, 4, 'Apple Clear Case with MagSafe for iPhone 13 Pro', 'Thin, light, and easy to grip — this Apple-designed case shows off the brilliant colored finish of iPhone 13 Pro while providing extra protection.\r\n\r\nCrafted with a blend of optically clear polycarbonate and flexible materials, the case fits right over the buttons for easy use. On the surface, a scratch-resistant coating has been applied to both the interior and exterior. And all materials and coatings are optimized to prevent yellowing over time.\r\n\r\nWith built-in magnets that align perfectly with iPhone 13 Pro, this case offers a magical attach experience and faster wireless charging, every time. When it’s time to charge, just leave the case on your iPhone and snap on your MagSafe charger, or set it on your Qi-certified charger.\r\n\r\nLike every Apple-designed case, it undergoes thousands of hours of testing throughout the design and manufacturing process. So not only does it look great, it’s built to protect your iPhone from scratches and drops.', 'Transparent', 'No', 1500, 601, 899, 10, 0, 10, 'In Stock', '2023-11-07 11:42:43'),
(8, 6, 'SENDEM P100 10000mAh Polymer Power Bank', '*Brand: SENDEM *Capacity: 10000 mAh *Input: DCV5-2.0A *Output: DC5V-2.1A *Cell: Lithium ion polymer cell *Colour: White / Black What is in the box: Powerbank 1x Usb micro cable 1x and user manual', 'Black', 'No', 5999, 1801, 4200, 10, 0, 10, 'In Stock', '2023-11-07 11:47:48'),
(9, 1, 'Inpod 12 Airbuds - Bluetooth Headphone', 'Product details of inPods 12 TWS Wireless Bluetooth Headset Earphones\r\n\r\nBluetooth version: Bluetooth v5.0\r\nBluetooth distance: 5-10meters\r\nHigh quality stereo audio transmission and remote control protocol\r\nPowerful noise de-noising circuit (active noise reduction)\r\nTouch Control\r\nWireless Technology\r\nFor Calls, Audio and Music', 'White', 'Yes', 1900, 150, 1750, 10, 0, 10, 'In Stock', '2023-11-07 11:57:01'),
(10, 7, 'Soft Silicone Rubber Airpod Case', 'Slim form fitting minimalistic design for your AirPods charging case\r\nDurable and impact absorbing silicone to provide the perfect balance of protection and fit\r\nLong lasting protection against scratches keeps your AirPods charging case scuff-free and clean\r\nReserved hole for convenient charging\r\nInclude detachable carabiner, let you attach your case to your belt, bag or purse easily\r\nHassle-Free one step installation', 'Pink', 'No', 1300, 801, 499, 10, 0, 10, 'In Stock', '2023-11-07 12:13:11'),
(11, 5, 'Samsung-Travel Adapter', 'Adaptive Fast Charging to charge your device battery from 0% to 50% in about 30 minutes\r\nSync and transfer files via micro USB data cable\r\nInput: 100-240VAC 50-60Hz\r\nOutput: 5.0VCD2A or 9.0VCD 1.67A\r\nWall Charger + Usb Cable', 'Black', 'Yes', 1500, 410, 1090, 10, 0, 10, 'In Stock', '2023-11-07 12:27:08'),
(12, 8, 'Jac Born 3.6A 3 in 1 Universal Car Charger', 'Product details of Jac Born 3.6A 3 in 1 Universal Car Charger\r\nJacBorn universal car charger for cell phones iPhone 5/6/7/8/X,samsang galaxy S8,huawei and more with lightning/micro USB/type C cable,3in1, high speed charging adapter.1.5 M Cable Legnth', 'Black', 'No', 2500, 1410, 1090, 10, 0, 10, 'In Stock', '2023-11-07 12:33:54'),
(13, 5, 'IVON (IV-CA35) 120W MICRO USB CABLE WITH EXTRA THICKNESS CABLE', 'Brand Name: ivon\r\nMaximum Current: 3.4A\r\nConnector A: USB A\r\nConnector B: Micro USB\r\nHas Retail Package: Yes\r\nModel Name: Mobile Phone Cables,Micro USB Cable,Microusb\r\nCurrent: Micro USB Cable 3.4A\r\nCompatible 1: USB Cable for Samsung,HTC,Nokia,Sony,LG,Tablet, Xiami,Huawei,PS4,Xbox Android Phone\r\nLength: 1M\r\nColor: Black', 'White', 'Yes', 1200, 350, 850, 10, 0, 10, 'In Stock', '2023-11-07 13:18:40'),
(14, 4, 'Silicone Back Cover iPhone 7/8', 'A soft microfiber lining on the inside helps protect your iPhone.\r\nOn the outside, the silky, soft-touch finish of the silicone exterior feels great in your hand.\r\nAnd you can keep it on all the time, even when you’re charging wirelessly.\r\nSo not only does it look great, it’s built to protect your iPhone from scratches and drops.\r\nCompatibility: iPhone 7 Plus / 8 Plus\r\n', 'Purple', 'No', 1500, 601, 899, 10, 0, 10, 'In Stock', '2023-11-07 13:24:09'),
(15, 9, 'Geemy Rechargeable Trimmer', 'Product details of Geemy Hair Clipper Gm 1001 / Hair Trimmer For Men Gm1001\r\nTrim and cut hair, moustache, beard and etc.\r\nSharp blade, high endurance.\r\nAdjustable cutting length.\r\nHigh-efficient charging battery inside.\r\nThis multipurpose clipper combines the functions of a hair and a beard trimmer in one device. It includes full-size guide combs to satisfy your needs of trimming your head and face, it is also very suitable for kids or toddlers haircut thanks to low noise and safety blades. The electric clipper\'s motor is powerful enough to cut through even the thickest hair with ease. The teeth on the blade are tightly line up with each other to remove hair with no snagging or pulling, offering an effective haircut. This professional hair clipper for men is very comfortable to hold, easy to use and clean even for first-time users.', 'Gold', 'No', 4000, 1201, 2799, 10, 0, 10, 'In Stock', '2023-11-07 13:27:42'),
(17, 11, 'KTS Wireless Portable Outdoor Light Bluetooth Speaker', 'Product details of KTS wireless portable outdoor light bt speaker with TWS&FM&USB 4 inch KTX-1411\r\nKTS wireless portable outdoor light bt speaker with TWS&FM&USB 4 inch KTX-1411\r\nPower Source:Battery, DC\r\nSupport Apt-x:NO\r\nSupport APP:NO\r\nBattery:Yes\r\nRadio, Napster, SiriusXM Internet Radio, PANDORA, Spotify, APPLE Music, Last.fm, TuneIn, Amazon Music, RHAPSODY, KUGOU\r\nNumber of Loudspeaker Enclosure:1\r\nAudio Crossover:Full-Range\r\nWoofer Size/Full-Range Size:3\"\r\nSet Type:Speaker\r\nFeature:None\r\nMaterial:Plastic\r\nWaterproof:NO\r\nCommunication:AUX, usb, Audio Line\r\nPMPO:5W\r\nSupport Memory Card:Yes\r\nSpeaker Type:PORTABLE\r\nOutput Power:5W\r\nRemote Control:NO\r\nCabinet Material:Plastic\r\nFrequency Range:100HZ-20KHZ\r\nDisplay Screen:NO\r\nIntelligent Personal Assistant:None\r\nVoice Control:NO\r\nBuilt-in Microphone:NO\r\nTweeter Size:None\r\nPrivate Mold:Yes\r\nModel Number:\r\nKTX-1411', 'Black', 'Yes', 3000, 200, 2800, 10, 0, 10, 'In Stock', '2023-11-07 13:40:20'),
(18, 5, 'MagSafe Charger', 'The MagSafe Charger is designed to quickly and safely wirelessly charge your iPhone. The system intelligently adapts to conditions to optimize charging your iPhone at up to 15W of peak power delivery for faster wireless charging. The actual power delivered to the iPhone will vary depending on the wattage of the power adapter and system conditions. For iPhone 13 mini and iPhone 12 mini, the MagSafe Charger delivers up to 12W of peak power delivery.', 'White', 'Yes', 1500, 250, 1250, 10, 0, 10, 'In Stock', '2023-11-08 22:32:09');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `product_id` int(11) NOT NULL,
  `img1` text DEFAULT NULL,
  `img2` text DEFAULT NULL,
  `img3` text DEFAULT NULL,
  `img4` text DEFAULT NULL,
  `img5` text DEFAULT NULL,
  `img6` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`product_id`, `img1`, `img2`, `img3`, `img4`, `img5`, `img6`) VALUES
(1, 'IMG-6544ff2fd62587.25374328.jpg', 'IMG-6544ff2fd6b9e6.75305915.jpg', 'IMG-6544ff2fd743a8.81969254.jpg', 'IMG-6544ff2fd80a25.41368288.jpg', 'IMG-6544ff2fd8bd21.42037392.jpg', 'IMG-6544ff2fd93b62.22391226.jpg'),
(2, 'IMG-6544ff7a5ade24.10927382.jpg', 'IMG-6544ff7a5ba9e2.68931984.jpg', 'IMG-6544ff7a5c6745.37973730.jpg', 'IMG-6544ff7a5cead3.04154203.jpg', 'IMG-6544ff7a5d7124.48989901.jpg', 'IMG-6544ff7a5e4323.24337286.jpg'),
(3, 'IMG-6544ffae2c7430.82235734.jpg', 'IMG-6544ffae2d37c2.47118594.jpg', 'IMG-6544ffae2eaf74.66563894.jpg', 'IMG-6544ffae2f3010.11223352.jpg', 'IMG-6544ffae2f9647.79168043.jpg', NULL),
(4, 'IMG-6544fff5bb5c49.85965322.jpg', 'IMG-6544fff5bc25f3.40002105.jpg', 'IMG-6544fff5bd2e44.90117055.jpg', 'IMG-6544fff5bdb108.90553403.jpg', 'IMG-6544fff5be3018.87525238.jpg', NULL),
(5, 'IMG-65471d42aded80.54319860.jpg', 'IMG-65471d42aef884.62428576.jpg', 'IMG-65471d42af80a3.24936817.jpg', 'IMG-65471d42b00146.02307476.jpg', 'IMG-65471d42b07f97.87955456.jpg', 'IMG-65471d42b0eb25.31078665.jpg'),
(6, 'IMG-6549d2b5d678d4.21536576.webp', 'IMG-6549d2b5d8a725.71109880.webp', 'IMG-6549d2b5d99223.02582158.webp', NULL, NULL, NULL),
(7, 'IMG-6549d5997d74b5.00691369.jpg', 'IMG-6549d5997faa03.84747878.jpg', 'IMG-6549d599811027.27913732.jpg', NULL, NULL, NULL),
(8, 'IMG-6549d6b6eb64d7.97409161.webp', 'IMG-6549d6b6ec1f33.79227056.webp', 'IMG-6549d6b6ed1d24.75385113.webp', NULL, NULL, NULL),
(9, 'IMG-6549d8ef0fcb20.23731575.webp', 'IMG-6549d8ef10ffa9.88020235.webp', 'IMG-6549d8ef11ff83.09197512.webp', 'IMG-6549d8ef12bff3.44190647.webp', 'IMG-6549d8ef13dd26.43683764.webp', 'IMG-6549d8ef1553c8.03116826.webp'),
(10, 'IMG-6549dccc4bd406.28153139.jpg', 'IMG-6549dce43e16d0.05289790.webp', NULL, NULL, NULL, NULL),
(11, 'IMG-6549dff77002d8.94479851.jpg', 'IMG-6549e000613da9.87564022.jpg', 'IMG-6549e000633b31.37040093.jpg', 'IMG-6549e00063d0e7.89468083.jpg', 'IMG-6549e000648799.62841678.jpg', NULL),
(12, 'IMG-6549e1909ec3f5.69440723.jpg', 'IMG-6549e190a0eae2.98743780.jpg', 'IMG-6549e190a1bcf9.15016987.jpg', NULL, NULL, NULL),
(13, 'IMG-6549ee6cbe8df7.29633212.jpg', 'IMG-654a2d23f0c551.91050262.png', NULL, NULL, NULL, NULL),
(14, 'IMG-6549eed19507c9.56995311.webp', 'IMG-6549eedccbf494.11612270.webp', 'IMG-6549eedccdbb53.41480065.webp', 'IMG-6549eedcce6ac5.58656881.webp', NULL, NULL),
(15, 'IMG-6549ef00422ee0.37335897.webp', 'IMG-6549ef00432916.50078545.webp', 'IMG-6549ef00442337.40348562.webp', 'IMG-6549ef0044d9c3.24782409.webp', 'IMG-6549ef00459400.82618191.webp', 'IMG-6549ef0046a2b5.17296553.webp'),
(17, 'IMG-6549f11cd8fb46.57722263.jpg', 'IMG-6549f13110e396.95466033.jpg', 'IMG-6549f13111f847.03203058.jpg', 'IMG-6549f13112c409.97240763.jpg', NULL, NULL),
(18, 'IMG-654bbf27aa8744.56064012.webp', 'IMG-654bbf27abe518.88211293.webp', 'IMG-654bbf27acbe49.22288952.webp', 'IMG-654bbf27ad5ba6.67111369.webp', 'IMG-654bbf27ae3368.21629245.webp', 'IMG-654bbf27af0334.97850549.webp');

-- --------------------------------------------------------

--
-- Table structure for table `sub_category`
--

CREATE TABLE `sub_category` (
  `sub_category_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `sub_category_name` varchar(255) NOT NULL,
  `sub_cat_added_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sub_category`
--

INSERT INTO `sub_category` (`sub_category_id`, `category_id`, `sub_category_name`, `sub_cat_added_date`) VALUES
(1, 4, 'Earphones', '2023-11-01 09:35:22'),
(2, 6, 'Smart Watches', '2023-11-01 09:35:49'),
(3, 4, 'Chromecast', '2023-11-01 09:36:28'),
(4, 8, 'Phone Cases', '2023-11-07 11:21:00'),
(5, 8, 'Phone Chargers', '2023-11-07 11:36:42'),
(6, 8, 'Power Banks', '2023-11-07 11:45:14'),
(7, 4, 'Airpod Cases', '2023-11-07 12:03:41'),
(8, 8, 'Car Chargers', '2023-11-07 12:31:41'),
(9, 4, 'Trimmers', '2023-11-07 13:28:02'),
(11, 7, 'Bluetooth Speakers', '2023-11-07 13:38:26');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` char(255) DEFAULT NULL,
  `last_name` char(255) DEFAULT NULL,
  `user_type` char(50) NOT NULL DEFAULT 'Customer',
  `password` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `email`, `first_name`, `last_name`, `user_type`, `password`, `created_date`) VALUES
(2, 'ashane@gmail.com', 'Ashane', 'Lakshitha', 'Customer', '$2y$12$AcASAWj4HI5YZcpVES1NDeIv1TrIQTXTTI5wJS3onW3S6iSuv4.Y6', '2023-11-05 17:09:01'),
(3, 'tharuka@gmail.com', 'Tharuka', 'Premasiri', 'Customer', '$2y$12$2Gx9HvYA1UVD05lKYA1f6uvv8q5HibXofF4DAqUHsviIWXtTWHIz2', '2023-11-05 19:56:47'),
(4, 'sachintha@gmail.com', 'Sachintha', 'Naveen', 'Customer', '$2y$12$lCkjsAFh0h/4yeSYLooJoui7xXip7IzU4xa4g.CNChMNGvD2FE0B2', '2023-11-05 23:25:45'),
(5, 'nimal@gmail.com', 'Nimali', 'Perera', 'Customer', '$2y$12$Pg6rexmuX10VAOQ8z3TP9uSJSFyHL7kvnwngzT9PrVcih13ZwKfHK', '2023-11-08 22:33:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `delivery_charges`
--
ALTER TABLE `delivery_charges`
  ADD PRIMARY KEY (`delivery_id`);

--
-- Indexes for table `order_product`
--
ALTER TABLE `order_product`
  ADD KEY `fk_product1` (`product_id`),
  ADD KEY `fk_order1` (`order_id`);

--
-- Indexes for table `order_table`
--
ALTER TABLE `order_table`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `fk_user_id1` (`user_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_subcat_id` (`sub_category_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `sub_category`
--
ALTER TABLE `sub_category`
  ADD PRIMARY KEY (`sub_category_id`),
  ADD KEY `fk_category_id` (`category_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `delivery_charges`
--
ALTER TABLE `delivery_charges`
  MODIFY `delivery_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_table`
--
ALTER TABLE `order_table`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `sub_category`
--
ALTER TABLE `sub_category`
  MODIFY `sub_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `fk_order1` FOREIGN KEY (`order_id`) REFERENCES `order_table` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_table`
--
ALTER TABLE `order_table`
  ADD CONSTRAINT `fk_user_id1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_subcat_id` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_category` (`sub_category_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sub_category`
--
ALTER TABLE `sub_category`
  ADD CONSTRAINT `fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
