CREATE DATABASE  IF NOT EXISTS `miamip_adoptaprofessor` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `miamip_adoptaprofessor`;
-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: miamip_adoptaprofessor
-- ------------------------------------------------------
-- Server version	5.5.41-0ubuntu0.14.04.1

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
-- Table structure for table `apiKey`
--

DROP TABLE IF EXISTS `apiKey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apiKey` (
  `user_id` int(11) NOT NULL,
  `apiKey` varchar(255) NOT NULL,
  `last` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apiKey`
--

LOCK TABLES `apiKey` WRITE;
/*!40000 ALTER TABLE `apiKey` DISABLE KEYS */;
INSERT INTO `apiKey` VALUES (29,'zIXP2RHi2M3vjgnfOMgzNzshuP51ex8Of6DiXlA07DwrTTHHFXgtxJL1yQ3NocBDieVgzvgH9N92GQKmN1PlKAnjrq6QCHtUWpbw','2015-03-17 01:27:36'),(35,'3yebgbGaepbvmG0rpY0vJtAmdm7eLDMPb00scHCq7OVtuWUUUVqEo01Cm8R8MDXYEXqRF3hMSdfnaah45HJuIK64SXcFB9Ef756N','2015-03-17 02:01:20'),(35,'k5ZH56G2Pnwn99tsJmW8feOWAr1PCx4XD4EIakL0IhoRrRjaegitu7q5yrVbZZ8C4Nlf76fQoDIPv1ZKiieMqESZ6Na5NiHS537d','2015-03-17 02:03:15'),(35,'eFkwmbkVQhJ5gXIS1zwqfHHE18cheYmsEGZ1SkWICGOSDxLE7h5mZN00VdhacDDRkCScWOVyuKr8icNpuSMtFNtB0KLdoo4I0WVX','2015-03-17 02:08:50'),(29,'mDkEz73s1xbrWayjbqumCJKPY6iCAGPWjaBThElibxK7IirTJVflFZbD5tgGa6DtgemyTIR4fBcXUDQDz6Ze6bScE8SPewivKE3D','2015-03-21 18:38:55'),(29,'3wLuXTtWbTI392VEzx17QuKY6ZY9pNVskGWhzpeLjWOtYJ8yh9F8Dp7Kp5TOTPhdvdv5DJQWGFqFpydGHSPliW5I2ZxWOO9k1FqF','2015-03-21 18:40:04'),(29,'H3lb8qgGO4FeiWhn3tLdpLy1uV8nWGfEKAPT16APaf3sclQgOBten1gRXofU5uyP5oJ6ujWEy07LlY1azupWwFOu43o9yXZElILP','2015-03-21 23:42:13'),(29,'GjsH2QGe5X92SXzHU8ODefACPdiJQDoxXQe0GUeMRnOKlorgwgTLwtnlHF5yjt5gjjg0evM6TBQeZiuvzog5SDrAjw8DZdUjxbjL','2015-03-22 01:06:14'),(29,'jAyCCrzhwhWl72jVDvzdPAno9m1pyFGSgfuSH49dl6zs9ToMoX0eynCHJD7ijNbz3FsLJBY5IyxRrVEQTE4r1G9Lkg4E4fd8UFTE','2015-03-22 01:19:01'),(29,'NC9rsBT9usJSuK9K0yYTiX9BRUFgWS6KvgbXR57myQe3BnNBVMueJEQAyvQvoXgTdsQ5xYr6PF9q3X2ZJxesc43LAUhYRxR5ZIbx','2015-03-22 01:55:29'),(29,'VPI8Px5ptuJbNIV637w7w3YwsfGChAtcpclfJrFdVooI7jObqliXpgtRwauOKY0aampUN57JuvrBPgMfC5d1mGTSQoGBmHLw3bqR','2015-03-22 02:05:43'),(29,'ihPUttYPZDDcXkROjW0yXg0jYfRFpjxHAmC4QAUPdx2bRTZbQ0JNhJ6fZXUpgs7ROJWEkQuyoxJfrJqhJa40UbgT8aipCphr9e6t','2015-03-22 02:13:10'),(29,'lUED4Q8GDu5GrurviwMcwxa9EJ7cQtFcnkQsaZ8OteuVJVr1reeXLp7q8fCZIhc5C2xM2GAvV4rE0SGs7UqTkyjsNWswdECPHaCJ','2015-03-22 02:13:42'),(29,'4A2s8LIzu9QejVfd6v7fFqEiQWKZaQtfqvIzgr8LAYZUUf80KffqGUJwRtv2jYhKu0jLrrw1qwVkL4lvjAWZvFwm81or0GbuGvf7','2015-03-22 02:22:36'),(29,'zUb7uK1cycgDWZqiLUSru7aCbWzIBGnbAyi4jkgSxwvuwVMhQFIkMTXXPxFrd3CNBVRVg8NNEjiaf4s5Jaqw3ouTV9l8dXVPTNK9','2015-03-22 02:36:17'),(29,'inucaaRbYCWeyfG0ZUfpV8BSV3PFCSQUgk7rvYCtBzIaOpaNjqdfyO7uRWatP0o6lwyRual5K4gztqnNRA3poaUg74KX593rFBj9','2015-03-22 02:42:22'),(29,'h2OOMlzyoF9kYLcvXKJD0R5UR14OzISRKHFx2e5qUfLS1YoYI7BJYGDQHIEhqx8beOIh3NIX2uQ4te2cmDVlkyc2gQjHosSDgAVj','2015-03-22 02:43:56'),(29,'dszy6DbAbzPnzI6ckefCp5HLfhLQFTnSlXqsAB2LbS9KAgXVvcyVhgGxxroclL5GJv8j6b5i3f2Ew0A1c8WuoD1W4p9qbe6VJfeQ','2015-03-22 02:44:27'),(29,'pQ6UTqvk4idRTbZmzwj7SzD8X73VLWZbM65FxB0BUetNptaY0u6S4J01R4WD0VON1TtzvtapHDd76n67RcZVV0WM4Sp5OeSQ8lpD','2015-03-22 18:06:55'),(29,'UDdUz2dVn4p1wKPXd9VBF3WlkEoRLbWFO9zncNjARIBotqmGAhifleAGTYxF9ukYDUlQIFqzo2YRtky3CQiX5TEYRbD1FYZjTlaB','2015-03-22 18:07:48'),(29,'rsY0t4ig57ygVkt8yyYoTfjcUNMo6LOxdMyHRRXXYwdUQH2pf0N8g7lbV8z2Toz7a8O2ZMZYidS9UVzaVnjcvEnqNWsGk2NvbCya','2015-03-22 18:19:38'),(29,'Qj6i8d0in9zbyArDhV8BJmvDl67edcE4vKnEYnWlxww57YJoTRZDevgzCnNQzrV5ciJaFGvdd2jk02IUUIx8eNIRawIKXDQaWzkB','2015-03-22 18:48:55'),(26,'VBRpOY7nBZTU8e03xfzxU888K9U2bMj6oavc9DAKDuFLIFPgUoNPxVXi5SkgEEn3OSfYwPI9knU23KjY86NG2KY7DiohXLlMEAKa','2015-03-22 19:20:50'),(26,'qRBTJ3B3FRVSVHejmF7k9nBN5zbTJH39zF2iIDlovhgrZvKlaSGkfh7lQjez0iIzXKSGoe4TvkkuP5P0XvkdNszDLNdM5Wm3GeJ5','2015-03-22 19:35:47'),(26,'vBEyI4Zdx4w5EyzVYr6aJJrtrg7l7fEDQibzmaMUfjZTRzPQ0V0JEsd6JkrRz5uqoGZKRMF66EZYePPeLQYqibw2wYT54ows4vdV','2015-03-22 19:37:03'),(26,'rpCV1VbZTZRqLhUeGmKGkC2sEE5rkBqM02I1YT1RSTiEacSRzCxUfAmTerkz2Km3N44LY6DRZVva7n1H0zBf9X8oosYrdlv0qAMo','2015-03-22 19:37:43'),(29,'XvK1tKxed1EYiGsQ0WWzYLcF9zQBhaFfGph9aOonQ2m8IOZJKVjJGvoQ4frmq7B6xTfHHD4xGrGpfF80AsKhX972pzpPG1VdUbVB','2015-03-22 19:37:59'),(29,'OKmdIwlcLEJl7BIs6lfbOMPR7h8XfFt4pQi7mDj7h3spEbRKx7WmULd13lYi0snpiFxFiRNAUgZzsRj0YfmT1AU4VTnWlKlEqSjI','2015-03-22 19:41:15'),(29,'xSPaLE5U2VMdtuRLZvAMLQgAasiJwvO4nEe8jk3lgPzJkqvjW56HVmi6OBPl6EpuiEDBZGXfwwZQXuaTAgBwDUCsvrNC5d6oSJ0R','2015-03-23 23:02:46'),(29,'pM9Fxqb8terL6OvYm0DasgH56C25mHgLtpr0QD9jRA4XpzVMzzX1PF7Vha1DRipkIQlytuRk5Wivvdh5Me7CUeyboAPfSeAA4V8y','2015-03-23 23:03:04'),(29,'ATsje7SOMAW9Ti44l4Q6GloHl1Q84MRFFjZTqRHcrEllXpqiuhoaCNSYOI7TuYyahx3IoLVQqhcnHDFbU4lxSevHXDAsB8CTGGB5','2015-03-23 23:03:21'),(29,'HU8gaYWGDYUBox8QH28kdKvazlc1ek0Ve8cp685K70lwxtmfwuAJe6UNr7PFrPBGXN54WaO4b9AJDWY9ryTFEOt6VjLm8n36b9a7','2015-03-30 02:57:33'),(34,'e3kLHp9OFHiF5gql80vcGffeBeYAIhaWkvI2USQAz9fEqF0yGwKnL0CneAYXR8TcDCfyu584fnJF3JdJfY71YJpdknacv4o9GDHb','2015-03-30 03:00:04'),(26,'cxKYbMhzbRMH5u2i1Ry9QeMtcSiSY6EbEp9Pbqonhb5nF8GGZeQQtCjFvBytIcEmCObOeAbwLhUqpA7oOXehAyX5avySIdfk2r9g','2015-03-30 03:01:16'),(29,'PDayj1Vf0auPetZCkYE4kMOI19I2whFlUQUdSQtS0XIfqHRLGwQ0iEJkOrnkI2FCTAQLqjDqglGH3xsJ3iJmXsHLT45C7Lf0l5LL','2015-03-30 03:01:46'),(26,'3bjvUm9euPFWOPL5pGO9F4ybkFER7TPa59G0wPe0FUWtKIz9poj4sRgMxUEEOuOUEvUal8a037uNP3XergjU8zHFumjiQ8duD7FZ','2015-03-31 19:04:52'),(29,'jiBK0mFc8Te5hLG3Ib1QsmGWBTHxUmwdF7XGuDTCw7HNTnRCzSt1e9XQ2FnW1TaH18nwLg8ioQ6hdXUNQnO5wMVzriwtcGadPyJA','2015-03-31 19:05:03'),(29,'FlAK2UMQ2ouopUDaskNFXJHFIQjwvXObioWljIcm7GLxBoH3JuIHdqmWgGsMDgXWFThZCtlJa6gLvXPesyWGYiCeY50BmXy2RP1t','2015-03-31 21:23:33'),(29,'6VM92GPDXMyqByN1oPPShTfkiociwKHCFtMHaCl7pTx1sk3QaSJsMYM4nYnTI4woyi6IVsQkmnmOIpFSiok4n79K5xDOB9d9skSo','2015-03-31 21:23:43'),(26,'8z5Sp18bvaCB0i7NpSmc29Y8EQX5t6VCG0u62DixNU9OdhCD9YPc7OkMFiS9oOL5OfbRStpGoyvCP8fZ65ceUw1zOTIdHuiwKunD','2015-03-31 21:24:22'),(29,'nsD2EPVmS6ucN6zDzDf2kXMWwM6ERSsfl5hZVdmNjR07XAKxdZzyWmut9A80tBgPGxOBKbp42pc0ZWxdW7LTufmDQvEk6U9NsYpd','2015-03-31 23:38:30'),(29,'YGjxHo4FPEfvfv35vH4ZVWzb02P4jeBhVUPCjTh9ywEN1ISxpXwlU5wU8lZsAAJvuy7OsoX0VBOWkHuKE05z6CtfYtHy3r4y0bmt','2015-04-01 02:35:57'),(26,'GkpZvhVTLrqAh1i6TXRK0Vg9SdA9daTUuiT0zOUkgkVymdEgbv0brhkjuUtI5mCzEwAeluzCPuabHOrSkr4MJo6djzWoVzYA6zOr','2015-04-03 03:02:06'),(35,'STTo7JItHzD8rgrl0lrel79u7wqX4clW5fldY4HFDkO4AfqBARQWZ0r6xR3B4py9FUnDY4jBo7GZn6BYYrVXsm4Zd7Ahx9rc3PQ1','2015-04-05 21:23:18'),(36,'GG5uw00d3UF9E4uAnmXQaEVLwuk24bfLRkfnlgBobhxPl2qJpnAz1vlx0GA5RPQJa67wmIUx0snlvN5UaFubbPJbvjgn976kdeQA','2015-04-05 23:07:57'),(29,'ti3lQNK82KQk0WISp0smeQjOoAD7tzmXRqiIe3QgNHAODjH3j9qy0Jmoj0wNzSKrj39x60OUHoIlHqo1zOAAyWYRWuEvnpXHs6fz','2015-04-06 02:15:26'),(29,'UPHGflteiJWvc2mHoiaAvCyXIgqaFpYzeFfu1JJjsFPFIbm6txHY9fWSwn3bM1K1H0wIJf2cVSRD3eKxLrwUHtMdQPpCRaEyaahU','2015-04-06 02:24:59'),(26,'TFOM0K5Zt6ar4OPxVWHX7PSLAQU9WgKQVzDWjIWNP6fTV5rQ18N8YFUzwOJt4tj03WXnFUau0poWuQNwZBEXhyxNmhhrLAsOxqbd','2015-04-11 02:39:55'),(26,'Hki9cN3CTIy64AzUONV88eUgLkNT6InO2GXft0RnJquN03IPRDYZSSfDd3wkLU9OA6447WsRmWFn0ncS1aRT37xha4CWYLLzRPDZ','2015-04-11 02:47:20'),(26,'AUinEPJXx0xbi1wKFKsceBDaxodgE3dfXwCClmzSm63E8zpOkS1ztEJ03WhHZvWX1zzmV9figjWpTmddefMHTvIWr0ErwBpxbZU7','2015-04-11 02:47:41'),(29,'vw2xSyoHg4WmxWyHyxLDQS8n2RMdXmmsTp0LXotesqA0m8IVGtzwmHUoyHCw3ZZXoZJmncAQCbQZkyV02uxobsNK9qhdpgaNfT9D','2015-04-11 18:26:52'),(26,'ranroDKF0XTNmRM4vhdiEWi6mEUptc5VnsnL68r65kTscGxIXL0BHiI3XCtrPymc1KX8SoeYJ8rWOZEMKEnsW5wUIZlxyHJzsHHl','2015-04-11 18:28:04'),(29,'6WkP5LLUKpGv44X1atVStgq1Y9AqRiMXf6MkSyeDYV82Z649AZ23gs4eCFFtXrqdydxrLM4KHdNGkRQURSX7k2lWH0qFsQT13qsP','2015-04-11 18:31:06'),(29,'GdxrgjmaIelfpRCdxL0kaiNHnhtYBVEh8cJpw5zekVuJM7XkTYE3gsKEKeCl9gDitmHZsheNcIxYQuiJsXMJpwn9LZvUg8cKvUJY','2015-04-11 21:46:58'),(26,'ypuIq8Pd2G7y5cAajOEvMUvoyjSI3ccCBHl2QafSRnqWA07TPMpCHV0ffTXi5aVHRgJHrZAin0fX1nRR9gtQbu5qn3JtdFa4VUMm','2015-04-12 17:43:20'),(26,'t3nMyZVpQPI9ckRbHurkM0hShWWBpS7TVuFutBTkqBtDVkPDOgYBhftzcpaBihudMaHgMBAdc3Q8oFMdWLOd1hMdHXPZfkd1uUig','2015-04-12 17:59:27'),(26,'uD1YhF3CUwIXsqGGCHFwcuYoebosNCwifxhxdk97RR4jiLZUtErF9p3nBsPo4mHkUYR7j1faSjub5t5y8wdiWhFxJvWOSD9MC1TV','2015-04-12 18:01:12'),(26,'XJANN5cO5kU3ADzRc7lKutnBo3sVxUevEPirUug0Pa3qNDhZKCKf68RubjpIeEeStwko1ApRKthy7zySci7irYMCiclwQzok6IJ8','2015-04-12 18:01:35'),(26,'ckjIRZ4GS8YvSycpiMXSjHzoJG1yRSK4c3M43QKWZIrRhDhAqfsJW18GI9ez1ZEe2qi6h32hMt937qExF6hC7qiQzxqBw4Qzv9FM','2015-04-12 18:02:06'),(26,'TmFhnVeoj6fsnJjzdp0AsK4GpfLl9xH3UnkijzGCFW52GpCTOCuhmyYLNJ6XhO1ccluwVb8B7eEODgHsScKeLI0zr7wJVxV8TpEP','2015-04-12 18:04:36'),(26,'yZVHE6wmtzGiyRDvhf821cq0TfXW5zIEyEldKRAergxZ8avpqDrsQStJ8qGdZoSy2dMN5m2wDAwLK1bbFDDvv6fDxVRxkJ6nXSa2','2015-04-12 18:10:00'),(26,'11ZnoNykrWTBZypM6vn3C748E7vCJDyLEx92lHnNDhoDPNpWjN0WU44yczbVcJGRhPUCwipazONpBdmV0mRUrVtDvEzIngzF5uhC','2015-04-12 18:10:18'),(29,'j9Z3ChCKQaC2tJlUI7w0jRwarVuxEeFXnF10WDKMNmPg5abOiIOCzlM1ghzUveRSUSSQwCDjZtA5DMTWuHy43l5jCEd7T50NYSEu','2015-04-12 18:10:24'),(26,'vhOuKpzobslFaTJdeOxRtLYmRYaPROkn58RQxrfIUAn5u7jJVQAoCyLtxVipJCMPLEGi5V1Zwp40woJsejRQSCjqyCPifC80gOjl','2015-04-12 18:10:46'),(26,'HwueIzmZ1IOQBPnxyHMcgxQlPyaFbUfSrK69jt9lbXbNNzklh7yyFpTuX3a8Yq0pa7zuAIQMF2zsCUOT2mrHLkcIonRnORMZZmtA','2015-04-12 18:11:17'),(26,'cH3Zad3iDHQjN7WVxeL7McIihyRMHwyUeCTpPWHtDxNqFJmdY8lKk33BCUnkrWeFz75p4MSHkG80pueoDz8XDczf6XzyTOetWjS0','2015-04-12 18:11:50'),(26,'NKvszXZ8EOsMKIOXdBlxjKPPo3bEUA9HkFaUCa2hYv4IdSGqu1XOMMEbPPPJpYrKDCEgMHxKcBtpu9PZbNNXzr8phX9GWBrzd6QZ','2015-04-12 18:20:44'),(26,'wNVVL3DpuFV2aIo3rR5gSYXIHhXHiv6Oj2K56nuA3pDd81hzTmQLlOu25rKnXRchTWm0jRAnheApfRZ9eQVzEpBKQm7Odj57gs7A','2015-04-12 18:22:04'),(26,'MHMmvAM7N92NwUHXPbBlPa3drDSw8a9VRWhnw4ujdx6JrOHh0iCPtG3UkWrs6AnYxFl3JQnXnuHOio5jHI9aoc5J9wbg7zeEfAIZ','2015-04-12 18:22:33'),(26,'ANqI14wFke7dqRsbAsK1AhKwOGEI5jxF6Xn82TNn8VAyN3Jnwup6LaCzQhiVAPAGNYOPSCc0xNykQiHmM6syh487mq2WfDD3CsSu','2015-04-12 18:23:24'),(29,'pEyw99xGu3e1caf0mCUyT2K26X0bkQWKuugEENl8Rz93Kp361YFU1qX7nYjHOgrjKIXowjxnTHrD6vK7tq1uQZCdYWVMcn5W53lB','2015-04-12 18:27:31'),(29,'lGSPFJhDCjrQXqzZR9CRFFoHLkfGqN5MtYC9ITNkdfaaFKaxUMozsNge8wUzk0lOZYYHSL150cgGWqdQcCqFqHTydN7yNtmMrktj','2015-04-12 18:29:50'),(26,'6vp7IFNE51viDWX4DQCQEJprdLeE6IYcenjW36B876rL3oPGfsxTcWlpHz4Ni2Zwqistp3Cxa3jdr8THBqANmVc4vgSNiRkJaMcA','2015-04-12 18:31:24'),(26,'WjVltYZtxP859ArzhQcjXkSYrzdZ5IO21KnuImYgc6mmGNVXE8gCs9ATINTOwIQxse2bA0sN6O9MC5Jhd0TFatzThsHNbylDMnPn','2015-04-12 18:31:40'),(26,'44uBS3VImD48KwH1BP8YfbUvPxyrZqV4vqFntB6PeaYYHFZju8hKjcf9KNAKevOKVt8p4efjpeh6UhqppH9JUoSEcsorYdbUGkkL','2015-04-12 18:32:21'),(29,'vZEgmrluzkLpdKIMM6ZUnd2mehwSRy4myIDU9YoJi99vTSiFZiAmvCJKUgCLOG8mpLgzKFj3PtzJlRplaZHGBrqwH3iwKqS9c9JW','2015-04-12 18:34:31'),(29,'6LIrrRrRmGfZfoWSAw7HtHgmvuPrOIsVtamV1OMnu1mJqjC0PKIirYFXtvphdRcH1zC3noqSqNCQ7eRWYzfqxUn0pMiDDvkF5WIt','2015-04-12 18:35:35'),(26,'btxSjezS3UJS5nlFpBRTO1slT8y8tmnEQVw9961c0K558rLx2CqQETcx2LGv839YYG88NalNUrT3SFAUi1LWVYtXJatSdCQcjZl6','2015-04-12 22:42:04');
/*!40000 ALTER TABLE `apiKey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commentReports`
--

DROP TABLE IF EXISTS `commentReports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commentReports` (
  `reportId` int(11) NOT NULL AUTO_INCREMENT,
  `commentId` int(11) NOT NULL,
  `reporterId` int(11) DEFAULT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`reportId`),
  KEY `reporter_fk_idx` (`reporterId`),
  KEY `comment_fk_idx` (`commentId`),
  CONSTRAINT `comment_fk` FOREIGN KEY (`commentId`) REFERENCES `comments` (`comment_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commentReports`
--

LOCK TABLES `commentReports` WRITE;
/*!40000 ALTER TABLE `commentReports` DISABLE KEYS */;
INSERT INTO `commentReports` VALUES (1,3,29,'2015-04-09 21:56:22');
/*!40000 ALTER TABLE `commentReports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text,
  `fromUserId` int(11) NOT NULL,
  `toUserId` int(11) NOT NULL,
  `imageurl` text,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_id`),
  KEY `fk_table1_users_idx` (`fromUserId`),
  KEY `fk_table1_users1_idx` (`toUserId`),
  CONSTRAINT `fk_table1_users` FOREIGN KEY (`fromUserId`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_table1_users1` FOREIGN KEY (`toUserId`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (3,'Comment3',29,26,NULL,'2015-04-06 02:35:06'),(8,'Comment8',29,26,NULL,'2015-04-06 02:20:16'),(12,'hello',26,29,'resources/img/uploaded/1428779256images.jpg','2015-04-11 19:10:58'),(13,'hello',29,29,'resources/img/uploaded/1428779256images.jpg','2015-04-11 19:12:50'),(14,'hello',29,26,'resources/img/uploaded/1428779256images.jpg','2015-04-11 19:13:32'),(15,'test',29,26,'resources/img/uploaded/1428779785images.jpg','2015-04-11 19:16:25'),(16,'lala',29,26,'','2015-04-11 19:35:46'),(17,'sin imagen',29,26,'','2015-04-11 19:37:37'),(18,'no image',29,26,'','2015-04-12 00:20:52'),(19,'sin image 2',29,26,NULL,'2015-04-12 00:24:44'),(20,'',29,26,NULL,'2015-04-12 15:10:34'),(21,'',29,26,'resources/img/uploaded/1428851449images.jpg','2015-04-12 15:10:49'),(22,'',29,26,'resources/img/uploaded/1428851468images.jpg','2015-04-12 15:11:08'),(23,'',29,26,'resources/img/uploaded/1428851470images.jpg','2015-04-12 15:11:10'),(24,'',29,26,'resources/img/uploaded/1428851500images.jpg','2015-04-12 15:11:40'),(25,'',29,26,'resources/img/uploaded/1428851522images.jpg','2015-04-12 15:12:02'),(26,'alohaaa',29,26,'resources/img/uploaded/1428851730images.jpg','2015-04-12 15:15:30'),(27,'hehehe',29,26,'resources/img/uploaded/1428851894images.jpg','2015-04-12 15:18:14'),(28,'jjjj',29,26,'resources/img/uploaded/1428851938images.jpg','2015-04-12 15:18:58'),(29,'kjhkjh<div><br></div>',29,26,'resources/img/uploaded/1428852058images.jpg','2015-04-12 15:20:58'),(30,'test',29,26,'resources/img/uploaded/1428852351images.jpg','2015-04-12 15:25:51'),(31,'hdhd',29,26,'resources/img/uploaded/1428852388images.jpg','2015-04-12 15:26:28'),(32,'ja<div>ja</div><div>ja</div><div>ja</div><div><br></div>',29,26,NULL,'2015-04-12 19:21:58');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pictures`
--

DROP TABLE IF EXISTS `pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pictures` (
  `path` text,
  `user_id` int(11) NOT NULL,
  KEY `fk_pictures_users1_idx` (`user_id`),
  CONSTRAINT `fk_pictures_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pictures`
--

LOCK TABLES `pictures` WRITE;
/*!40000 ALTER TABLE `pictures` DISABLE KEYS */;
/*!40000 ALTER TABLE `pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(20) NOT NULL,
  `website` varchar(70) DEFAULT NULL,
  `usertype` enum('STUDENT','PROFESSOR') NOT NULL DEFAULT 'STUDENT',
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `profileimg` text,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `username_2` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('manny','$2y$10$DzQDzpDDl9qITWec7nLdWusGS472XJhDbQqGYc9N2zT1L73rHzTEG',26,'manny01@manny.com',NULL,'PROFESSOR','Manny','Wilson',0,'resources/img/profile/Masoud_milani.jpg'),('javier','$2y$10$Ds0OGUEGsFdB8tp/enG4zO.YjEfRLZq5kIjYZNc4xNmII.fBkqYqy',29,'asd@asd.com',NULL,'STUDENT','Javier','Carmona',NULL,'resources/img/profile/user3.jpg'),('hola','$2y$10$2J.fv22dbz8BzaNgJWx2FuqT1xZf4yyI4vEwphZd3O8GEi8scyaBG',31,'hola@hola.com',NULL,'STUDENT',NULL,NULL,NULL,NULL),('mannyw','$2y$10$ueCOZS7cqdLNVVB3lmGYjeFM8v5YwHab6MRZWFnk5cWraQO0qIeEe',33,'ahsdio@lkn.com',NULL,'STUDENT',NULL,NULL,NULL,NULL),('rachel','$2y$10$Y5508r5Zcm5KYP/XObqD2uUnBzIsXK66finN5r.ERODnsR2py4oV2',34,'rachel@gmail.com',NULL,'STUDENT','Rachel','Green',NULL,NULL),('silvia','$2y$10$95PwQyVItqUHIlhxbiSoWeJ/myXzCs4W3luCqvuE8I6XELlXY5sR2',35,'sil81@gmail.com',NULL,'PROFESSOR','silvia','lobato',0,NULL),('jorge','$2y$10$aSCNniIpowIc/aOVQmuZK.p.ILFw380BXdrHA6YIEpjUbj4pKJQn6',36,'morr09@gmail.com',NULL,'PROFESSOR','Jorge','Morrina',NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-13 21:01:38
