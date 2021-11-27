-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 24 Lis 2021, 10:16
-- Wersja serwera: 10.4.21-MariaDB
-- Wersja PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `bazy_danych`
--

-- --------------------------------------------------------

CREATE TABLE `twitch_tv_en_monthly_perform` (
  `id` bigint(20) NOT NULL,
  `active_days` decimal(2,0) NOT NULL,
  `name_id` bigint(20) NOT NULL,
  `hours_streams` decimal(3,0) NOT NULL,
  `hours_watched` int(10) UNSIGNED NOT NULL CHECK (`hours_watched` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `twitch_tv_en_monthly_perform`
--

INSERT INTO `twitch_tv_en_monthly_perform` (`id`, `active_days`, `name_id`, `hours_streams`, `hours_watched`) VALUES
(1, '29', 1, '268', 19568606);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `twitch_tv_en_streamer`
--

CREATE TABLE `twitch_tv_en_streamer` (
  `id` bigint(20) NOT NULL,
  `name` longtext COLLATE utf8_polish_ci NOT NULL,
  `followers` int(10) UNSIGNED NOT NULL,
  `avg_viewers` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL
) ;

--
-- Zrzut danych tabeli `twitch_tv_en_streamer`
--

INSERT INTO `twitch_tv_en_streamer` (`id`, `name`, `followers`, `avg_viewers`, `date`) VALUES
(1, 'xqcow', 9502028, 73006, '2014-09-13');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `twitch_tv_en_streamers_stat`
--

CREATE TABLE `twitch_tv_en_streamers_stat` (
  `id` bigint(20) NOT NULL,
  `name_id` bigint(20) NOT NULL,
  `total_hours_streamed` int(10) UNSIGNED NOT NULL CHECK (`total_hours_streamed` >= 0),
  `highest_values_of_viewers` int(10) UNSIGNED NOT NULL CHECK (`highest_values_of_viewers` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `twitch_tv_en_streamers_stat`
--

INSERT INTO `twitch_tv_en_streamers_stat` (`id`, `name_id`, `total_hours_streamed`, `highest_values_of_viewers`) VALUES
(1, 1, 3840, 623617);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `twitch_tv_pl_streamer`
--

CREATE TABLE `twitch_tv_pl_streamer` (
  `id` bigint(20) NOT NULL,
  `name` longtext COLLATE utf8_polish_ci NOT NULL,
  `followers` int(10) UNSIGNED NOT NULL CHECK (`followers` >= 0),
  `avg_viewers` int(10) UNSIGNED NOT NULL CHECK (`avg_viewers` >= 0),
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `twitch_tv_pl_streamers_stat`
--

CREATE TABLE `twitch_tv_pl_streamers_stat` (
  `id` bigint(20) NOT NULL,
  `name_id` bigint(20) NOT NULL,
  `highest_values_of_viewers` int(10) UNSIGNED NOT NULL CHECK (`highest_values_of_viewers` >= 0),
  `total_hours_streamed` int(10) UNSIGNED NOT NULL CHECK (`total_hours_streamed` >= 0),
  `total_views` int(10) UNSIGNED NOT NULL CHECK (`total_views` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `twitch_tv_top_games`
--

CREATE TABLE `twitch_tv_top_games` (
  `id` bigint(20) NOT NULL,
  `name` longtext COLLATE utf8_polish_ci NOT NULL,
  `avg_viewers` int(10) UNSIGNED NOT NULL CHECK (`avg_viewers` >= 0),
  `avg_streaming_acc` int(10) UNSIGNED NOT NULL CHECK (`avg_streaming_acc` >= 0),
  `watch_time` int(10) UNSIGNED NOT NULL CHECK (`watch_time` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Indeksy dla tabeli `twitch_tv_en_monthly_perform`
--
ALTER TABLE `twitch_tv_en_monthly_perform`
  ADD PRIMARY KEY (`id`),
  ADD KEY `twitch_tv_en_monthly_perform_name_id_d7b31c64` (`name_id`);

--
-- Indeksy dla tabeli `twitch_tv_en_streamer`
--
ALTER TABLE `twitch_tv_en_streamer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `twitch_tv_en_streamer_name_af46a454_uniq` (`name`) USING HASH;

--
-- Indeksy dla tabeli `twitch_tv_en_streamers_stat`
--
ALTER TABLE `twitch_tv_en_streamers_stat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `twitch_tv_en_streamers_stat_name_id_5a71f0cc` (`name_id`);

--
-- Indeksy dla tabeli `twitch_tv_pl_streamer`
--
ALTER TABLE `twitch_tv_pl_streamer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `twitch_tv_pl_streamer_name_f0eb29b0_uniq` (`name`) USING HASH;

--
-- Indeksy dla tabeli `twitch_tv_pl_streamers_stat`
--
ALTER TABLE `twitch_tv_pl_streamers_stat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `twitch_tv_pl_streamers_stat_name_id_6c4dc9c8` (`name_id`);

--
-- Indeksy dla tabeli `twitch_tv_top_games`
--
ALTER TABLE `twitch_tv_top_games`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`) USING HASH;
  
--
-- AUTO_INCREMENT dla tabeli `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT dla tabeli `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT dla tabeli `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT dla tabeli `twitch_tv_en_monthly_perform`
--
ALTER TABLE `twitch_tv_en_monthly_perform`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `twitch_tv_en_streamer`
--
ALTER TABLE `twitch_tv_en_streamer`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `twitch_tv_en_streamers_stat`
--
ALTER TABLE `twitch_tv_en_streamers_stat`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `twitch_tv_pl_streamer`
--
ALTER TABLE `twitch_tv_pl_streamer`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `twitch_tv_pl_streamers_stat`
--
ALTER TABLE `twitch_tv_pl_streamers_stat`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `twitch_tv_top_games`
--
ALTER TABLE `twitch_tv_top_games`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Ograniczenia dla tabeli `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Ograniczenia dla tabeli `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ograniczenia dla tabeli `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ograniczenia dla tabeli `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ograniczenia dla tabeli `twitch_tv_en_monthly_perform`
--
ALTER TABLE `twitch_tv_en_monthly_perform`
  ADD CONSTRAINT `twitch_tv_en_monthly_name_id_d7b31c64_fk_twitch_tv` FOREIGN KEY (`name_id`) REFERENCES `twitch_tv_en_streamer` (`id`);

--
-- Ograniczenia dla tabeli `twitch_tv_en_streamers_stat`
--
ALTER TABLE `twitch_tv_en_streamers_stat`
  ADD CONSTRAINT `twitch_tv_en_streame_name_id_5a71f0cc_fk_twitch_tv` FOREIGN KEY (`name_id`) REFERENCES `twitch_tv_en_streamer` (`id`);

--
-- Ograniczenia dla tabeli `twitch_tv_pl_streamers_stat`
--
ALTER TABLE `twitch_tv_pl_streamers_stat`
  ADD CONSTRAINT `twitch_tv_pl_streame_name_id_6c4dc9c8_fk_twitch_tv` FOREIGN KEY (`name_id`) REFERENCES `twitch_tv_pl_streamer` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
