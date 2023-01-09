-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 24 Eyl 2022, 17:20:24
-- Sunucu sürümü: 10.5.12-MariaDB-cll-lve
-- PHP Sürümü: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `u521963930_web_project`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `adresler`
--

CREATE TABLE `adresler` (
  `id` int(11) NOT NULL,
  `sehirId` int(11) NOT NULL,
  `ilce` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cadde` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mahalle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sokak` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `binaNo` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `daireNo` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `adresler`
--

INSERT INTO `adresler` (`id`, `sehirId`, `ilce`, `cadde`, `mahalle`, `sokak`, `binaNo`, `daireNo`) VALUES
(82, 6, 'pendik', 'Barbaros Caddesi', 'Kaynarca Mahallesi', 'Serhat Sokak', '34', '7'),
(86, 6, 'pendik', 'Barbaros Caddesi', 'Kaynarca Mahallesi', 'Serhat Sokak', '34', '7'),
(87, 6, 'pendik', 'Barbaros Caddesi', 'Kaynarca Mahallesi', 'Serhat Sokak', '34', '7'),
(88, 6, 'pendik', 'Barbaros Caddesi', 'Kaynarca Mahallesi', 'Serhat Sokak', '34', '7'),
(89, 6, 'pendik', 'Barbaros Caddesi', 'Kaynarca Mahallesi', 'Serhat Sokak', '34', '7'),
(90, 16, 'sasaa', 'es', 'esne', 'es', '23', '12'),
(91, 6, 'qwe', 'asd', 'asdf', 'asd', '1', '12'),
(92, 34, 'Kartal', 'yok', 'Karliktepe Mah', 'Ekim Sokak', '38', '16');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `fatura`
--

CREATE TABLE `fatura` (
  `id` int(11) NOT NULL,
  `tutar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kesimTarihi` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `fatura`
--

INSERT INTO `fatura` (`id`, `tutar`, `kesimTarihi`) VALUES
(1, '250000', '2022-05-05');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kullanicilar`
--

CREATE TABLE `kullanicilar` (
  `id` int(11) NOT NULL,
  `tcNo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isim` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `soyisim` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefon` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dogumTarihi` date DEFAULT NULL,
  `eMail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sifre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresId` int(11) DEFAULT NULL,
  `siparisId` int(11) DEFAULT NULL,
  `aktif` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `kullanicilar`
--

INSERT INTO `kullanicilar` (`id`, `tcNo`, `isim`, `soyisim`, `telefon`, `dogumTarihi`, `eMail`, `sifre`, `adresId`, `siparisId`, `aktif`) VALUES
(17, '1234563131', 'Yakup Yasin', 'Akdin', '05314284050', '2001-07-16', '1@kocaeli.edu.tr', '107030ca685076c0ed5e054e2c3ed940', 82, 17, 0),
(19, '3169316931', 'Serhat', 'Kaçmaz', '0533398887', '2022-04-25', '123@gmail.com', '202cb962ac59075b964b07152d234b70', 91, 19, 0),
(20, '1234567', 'Bilal', 'Ayyildiz', '05324856575', '2022-04-14', 'koc@gmail.com', '202cb962ac59075b964b07152d234b70', 90, 20, 1),
(21, NULL, 'Naciye', 'Esme', '5467894565', '2022-04-21', '54@gmail.com', '202cb962ac59075b964b07152d234b70', NULL, 21, 1),
(23, NULL, 'Barış', 'Adıgüzel', '05314241020', '2022-04-07', 'musteri@gmail.com', '202cb962ac59075b964b07152d234b70', NULL, NULL, 1),
(24, '354645', 'Selami', 'Ekber', '05314284051', '2022-05-05', '4@gmail.com', '202cb962ac59075b964b07152d234b70', NULL, 24, 1),
(25, NULL, 'deneme', 'deneme', '00000000', '2022-05-20', '5@gmail.com', '202cb962ac59075b964b07152d234b70', NULL, 25, 1),
(26, '123123321312', 'Barış', 'Adıgüzel', '54812361782', '2000-04-12', 'barisadiguzel379@gmail.com', 'd41d8cd98f00b204e9800998ecf8427e', 92, 26, 1),
(27, NULL, 'Hakan', 'Yılmaz', '54812361782', '1993-06-08', 'hakan.yilmaz@gmail.com', '202cb962ac59075b964b07152d234b70', NULL, 27, 1),
(28, NULL, 'Barış', 'Adıgüzel', '152345678', '2022-05-05', '16@gmail.com', '202cb962ac59075b964b07152d234b70', NULL, 28, 0),
(29, NULL, 'ZORT', 'MuStAfA', '05435313713', '2001-07-16', 'zortumzortsunzort@hotmail.com', '2609be642aa331517da6d9c3078ac4ea', NULL, NULL, 1),
(30, NULL, 'ZORT', 'MuStAfA', '05435313713', '2001-07-16', 'zortumzortsunzort@hotmail.com', '2609be642aa331517da6d9c3078ac4ea', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `marka`
--

CREATE TABLE `marka` (
  `id` int(11) NOT NULL,
  `isim` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `marka`
--

INSERT INTO `marka` (`id`, `isim`) VALUES
(0, 'Renault'),
(1, 'Opel'),
(3, 'Mercedes'),
(4, 'Seat'),
(5, 'Fiat');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `model`
--

CREATE TABLE `model` (
  `id` int(11) NOT NULL,
  `isim` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `marka` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `model`
--

INSERT INTO `model` (`id`, `isim`, `marka`) VALUES
(1, 'Astra', 1),
(2, 'Symbol', 0),
(3, 'Leon', 4),
(4, 'Doblo', 5),
(5, 'Benz', 3);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sehirler`
--

CREATE TABLE `sehirler` (
  `plakaKodu` int(11) NOT NULL,
  `isim` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `sehirler`
--

INSERT INTO `sehirler` (`plakaKodu`, `isim`) VALUES
(1, 'adana'),
(2, 'adıyaman'),
(6, 'Ankara'),
(16, 'Bursa'),
(34, 'istanbul'),
(41, 'kocaeli'),
(53, 'Rize'),
(54, 'Sakarya'),
(55, 'Samsun'),
(77, 'Yalova'),
(81, 'Düzce');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sepet`
--

CREATE TABLE `sepet` (
  `id` int(11) NOT NULL,
  `musteriNo` int(11) NOT NULL,
  `urunKodu` int(11) NOT NULL,
  `adet` int(11) NOT NULL,
  `durum` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `sepet`
--

INSERT INTO `sepet` (`id`, `musteriNo`, `urunKodu`, `adet`, `durum`) VALUES
(34, 19, 10, 1, 1),
(36, 19, 14, 1, 0),
(37, 19, 15, 1, 1),
(38, 19, 6, 1, 0),
(39, 20, 10, 1, 0),
(40, 20, 26, 1, 0),
(41, 20, 15, 1, 0),
(46, 17, 11, 1, 1),
(47, 17, 18, 1, 1),
(48, 24, 11, 1, 1),
(49, 24, 9, 1, 1),
(50, 24, 12, 1, 1),
(51, 25, 14, 1, 1),
(52, 25, 31, 1, 1),
(53, 25, 10, 1, 1),
(54, 25, 12, 1, 1),
(55, 21, 10, 1, 1),
(56, 21, 11, 1, 1),
(57, 26, 6, 1, 1),
(58, 26, 10, 1, 1),
(59, 26, 15, 1, 1),
(60, 27, 10, 1, 1),
(61, 27, 11, 1, 1),
(62, 28, 6, 1, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `siparis`
--

CREATE TABLE `siparis` (
  `id` int(11) NOT NULL,
  `kullaniciSiparisId` int(11) NOT NULL,
  `siparisTarih` date NOT NULL,
  `fatura` int(11) NOT NULL,
  `siparisDurum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `siparis`
--

INSERT INTO `siparis` (`id`, `kullaniciSiparisId`, `siparisTarih`, `fatura`, `siparisDurum`) VALUES
(1, 19, '2022-05-12', 1, 2),
(3, 20, '2022-05-03', 1, 2),
(9, 17, '0001-01-01', 1, 1),
(10, 24, '0001-01-01', 1, 1),
(11, 24, '0001-01-01', 1, 1),
(12, 25, '0001-01-01', 1, 1),
(13, 25, '0001-01-01', 1, 1),
(14, 25, '0001-01-01', 1, 1),
(15, 21, '0001-01-01', 1, 1),
(16, 26, '0001-01-01', 1, 1),
(17, 27, '0001-01-01', 1, 1),
(18, 28, '0001-01-01', 1, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `siparisDurum`
--

CREATE TABLE `siparisDurum` (
  `id` int(11) NOT NULL,
  `aciklama` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `siparisDurum`
--

INSERT INTO `siparisDurum` (`id`, `aciklama`) VALUES
(1, 'Onaylandı'),
(2, 'Onaylanmadı'),
(3, 'Bekliyor');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tasitlar`
--

CREATE TABLE `tasitlar` (
  `id` int(11) NOT NULL,
  `ad` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fiyat` bigint(20) NOT NULL,
  `model` int(11) NOT NULL,
  `stokAdet` int(11) NOT NULL,
  `resimUrl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aciklama` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `aktif` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `tasitlar`
--

INSERT INTO `tasitlar` (`id`, `ad`, `fiyat`, `model`, `stokAdet`, `resimUrl`, `aciklama`, `aktif`) VALUES
(6, 'Mavi Deniz', 500000, 3, 100, 'img/items/leon.jpg', 'deneme güncelleme', 1),
(7, 'Beyaz Gölge', 543000, 3, 25, 'img/items/leon2.jpg', 'Bu Araba Sizi Çok Güçlü Yapacak', 0),
(8, 'Siyah Işık', 495000, 3, 20, 'img/items/leon3.jpg', 'Bu Araba Sizi Çok Güçlü Yapacak', 0),
(9, 'Kırmızı Gül', 487000, 3, 19, 'img/items/leon4.jpg', 'Bu Araba Sizi Çok Güçlü Yapacak', 1),
(10, 'Yer Fırtınası', 520000, 3, 12, 'img/items/leon5.jpg', 'Bu Araba Sizi Çok Güçlü Yapacak', 1),
(11, 'Tank Gibi Araba', 600000, 5, 15, 'img/items/benz1.jpeg', 'Detay Sevenler İçin Tasarlandı', 1),
(12, 'Arabanın hası Mercedes', 685000, 5, 5, 'img/items/benz2.jpg', 'Detay Sevenler İçin Tasarlandı', 1),
(13, 'Gri Fırtını', 1000000, 5, 12, 'img/items/benz3.jpg', 'Detay Sevenler İçin Tasarlandı', 1),
(14, 'Yer Uçağı', 15000000, 5, 2, 'img/items/benz4.jpg', 'Detay Sevenler İçin Tasarlandı', 1),
(15, 'Alman Denildi Mi?', 1200000, 5, 45, 'img/items/benz5.jpg', 'Detay Sevenler İçin Tasarlandı', 1),
(16, 'Kırmızı Opel Astra', 260000, 1, 10, 'img/items/astra1.jpg', 'Hız İsteyenler İçin', 1),
(17, 'Beyaz Gölge', 500000, 1, 25, 'img/items/a2.jpeg', 'Hız İsteyenler İçin', 1),
(18, 'Bu Güzellik Sınırlı Sayıda', 500000, 1, 10, 'img/items/a3.jpeg', 'Hız İsteyenler İçin', 1),
(19, 'Kırmızı Pençe', 275000, 1, 100, 'img/items/a4.jpeg', 'Hız İsteyenler İçin', 1),
(20, 'Gri kertenkele', 275000, 1, 5, 'img/items/a5.jpeg', 'Hız İsteyenler İçin', 1),
(21, 'Büyük Depolama Alanı', 280000, 4, 130, 'img/items/doblo1.jpg', 'Enişteler İçin Tasarlandı', 1),
(22, 'Büyük Depolama Alanı', 280000, 4, 130, 'img/items/doblo1.jpg', 'Enişteler İçin Tasarlandı', 1),
(23, 'Kahverengi Silüet', 275000, 4, 5, 'img/items/doblo3.jpg', 'Enişteler İçin Tasarlandı', 1),
(24, 'Mavi Ay', 250000, 4, 25, 'img/items/doblo4.jpg', 'Enişteler İçin Tasarlandı', 1),
(25, 'Eski Ve Gösterişli', 275000, 4, 25, 'img/items/doblo5.jpg', 'Enişteler İçin Tasarlandı', 1),
(26, 'Kahverengi Roman', 275000, 2, 100, 'img/items/symbol1.jpg', 'Hafiflik Severler İçin', 1),
(29, 'Hafif Kaçar', 275000, 2, 10, 'img/items/1.jpeg', 'Hafiflik Severler İçin', 1),
(30, 'Hafif Kaçar Az Yakar', 275000, 2, 25, 'img/items/2.jpeg', 'Hafiflik Severler İçin', 1),
(31, 'Az Yakar Çok Yakar', 275000, 2, 25, 'img/items/3.jpeg', 'Hafiflik Severler İçin', 1),
(32, 'Beyaz Silüet', 275000, 2, 100, 'img/items/4.jpeg', 'Hafiflik Severler İçin', 0),
(34, 'Fiat', 230000, 4, 5, 'img/items/letgo_4.jpg', 'Fiat Mavi', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yonetici`
--

CREATE TABLE `yonetici` (
  `id` int(11) NOT NULL,
  `tcNo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ad` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `soyad` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `eMail` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sifre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `yonetici`
--

INSERT INTO `yonetici` (`id`, `tcNo`, `ad`, `soyad`, `eMail`, `sifre`) VALUES
(1, '29390112312', 'Yakup Yasin', 'Akdin', 'admin@kocaeli.edu.tr', '202cb962ac59075b964b07152d234b70');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `adresler`
--
ALTER TABLE `adresler`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sehirFK` (`sehirId`);

--
-- Tablo için indeksler `fatura`
--
ALTER TABLE `fatura`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `kullanicilar`
--
ALTER TABLE `kullanicilar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adresFK` (`adresId`),
  ADD KEY `siparisFK` (`siparisId`);

--
-- Tablo için indeksler `marka`
--
ALTER TABLE `marka`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `model`
--
ALTER TABLE `model`
  ADD PRIMARY KEY (`id`),
  ADD KEY `markaFK` (`marka`);

--
-- Tablo için indeksler `sehirler`
--
ALTER TABLE `sehirler`
  ADD PRIMARY KEY (`plakaKodu`);

--
-- Tablo için indeksler `sepet`
--
ALTER TABLE `sepet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `musteriFK` (`musteriNo`),
  ADD KEY `tasitFK` (`urunKodu`);

--
-- Tablo için indeksler `siparis`
--
ALTER TABLE `siparis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `siparisDurumFK` (`siparisDurum`),
  ADD KEY `faturaFK` (`fatura`),
  ADD KEY `siparisIdFK` (`kullaniciSiparisId`);

--
-- Tablo için indeksler `siparisDurum`
--
ALTER TABLE `siparisDurum`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `tasitlar`
--
ALTER TABLE `tasitlar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `modelFK` (`model`);

--
-- Tablo için indeksler `yonetici`
--
ALTER TABLE `yonetici`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `adresler`
--
ALTER TABLE `adresler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- Tablo için AUTO_INCREMENT değeri `fatura`
--
ALTER TABLE `fatura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `kullanicilar`
--
ALTER TABLE `kullanicilar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Tablo için AUTO_INCREMENT değeri `model`
--
ALTER TABLE `model`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `sepet`
--
ALTER TABLE `sepet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- Tablo için AUTO_INCREMENT değeri `siparis`
--
ALTER TABLE `siparis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Tablo için AUTO_INCREMENT değeri `siparisDurum`
--
ALTER TABLE `siparisDurum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `tasitlar`
--
ALTER TABLE `tasitlar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `adresler`
--
ALTER TABLE `adresler`
  ADD CONSTRAINT `sehirFK` FOREIGN KEY (`sehirId`) REFERENCES `sehirler` (`plakaKodu`);

--
-- Tablo kısıtlamaları `kullanicilar`
--
ALTER TABLE `kullanicilar`
  ADD CONSTRAINT `adresFK` FOREIGN KEY (`adresId`) REFERENCES `adresler` (`id`),
  ADD CONSTRAINT `siparisFK` FOREIGN KEY (`siparisId`) REFERENCES `siparis` (`kullaniciSiparisId`);

--
-- Tablo kısıtlamaları `model`
--
ALTER TABLE `model`
  ADD CONSTRAINT `markaFK` FOREIGN KEY (`marka`) REFERENCES `marka` (`id`);

--
-- Tablo kısıtlamaları `sepet`
--
ALTER TABLE `sepet`
  ADD CONSTRAINT `musteriFK` FOREIGN KEY (`musteriNo`) REFERENCES `kullanicilar` (`id`),
  ADD CONSTRAINT `tasitFK` FOREIGN KEY (`urunKodu`) REFERENCES `tasitlar` (`id`);

--
-- Tablo kısıtlamaları `siparis`
--
ALTER TABLE `siparis`
  ADD CONSTRAINT `faturaFK` FOREIGN KEY (`fatura`) REFERENCES `fatura` (`id`),
  ADD CONSTRAINT `siparisDurumFK` FOREIGN KEY (`siparisDurum`) REFERENCES `siparisDurum` (`id`),
  ADD CONSTRAINT `siparisIdFK` FOREIGN KEY (`kullaniciSiparisId`) REFERENCES `sepet` (`musteriNo`);

--
-- Tablo kısıtlamaları `tasitlar`
--
ALTER TABLE `tasitlar`
  ADD CONSTRAINT `modelFK` FOREIGN KEY (`model`) REFERENCES `model` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
