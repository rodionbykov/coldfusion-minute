-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	5.6.25-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_post` int(10) unsigned DEFAULT NULL,
  `id_author` int(10) unsigned DEFAULT NULL,
  `body` text NOT NULL,
  `moment` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_author` int(10) unsigned DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `body` text NOT NULL,
  `moment` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (2,1,'You will find it a powerful ally',NULL,'This is Chewbacca. He\'s first-mate on a ship that might suit our needs. I don\'t like the look of this. Han Solo. I\'m captain of the Millennium Falcon. Chewie here tells me you\'re looking for passage to the Alderaan system. Yes, indeed. If it\'s a fast ship. Fast ship? You\'ve never heard of the Millennium Falcon? Should I have? It\'s the ship that made the Kessel run in less than twelve parsecs! I\'ve outrun Imperial starships, not the local bulk-cruisers, mind you. I\'m talking about the big Corellian ships now. She\'s fast enough for you, old man. What\'s the cargo? Only passengers. Myself, the boy, two droids, and no questions asked. What is it? Some kind of local trouble? Let\'s just say we\'d like to avoid any Imperial entanglements.','2016-02-01 00:00:00'),(3,1,'This place can be a little rough',NULL,'Oh. No one to meet us. I don\'t like this. Well, what would you like? Well, they did let us land. Look, don\'t worry. Everything\'s going to be fine. Trust me. See? My friend. Keep your eyes open, okay? Why, you slimy, double-crossing, no-good swindler! You\'ve got a lot of guts coming here, after what you pulled. How you doing, you old pirate? So good to see you! Inever thought I\'d catch up with you again. Where you been?\n\nGeneral, I\'ve got to leave. I can\'t stay anymore. I\'m sorry to hear that. Well, there\'s a price on my head. If I don\'t pay off Jabba the Hut, I\'m a dead man. A death mark\'s not an easy thing to live with. You\'re a good fighter, Solo. I hate to lose you. Thank you, General.\n\nOnly a fully trained Jedi Knight with the Force as his ally will conquer Vader and his Emperor. If you end your training now, if you choose the quick and easy path, as Vader did, you will become an agent of evil. Patience. And sacrifice Han and Leia? If you honor what they fight for...yes! If you choose to face Vader, you will do it alone. I cannot interfere. I understand. Artoo, fire up the converters. Luke, don\'t give in to hate - that leads to the dark side. Strong is Vader. Mind what you have learned. Save you it can. I will. And I\'ll return. I promise. Told you, I did. Reckless is he. Now matters are worse. That boy is our last hope. No. There is another.\n\nPrincess...we have a visitor. We\'ve picked up something outside the base in zone twelve, moving east. It\'s metal. Then it couldn\'t be one of those creatures that attacked Luke. It could be a speeder, one of ours. No. Wait - there\'s something very weak coming through. Sir, I am fluent in six million forms of communication. This signal is not used by the Alliance. It could be an Imperial code. It isn\'t friendly, whatever it is. Come on, Chewie, let\'s check it out. Send Rouges Ten and Eleven to station three-eight.\n\nWell, wait. This is interesting. Lando. Lando system? Lando\'s not a system, he\'s a man. Lando Calrissian. He\'s a card player, gambler, scoundrel. You\'d like him. Thanks.','2016-02-02 02:00:00'),(4,1,'Stretch out with your feelings','A death mark\'s not an easy thing to live with. You\'re a good fighter, Solo.','Not bad for a little furball. There\'s only one left. You stay here. We\'ll take care of this. I have decided that we shall stay here.','2016-02-10 00:00:00'),(5,2,'Her resistance to the mind probe is considerable.','Princess...we have a visitor. We\'ve picked up something outside the base in zone twelve, moving east. It\'s metal.','Oh. No one to meet us. I don\'t like this. Well, what would you like? Well, they did let us land. Look, don\'t worry. Everything\'s going to be fine. Trust me. See? My friend. Keep your eyes open, okay? Why, you slimy, double-crossing, no-good swindler! You\'ve got a lot of guts coming here, after what you pulled. How you doing, you old pirate? So good to see you! Inever thought I\'d catch up with you again. Where you been?\n\nGeneral, I\'ve got to leave. I can\'t stay anymore. I\'m sorry to hear that. Well, there\'s a price on my head. If I don\'t pay off Jabba the Hut, I\'m a dead man. A death mark\'s not an easy thing to live with. You\'re a good fighter, Solo. I hate to lose you. Thank you, General.\n\nOnly a fully trained Jedi Knight with the Force as his ally will conquer Vader and his Emperor. If you end your training now, if you choose the quick and easy path, as Vader did, you will become an agent of evil. Patience. And sacrifice Han and Leia? If you honor what they fight for...yes! If you choose to face Vader, you will do it alone. I cannot interfere. I understand. Artoo, fire up the converters. Luke, don\'t give in to hate - that leads to the dark side. Strong is Vader. Mind what you have learned. Save you it can. I will. And I\'ll return. I promise. Told you, I did. Reckless is he. Now matters are worse. That boy is our last hope. No. There is another.\n\nPrincess...we have a visitor. We\'ve picked up something outside the base in zone twelve, moving east. It\'s metal. Then it couldn\'t be one of those creatures that attacked Luke. It could be a speeder, one of ours. No. Wait - there\'s something very weak coming through. Sir, I am fluent in six million forms of communication. This signal is not used by the Alliance. It could be an Imperial code. It isn\'t friendly, whatever it is. Come on, Chewie, let\'s check it out. Send Rouges Ten and Eleven to station three-eight.\n\nWell, wait. This is interesting. Lando. Lando system? Lando\'s not a system, he\'s a man. Lando Calrissian. He\'s a card player, gambler, scoundrel. You\'d like him. Thanks.','2016-01-11 00:00:00'),(6,2,'Come along, Artoo.',NULL,'What happened? Where? Found him in a junk pile? Oh, what a mess. Chewie, do you think you can repair him? Lando\'s got people who can fix him. No, thanks. I\'m sorry. Am I interrupting anything? Not really. You look absolutely beautiful. You truly belong here with us among the clouds. Thank you. Will you join me for a little refreshment? Everyone\'s invited, of course. Having trouble with you droid? No. No problem. Why?','2016-01-20 00:00:00'),(7,2,'Do you think that after what you did to Han','Something must have happened to them. See if they\'ve been captured','It is the name of your true self. You\'ve only forgotten. I know there is good in you. The Emperor hasn\'t driven it from you fully. That is why you couldn\'t destroy me. That\'s why you won\'t bring me to your Emperor now. I see you have constructed a new lightsaber. Your skills are complete. Indeed, you are powerful, as the Emperor has foreseen. Come with me. Obi-Wan once thought as you do. You don\'t know the power of the dark side. I must obey my master. I will not turn...and you\'ll be forced to kill me. If that is your destiny.','2016-02-03 00:00:00'),(8,3,'We\'re coming out of the asteroid field',NULL,'Luke...Luke...Do not...Do not underestimate the powers of the Emperor, or suffer your father\'s fate, you will. Luke, when gone am I, the last of the Jedi will you be. Luke, the Force runs strong in your family. Pass on what you have learned, Luke... There is...another...Sky...Sky...walker.\n\nAnakin was a good friend. When I first knew him, your father was already a great pilot. But I was amazed how strongly the Force was with him. I took it upon myself to train him as a Jedi. I thought that I could instruct him just as well as Yoda. I was wrong. There\'s still good in him. He is more machine now than man. Twisted and evil. I can\'t do it, Ben. You cannot escape your destiny. I can\'t kill my own father. Then the Emperor has already won. You were our only hope. Yoda spoke of another. The other he spoke of is your twin sister. But I have no sister. To protect you both from the Emperor, you were hidden from your father when you were born.\n\nPerhaps you refer to the imminent attack of your Rebel fleet. Yes...I assure you we are quite safe from your friends here. Your overconfidence is your weakness. Your faith in your friends is yours. It is pointless to resist, my son. Everything that has transpired has done so according to my design. Your friends up there on the Sanctuary Moon are walking into a trap. As is your Rebel fleet! It was I who allowed the Alliance to know the location of the shield generator. It is quite safe from your pitiful little band. An entire legion of my best troops awaits them. Oh...I\'m afraid the deflector shield will be quite operational when your friends arrive.\n\nMaster Yoda... is Darth Vader my father? Mmm... rest I need. Yes... rest. Yoda, I must know. Your father he is. Told you, did he? Yes. Unexpected this is, and unfortunate... Unfortunate that I know the truth? No. Unfortunate that you rushed to face him... that incomplete was your training. Not ready for the burden were you. Well, I\'m sorry. Remember, a Jedi\'s strength flows from the Force. But beware. Anger, fear, aggression. The dark side are they. Once you start down the dark path, forever will it dominate your destiny.\n\nI told you to remain on the command ship. A small Rebel force has penetrated the shield and landed on Endor. Yes, I know. My son is with them. Are you sure? I have felt him, my Master. Strange, that I have not. I wonder if your feelings on this matter are clear, Lord Vader. They are clear, my Master. Then you must go to the Sanctuary Moon and wait for them. He will come to me? I have foreseen it. His compassion for you will be his undoing. He will come to you andthen you will bring him before me. As you wish.','2016-02-02 00:00:00'),(9,3,'No! Stormtroopers? Here?',NULL,'You said you wanted to be around when I made a mistake. well, this could be it, sweetheart. I take it back. We\'re going to get pulverized if we stay out here much longer. I\'m not going to argue with that. Pulverized? I\'m going in closer to one of the big ones. Closer? Closer?! h, this is suicide! There. That looks pretty good. What looks pretty good? Yeah. That\'ll do nicely. Excuse me, ma\'am, but where are we going? I hope you know what you\'re doing. Yeah, me too.','2016-02-12 00:00:00'),(10,3,'I must obey my master','Don\'t be too proud of this technological terror you\'ve constructed. ','I have a really bad feeling about this. What did he say? I\'m rather embarrassed, General Solo, but it appears you are to be the main course at a banquet in my honor. Leia! Oh! Your Royal Highness. But these are my friends. Threepio, tell them they must be set free. Somehow, I got the feeling that didn\'t help us very much. Threepio, tell them if they don\'t do as you wish, you\'ll become angry and use your magic. But Master Luke, what magic? I couldn\'t possibly -- Just tell them. You see, Master Luke they didn\'t believe me. Just as I said they wouldn\'t. Wha-wha-what\'s happening! Oh! Oh, dear! Oh! Put me down! He-e-elp! Master Luke! Artoo! Somebody, somebody, help! Master Luke, Artoo! Artoo, quickly! Do something, somebody! Oh! Ohhh! Oh, oh, oh, oh! Thank goodness. Thanks, Threepio. I...I never knew I had it in me.\n<br /><br />\nDie Wanna Wanga! Oh, my! Die Wanna Wauaga. We -- we bring a message to your master, Jabba the Hutt...and a gift. Gift, what gift? Nee Jabba no badda. Me chaade su goodie. He says that our instructions are to give it only to Jabba himself. I\'m terribly sorry. I\'m afraid he\'s ever so stubborn about these sort of things. Nudd Chaa. Artoo, I have a bad feeling about this. Good morning. Bo Shuda! The message, Artoo, the message.\n<br /><br />\nYou\'re free of the carbonite. Shhh. You have hibernation sickness. I can\'t see. Your eyesight will return in time. Where am I? Jabba\'s palace. Who are you? Someone who loves you. Leia! I gotta get you out of here. What\'s that? I know that laugh. Hey, Jabba. Look, Jabba, I was just on my way to pay you back, but I got a little sidetracked. It\'s not my fault. It\'s too late for that, Solo. You may have been a good smuggler, but now you\'re Bantha fodder. Look... Take him away! Jabba... I\'ll pay you triple! You\'re throwing away a fortune here. Don\'t be a fool! Bring her to me.\n\nGreetings, Exalted One. Allow me to introduce myself. I am Luke Skywalker, Jedi Knight and friend to Captain Solo. I know that you are powerful, mighty Jabba, and that your anger with Solo must be equally powerful. I seek an audience with Your Greatness to bargain for Solo\'s life. With your wisdom, I\'m sure that we can work out an arrangement which will be mutually beneficial and enable us to avoid any unpleasant confrontation. As a token of my goodwill, I present to you a gift: these two droids. What did he say? Both are hardworking and will serve you well.\n\nPerhaps you refer to the imminent attack of your Rebel fleet. Yes...I assure you we are quite safe from your friends here. Your overconfidence is your weakness. Your faith in your friends is yours. It is pointless to resist, my son. Everything that has transpired has done so according to my design. Your friends up there on the Sanctuary Moon are walking into a trap. As is your Rebel fleet! It was I who allowed the Alliance to know the location of the shield generator. It is quite safe from your pitiful little band. An entire legion of my best troops awaits them. Oh...I\'m afraid the deflector shield will be quite operational when your friends arrive.','2016-02-15 00:00:00');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `passwd` varchar(125) DEFAULT NULL,
  `firstname` varchar(105) NOT NULL,
  `lastname` varchar(105) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `securitytoken` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_UNIQUE` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'padawan','12345','Anakin','Skywalker','Brave Mentor',0,''),(2,'jedi','12345','Obiwan','Kenobi','Talented Grasshopper',10,''),(3,'master','12345','Yoda','','Old Apprentice',20,'');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'test'
--

--
-- Dumping routines for database 'test'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-02-19 15:49:40
