-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 01 2019 г., 02:07
-- Версия сервера: 10.3.13-MariaDB
-- Версия PHP: 5.6.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `rbs_books_shop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `rbs_authors`
--

CREATE TABLE `rbs_authors` (
  `id` int(11) NOT NULL,
  `author` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `rbs_authors`
--

INSERT INTO `rbs_authors` (`id`, `author`) VALUES
(1, 'author 1'),
(2, 'author 2'),
(3, 'author 3'),
(4, 'author 4'),
(5, 'author 5'),
(6, 'author 6'),
(7, 'author 7'),
(8, 'author 8'),
(9, 'author 9'),
(10, 'author 10'),
(11, 'author 11'),
(12, 'author 12');

-- --------------------------------------------------------

--
-- Структура таблицы `rbs_books`
--

CREATE TABLE `rbs_books` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` int(11) NOT NULL,
  `discount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `rbs_books`
--

INSERT INTO `rbs_books` (`id`, `title`, `description`, `price`, `discount`) VALUES
(1, 'title 1', 'Some description', 500, 50),
(2, 'title 2', 'Some description', 299, 30),
(3, 'title 3', 'Some description', 499, NULL),
(4, 'title 4', 'Some description', 500, 20),
(5, 'title 5', 'Some description', 199, 10),
(6, 'title 6', 'Some description', 999, NULL),
(7, 'title 7', 'Some description', 659, NULL),
(8, 'title 8', 'Some description', 479, NULL),
(9, 'title 9', 'Some description', 739, NULL),
(10, 'title 10', 'Some description', 819, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `rbs_books_authors`
--

CREATE TABLE `rbs_books_authors` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `rbs_books_authors`
--

INSERT INTO `rbs_books_authors` (`id`, `book_id`, `author_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 9, 10),
(11, 10, 11),
(12, 10, 12);

-- --------------------------------------------------------

--
-- Структура таблицы `rbs_books_genres`
--

CREATE TABLE `rbs_books_genres` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Дамп данных таблицы `rbs_books_genres`
--

INSERT INTO `rbs_books_genres` (`id`, `book_id`, `genre_id`) VALUES
(1, 1, 3),
(2, 1, 4),
(3, 2, 2),
(4, 3, 3),
(5, 4, 5),
(6, 5, 6),
(7, 5, 7),
(8, 6, 2),
(9, 7, 1),
(10, 8, 5),
(11, 9, 6),
(12, 10, 6),
(13, 4, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `rbs_carts`
--

CREATE TABLE `rbs_carts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `rbs_carts_books`
--

CREATE TABLE `rbs_carts_books` (
  `id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `rbs_cart_statuses`
--

CREATE TABLE `rbs_cart_statuses` (
  `id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `rbs_cart_statuses`
--

INSERT INTO `rbs_cart_statuses` (`id`, `status`) VALUES
(1, 'open'),
(2, 'finished'),
(3, 'canceled');

-- --------------------------------------------------------

--
-- Структура таблицы `rbs_genres`
--

CREATE TABLE `rbs_genres` (
  `id` int(11) NOT NULL,
  `genre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `rbs_genres`
--

INSERT INTO `rbs_genres` (`id`, `genre`) VALUES
(1, 'horror'),
(2, 'comedy'),
(3, 'drama'),
(4, 'biography'),
(5, 'fantasy'),
(6, 'history'),
(7, 'tragedy');

-- --------------------------------------------------------

--
-- Структура таблицы `rbs_orders`
--

CREATE TABLE `rbs_orders` (
  `id` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `status_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `rbs_orders_books`
--

CREATE TABLE `rbs_orders_books` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `rbs_order_statuses`
--

CREATE TABLE `rbs_order_statuses` (
  `id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `rbs_order_statuses`
--

INSERT INTO `rbs_order_statuses` (`id`, `status`) VALUES
(1, 'accepted'),
(2, 'executed'),
(3, 'completed'),
(4, 'canceled');

-- --------------------------------------------------------

--
-- Структура таблицы `rbs_payments`
--

CREATE TABLE `rbs_payments` (
  `id` int(11) NOT NULL,
  `payment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `rbs_payments`
--

INSERT INTO `rbs_payments` (`id`, `payment`) VALUES
(1, 'cash'),
(2, 'credit card');

-- --------------------------------------------------------

--
-- Структура таблицы `rbs_roles`
--

CREATE TABLE `rbs_roles` (
  `id` int(11) NOT NULL,
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `rbs_roles`
--

INSERT INTO `rbs_roles` (`id`, `role`) VALUES
(1, 'admin'),
(2, 'user');

-- --------------------------------------------------------

--
-- Структура таблицы `rbs_users`
--

CREATE TABLE `rbs_users` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL,
  `password` varchar(128) NOT NULL,
  `role_id` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `rbs_authors`
--
ALTER TABLE `rbs_authors`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `rbs_books`
--
ALTER TABLE `rbs_books`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `rbs_books_authors`
--
ALTER TABLE `rbs_books_authors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `author_id` (`author_id`);

--
-- Индексы таблицы `rbs_books_genres`
--
ALTER TABLE `rbs_books_genres`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `genre_id` (`genre_id`);

--
-- Индексы таблицы `rbs_carts`
--
ALTER TABLE `rbs_carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Индексы таблицы `rbs_carts_books`
--
ALTER TABLE `rbs_carts_books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_id` (`cart_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Индексы таблицы `rbs_cart_statuses`
--
ALTER TABLE `rbs_cart_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `rbs_genres`
--
ALTER TABLE `rbs_genres`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `rbs_orders`
--
ALTER TABLE `rbs_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `payment_id` (`payment_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `rbs_orders_books`
--
ALTER TABLE `rbs_orders_books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Индексы таблицы `rbs_order_statuses`
--
ALTER TABLE `rbs_order_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `rbs_payments`
--
ALTER TABLE `rbs_payments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `rbs_roles`
--
ALTER TABLE `rbs_roles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `rbs_users`
--
ALTER TABLE `rbs_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `rbs_authors`
--
ALTER TABLE `rbs_authors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `rbs_books`
--
ALTER TABLE `rbs_books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `rbs_books_authors`
--
ALTER TABLE `rbs_books_authors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `rbs_books_genres`
--
ALTER TABLE `rbs_books_genres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `rbs_carts`
--
ALTER TABLE `rbs_carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `rbs_carts_books`
--
ALTER TABLE `rbs_carts_books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `rbs_cart_statuses`
--
ALTER TABLE `rbs_cart_statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `rbs_genres`
--
ALTER TABLE `rbs_genres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `rbs_orders`
--
ALTER TABLE `rbs_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `rbs_orders_books`
--
ALTER TABLE `rbs_orders_books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `rbs_order_statuses`
--
ALTER TABLE `rbs_order_statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `rbs_payments`
--
ALTER TABLE `rbs_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `rbs_roles`
--
ALTER TABLE `rbs_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `rbs_users`
--
ALTER TABLE `rbs_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `rbs_books_authors`
--
ALTER TABLE `rbs_books_authors`
  ADD CONSTRAINT `rbs_books_authors_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `rbs_authors` (`id`),
  ADD CONSTRAINT `rbs_books_authors_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `rbs_books` (`id`);

--
-- Ограничения внешнего ключа таблицы `rbs_books_genres`
--
ALTER TABLE `rbs_books_genres`
  ADD CONSTRAINT `rbs_books_genres_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `rbs_books` (`id`),
  ADD CONSTRAINT `rbs_books_genres_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `rbs_genres` (`id`);

--
-- Ограничения внешнего ключа таблицы `rbs_carts`
--
ALTER TABLE `rbs_carts`
  ADD CONSTRAINT `rbs_carts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `rbs_users` (`id`),
  ADD CONSTRAINT `rbs_carts_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `rbs_cart_statuses` (`id`);

--
-- Ограничения внешнего ключа таблицы `rbs_carts_books`
--
ALTER TABLE `rbs_carts_books`
  ADD CONSTRAINT `rbs_carts_books_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `rbs_carts` (`id`),
  ADD CONSTRAINT `rbs_carts_books_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `rbs_books` (`id`);

--
-- Ограничения внешнего ключа таблицы `rbs_orders`
--
ALTER TABLE `rbs_orders`
  ADD CONSTRAINT `rbs_orders_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `rbs_order_statuses` (`id`),
  ADD CONSTRAINT `rbs_orders_ibfk_2` FOREIGN KEY (`payment_id`) REFERENCES `rbs_payments` (`id`),
  ADD CONSTRAINT `rbs_orders_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `rbs_users` (`id`);

--
-- Ограничения внешнего ключа таблицы `rbs_users`
--
ALTER TABLE `rbs_users`
  ADD CONSTRAINT `rbs_users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `rbs_roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
