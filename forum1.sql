-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.8-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema forum
--

CREATE DATABASE IF NOT EXISTS forum;
USE forum;

--
-- Definition of table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cat_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cat_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cat_name` varchar(45) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`cat_id`,`cat_parent`,`cat_name`) VALUES 
 (25,0,'Windows'),
 (26,0,'Mobile'),
 (27,0,'Software'),
 (28,0,'Internet'),
 (29,0,'Graphics'),
 (30,0,'Linux'),
 (31,0,'Programming'),
 (32,0,'Entertainment'),
 (33,0,'Others');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;


--
-- Definition of table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `comment_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_user` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `FK_comments_post` (`comment_post`),
  KEY `FK_comments_user` (`comment_user`),
  CONSTRAINT `FK_comments_post` FOREIGN KEY (`comment_post`) REFERENCES `posts` (`post_id`),
  CONSTRAINT `FK_comments_user` FOREIGN KEY (`comment_user`) REFERENCES `users` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comments`
--

/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;


--
-- Definition of table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `post_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_user` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_category` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_title` text NOT NULL,
  `post_content` longtext NOT NULL,
  PRIMARY KEY (`post_id`),
  KEY `FK_posts_user` (`post_user`),
  KEY `FK_posts_category` (`post_category`),
  CONSTRAINT `FK_posts_category` FOREIGN KEY (`post_category`) REFERENCES `category` (`cat_id`),
  CONSTRAINT `FK_posts_user` FOREIGN KEY (`post_user`) REFERENCES `users` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` (`post_id`,`post_user`,`post_category`,`post_date`,`post_title`,`post_content`) VALUES 
 (14,4,29,'2016-02-05 21:12:51','How to design your first 3D project without tears','Most people are intimidated by the idea of designing their own 3D \r\nobjects, but it turns out that the basics can be simple and easy. In \r\nthis article, we take a look at building our first project using nothing\r\n but simple rectangles.<br><br>Beyond <a href=\"http://www.zdnet.com/article/promising-trend-for-innovators-3d-printer-prices-are-falling/\">the ever-dropping cost of 3D printers</a>\r\n themselves, one of the biggest perceived barriers of entry to 3D \r\nprinting is the supposed difficulty of the design process. And, make no \r\nmistake: if you\'re building Jony Ive-level designs, the design process \r\nis hard.<br><br>But if you just want to make objects that are useful around the home, \r\noffice, shop, or data center, 3D design can be simple and painless.<br>In this edition of DIY-IT\'s discovery series on 3D printing, we\'ll look \r\nat making our first design in a CAD program and then printing it on the <a href=\"http://store.makerbot.com/replicator\" target=\"_blank\">MakerBot Replicator</a>.\r\n The design took less than 20 minutes to do (and you\'ll see the whole \r\nthing in real time on the video). The print was once again the longest \r\npart of the process, taking about five hours to completely generate.<br><br><p> 	 	Let\'s start off by talking about design programs, otherwise known\r\n as CAD (or Computer Aided Design). There are a lot of 3D design \r\nprograms, some free and some commercial. Different designers swear by \r\ndifferent programs and, like with most software, certain programs are \r\nbetter at certain kinds of projects than other programs. Over time, \r\nyou\'re likely to pick up a few favorites.</p><p> 	 	I\'m going to use <a href=\"http://www.123dapp.com/design\" target=\"_blank\">123D Design</a> from AutoDesk. I chose it because it\'s free and also because a number of <a href=\"https://www.youtube.com/user/jamesbruton\" target=\"_blank\">the YouTubers who built interesting projects</a>\r\n used it, and it seemed reasonably approachable. Just because I\'m using \r\nthis tool doesn\'t mean it\'s the best for you. But we\'ll use it for now.</p><p>\r\n 	 	Today\'s project is a simple tray made from rectangles. The idea is \r\nthat if you can create rectangular slabs, you can turn them into a lot \r\nof useful objects. The entire knock-down (or ready-to-assemble) \r\nfurniture industry relies on assembling different sized rectangles into \r\nmany different forms, resulting in desks, bookcases, tables, and more.  \r\n      </p><br>'),
 (16,13,27,'2016-02-05 21:15:48','Enterprise State Roaming will help you take your settings with you','<p>Microsoft has kicked off the <a href=\"https://blogs.technet.microsoft.com/ad/2016/02/04/more-azure-ad-and-windows-10-goodness-enterprise-state-roaming-public-preview/\">public preview of Enterprise State Roaming</a>, a Windows 10 feature that allows business users to sync their settings across devices.</p><p>Since Windows 8, \'setting sync\' has allowed <a href=\"http://windows.microsoft.com/en-US/windows-8/sync-settings-pcs\">consumers to sync their operating system settings</a>\r\n and Universal Windows Platform application data across all their \r\nWindows devices, by using a personal Microsoft account and a consumer \r\nOneDrive folder in the cloud.</p><p>Enterprise State Roaming does the \r\nsame thing for business users, but uses different technology -- the data\r\n is \'roamed\' using Azure Active Directory identities and is backed by \r\nstorage in the Azure cloud. It allows things like OS settings, themes \r\nand wi-fi passwords to be synchronized across corporate-owned Azure AD \r\njoined devices -- handy if you regularly log into different devices.</p><p>Microsoft\r\n said that using Enterprise State Roaming means there is no mixing of \r\nenterprise data into consumer cloud accounts -- or consumer data in \r\nenterprise cloud accounts. The company said that all data is \r\nautomatically encrypted before leaving the user\'s Windows 10 device \r\nusing Azure Rights Management (Azure RMS); all content stays encrypted \r\nat rest in the cloud, except for namespaces, like settings names and \r\nWindows app names. Microsoft is offering free use of Azure RMS for \r\nEnterprise State Roaming.</p><p>Microsoft said that data will be stored \r\nin an Azure region based on the country associated with the Azure AD \r\ndirectory. \"We understand it is important to some of our enterprise \r\ncustomers to ensure data stays within their geographic boundaries due to\r\n the compliance reasons,\" said Gunjan Jain, senior program manager in \r\nMicrosoft\'s Windows Server and Services Division.</p><p>The public \r\npreview is only available in the US and Europe, but Microsoft said it \r\nhad plans to roll out globally \"in the near future\".        </p>\r\n\r\n<p>Organisations wanting to deploy Enterprise State Roaming require an \r\nAzure Active Directory Premium subscription, plus Windows 10 (Version \r\n1511, Build 10586 or greater). Devices must either be Azure AD Joined or\r\n AD Domain Joined with automatic registration to Azure AD.</p><h3>More on Windows 10</h3><ul><li><a href=\"http://www.techrepublic.com/article/windows-10-making-in-roads-into-business-at-nearly-twice-the-rate-of-windows-8/\">Windows 10 is being adopted by business at nearly twice the rate of Windows 8</a></li><li><a href=\"http://www.zdnet.com/article/windows-10-usage-share-continues-to-grow-but-enterprise-stays-on-sidelines/\">Windows 10 usage share continues to grow, but enterprise stays on sidelines</a></li><li><a href=\"http://www.zdnet.com/article/why-windows-10-mobile-could-still-be-a-sleeper-hit/\">Why Windows 10 Mobile could still be a sleeper hit</a></li><li>111<br></li></ul>'),
 (17,14,26,'2016-02-05 21:19:41','Broken iPhone? Apple will now offer you trade-in credit','<p>Apple will start offering up to $250 for damaged iPhones under an impending revamp of its trade-in program.</p><p>That\'s according to <em>9to5Mac</em> sources <a href=\"http://9to5mac.com/2016/02/04/apple-broke-iphone-upgrade-screen-protector-program/\">who say</a>\r\n Apple is about to expand its trade-in scheme to include new iPhones, \r\neven when they\'ve got damaged screens, cameras, or buttons. </p><p>Until\r\n now, Apple\'s Store Reuse and Recycle program for iPhones has offered \r\ncustomers credit towards a new iPhone model, helping the company sell \r\nmore phones and keep existing customers. However, it hasn\'t offered \r\ncredit for badly-damaged iPhones. </p><p>Apple\'s full terms and conditions are available at its stores, but the <a href=\"http://www.apple.com/recycling/\">current program\'s online policy</a> says the iPhone \"must be in good working condition and able to power on\". </p>The\r\n new program is slated for launch this week and will allow customers \r\nwith damaged iPhone 5s and iPhone 6 and 6 Plus to take their phones to \r\nan Apple Store and get credit'),
 (18,15,26,'2016-02-05 21:26:28','Google expands hands-free functionality with new Android Wear update','<p> 	Back in November, ZDNet\'s Kevin Tofel wrote about possible upcoming <a href=\"http://www.zdnet.com/article/new-android-wear-app-update-tips-voice-calls-coming-to-google-watches/\">Android Wear updates</a> that were found in a change log for version 1.4. It took a bit longer than thought, but Google <a href=\"http://officialandroid.blogspot.com/2016/02/android-wear-designed-for-your-wrist.html\" target=\"_blank\">announced</a> several new hands-free options that bring some Apple Watch parity to Android Wear.</p>        \r\n\r\n\r\n    \r\n        <div class=\"relatedContent alignRight\">\r\n                            	<h3 class=\"heading\">\r\n		<span class=\"int\">What\'s Hot on ZDNet</span>\r\n	</h3>\r\n                <ul><li>\r\n                        <a href=\"http://www.zdnet.com/article/how-to-block-windows-10-upgrades-on-your-business-network-and-at-home-too/\" data-omniture-track=\"moduleClick\" data-omniture-track-data=\"{&quot;moduleInfo&quot;: &quot;pinbox&quot;}\">How to block Windows 10 upgrades on your business network (and at home, too)</a>\r\n                    </li><li>\r\n                        <a href=\"http://www.zdnet.com/article/linux-and-open-source-have-won-get-over-it/\" data-omniture-track=\"moduleClick\" data-omniture-track-data=\"{&quot;moduleInfo&quot;: &quot;pinbox&quot;}\">?Linux and open source have won, get over it</a>\r\n                    </li><li>\r\n                        <a href=\"http://www.zdnet.com/article/how-to-install-multiple-sim-cards-into-an-iphone-6s/\" data-omniture-track=\"moduleClick\" data-omniture-track-data=\"{&quot;moduleInfo&quot;: &quot;pinbox&quot;}\">How to install multiple SIM cards into an iPhone 6s</a>\r\n                    </li><li>\r\n                        <a href=\"http://www.zdnet.com/pictures/ces-2016-meet-this-years-weirdest-and-worst-tech/\" data-omniture-track=\"moduleClick\" data-omniture-track-data=\"{&quot;moduleInfo&quot;: &quot;pinbox&quot;}\">CES 2016: Meet this year\'s weird, wonderful and worst tech</a>\r\n                    </li></ul></div><p> 	One of the reasons I\r\n prefer to use the Apple Watch is the ability to answer a call and carry\r\n out the conversation right on my wrist. This is useful while walking \r\naround the city with your phone in your pocket or backpack, while \r\nworking around the house and using both hands, and occasionally while \r\ndriving. The upcoming Android Wear update provides this same capability \r\nfor those watches with integrated speakers, including the <a href=\"http://www.zdnet.com/product/huawei-watch/\">Huawei Watch</a> and <a href=\"http://www.zdnet.com/product/asus-zenwatch-2/\">ASUS ZenWatch 2</a>.</p><p> 	The complete list of hands-free options, as stated by Google, include:</p><ul><li><strong>Navigate your watch with new gestures</strong>:\r\n Scrolling up and down your card stream is as simple as flicking your \r\nwrist. Starting today you can also expand a card, bring up your apps, or\r\n return home to your watch face with a push, lift or shake. You\'ll be \r\nable to stay connected to what\'s important, while keeping your phone (or\r\n other hand) in your pocket.</li><li><strong>Send more messages with just your voice</strong>:\r\n With Android Wear, you\'ve always been able to get answers to spoken \r\nquestions. Now you can also use your voice to send messages from apps \r\nlike Google Hangouts, Nextplus, Telegram, Viber, WeChat, and WhatsApp. \r\nRunning late for lunch? Just say \"OK Google, Send a WhatsApp message to \r\nNathan: I\'ll be right there.\" </li></ul>'),
 (19,16,26,'2016-02-05 21:28:10','Apple\'s iPhone: Still top in US but Android tightens its grip','<p>Apple\'s iPhone brand continues to dominate in the US, despite Android strengthening its lead on the platform front.  </p><p>The\r\n iPhone held a 42.9 percent share of US smartphone subscribers in the \r\nfinal quarter of 2015. Its closest rival Samsung ended the year up \r\nslightly but remains over 14 percentage points behind, <a href=\"http://www.comscore.com/Insights/Market-Rankings/comScore-Reports-December-2015-US-Smartphone-Subscriber-Market-Share\">according to comScore\'s</a> MobilLens data. </p><p>Despite\r\n Apple\'s clear and continued dominance on mobile hardware in the US, its\r\n share has declined by 0.7 percentage points from the September quarter,\r\n while Android vendors Samsung, LG and Motorola have all made slight \r\ngains. </p><p>Samsung ended the year on 28.4 percent, followed by LG \r\nwith 9.9 percent, and Motorola with 5.3 percent. HTC remained flat at \r\n3.3 percent.   </p><p>Given the minor influence of Windows Phone/Windows\r\n Mobile and BlackBerry, those hardware numbers were reflected in the \r\nplatform measurements across the second half of the year.        </p>'),
 (20,18,27,'2016-02-05 21:30:23','Enterprise cloud performs best with DevOps, software','<p> 	Hybrid cloud is in the plans of nine out of ten organizations, and \r\nDevOps and software-defined networking (SDN) are considered the best \r\nsupporting approaches to making cloud services succeed. </p>        \r\n\r\n<figure class=\"image alignRight image-small shortcode-image\"><span class=\"img \"><img src=\"http://zdnet3.cbsistatic.com/hub/i/r/2016/02/05/70bbc467-ebbf-4ede-965f-c5580a9ac767/resize/270xauto/94ac0de790531f6de412642ca333deec/hands-typing-7.jpg\" class=\"\" alt=\"hands-typing-7.jpg\" height=\"auto\" width=\"270\"></span><figcaption><span class=\"credit\">\r\n                                            Photo: HubSpot\r\n                                        </span></figcaption></figure><p> 	This is one of the takeaways from a recent <a href=\"http://f5.com/SOAD\" target=\"_blank\">survey</a>\r\n of 3.002 IT executives and managers, conducted among the customer base \r\nof F5 Networks, Inc. The study\'s authors, Lori MacVittie and Cindy \r\nBorovick, said there are many trends impacting application delivery, but\r\n everything is related. </p><p>\"Everything actually touches everything \r\nelse,\" said MacVittie in a webcast accompanying the survey results. \r\n\"Mobile applications are driving cloud. Which is also driving DevOps. \r\nWhich is also driving the need for more security... It\'s all \r\ninterelated.\" Accordingly, \"hybrid cloud being the new normal, were \r\nseeing an big upswing in services that support that. Global service load\r\n balancing, identify federation. DNS -- things that are going to really \r\nimpact that and help manage that better.\"</p> 	The survey explored \r\nthe connection between cloud implementations and DevOps, and found some \r\ninteresting relationships. \"Although cloud chatter about DevOps often \r\nfocuses on public cloud, our survey respondents seem to associate DevOps\r\n more with private cloud,\" MacVittie and Borovick state. \"Of the 43 \r\npercent of participants who see private cloud as strategically \r\nsignificant, 23 percent also believe DevOps is significant, and almost \r\ntwice as many (44 percent) believe the same about software-defined \r\nnetworking [SDN]. This seems to indicate that as organizations develop \r\nand deploy applications in their private clouds, they believe DevOps \r\npractices together with SDN implementations will give them the agile IT \r\nenvironments they need to meet their business requirements.');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;


--
-- Definition of table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `u_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `u_username` varchar(60) NOT NULL DEFAULT '',
  `u_pass` varchar(64) NOT NULL DEFAULT '',
  `u_fullname` varchar(50) NOT NULL DEFAULT '',
  `u_email` varchar(100) NOT NULL DEFAULT '',
  `u_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`u_id`),
  UNIQUE KEY `u_email` (`u_email`),
  UNIQUE KEY `u_username` (`u_username`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`u_id`,`u_username`,`u_pass`,`u_fullname`,`u_email`,`u_registered`) VALUES 
 (4,'admin','123','Mamunur Rashid','rimonmath@gmail.com','2016-02-02 19:38:31'),
 (13,'moslem','123','Moslem Uddin','moslem@gmail.com','2016-02-05 21:04:40'),
 (14,'rimon','123','Mamunur Rashid','rimon@gmail.com','2016-02-05 21:05:11'),
 (15,'shamim','123','Shamim Hossain','shamim@gmail.com','2016-02-05 21:05:34'),
 (16,'irad','123','Irad Hossain','irad@gmail.com','2016-02-05 21:05:55'),
 (17,'shafia','123','Shafia Akter','shafia@gmail.com','2016-02-05 21:06:18'),
 (18,'shammi','123','Shammi Shimu','shammi@gmail.com','2016-02-05 21:06:43'),
 (19,'shaju','123','Abu Sayeed Shaju','shaju@gmail.com','2016-02-05 21:08:16'),
 (20,'soma','123','Hosneyara Soma','soma@gmail.com','2016-02-05 21:08:48'),
 (21,'sabuj','123','Masud Rana Sabuj','sabuj@gmail.com','2016-02-05 21:09:14'),
 (22,'shahalam','123','Shah Alam ','shahalam@gmail.com','2016-02-05 21:09:53'),
 (23,'emily','123','Mahfuza Emily','emily@gmail.com','2016-02-05 21:10:19'),
 (24,'masudalam','123','Masud Alam','masudalam@gmail.com','2016-02-05 21:10:47'),
 (26,'cc','cc','cc','cc','2016-02-06 09:17:44');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
