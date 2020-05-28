-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 19 2020 г., 13:06
-- Версия сервера: 10.3.22-MariaDB
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `database`
--

-- --------------------------------------------------------

--
-- Структура таблицы `munko_classroom`
--

CREATE TABLE `munko_classroom` (
  `classroom_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `munko_classroom`
--

INSERT INTO `munko_classroom` (`classroom_id`, `name`) VALUES
(201, 'Математика'),
(202, 'Физика'),
(203, 'Химия'),
(204, 'Программирование'),
(205, 'Русский язык'),
(206, 'Биология'),
(207, 'География'),
(208, 'Литература'),
(209, 'Высшая математика');

-- --------------------------------------------------------

--
-- Структура таблицы `munko_course`
--

CREATE TABLE `munko_course` (
  `course_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `special_id` int(11) NOT NULL,
  `hours` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `munko_course`
--

INSERT INTO `munko_course` (`course_id`, `name`, `special_id`, `hours`) VALUES
(1, 'Основы алгоритмизации', 1, 90),
(2, 'Электротехника', 3, 106),
(3, 'Основы алгоритмизации', 5, 52),
(4, 'Мультимедиа технологии', 1, 36),
(5, 'Техническая механика', 6, 96),
(6, 'Промышленная электротехника', 4, 108),
(7, 'Автоматизированные информационные системы', 1, 86);

-- --------------------------------------------------------

--
-- Структура таблицы `munko_day`
--

CREATE TABLE `munko_day` (
  `day_id` tinyint(4) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `munko_day`
--

INSERT INTO `munko_day` (`day_id`, `name`) VALUES
(1, 'Понедельник'),
(2, 'Вторник'),
(3, 'Среда'),
(4, 'Четверг'),
(5, 'Пятница'),
(6, 'Суббота'),
(7, 'Воскресенье');

-- --------------------------------------------------------

--
-- Структура таблицы `munko_gender`
--

CREATE TABLE `munko_gender` (
  `gender_id` tinyint(4) NOT NULL,
  `name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `munko_gender`
--

INSERT INTO `munko_gender` (`gender_id`, `name`) VALUES
(1, 'Мужской'),
(2, 'Женский');

-- --------------------------------------------------------

--
-- Структура таблицы `munko_graduate`
--

CREATE TABLE `munko_graduate` (
  `graduate_id` int(11) NOT NULL,
  `gruppa_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `munko_graduate`
--

INSERT INTO `munko_graduate` (`graduate_id`, `gruppa_id`, `course_id`, `user_id`) VALUES
(1, 1, 7, 1),
(2, 2, 4, 2),
(3, 5, 1, 3),
(4, 4, 6, 4),
(5, 3, 5, 5),
(6, 6, 2, 1),
(7, 2, 2, 3),
(8, 2, 2, 1),
(9, 7, 7, 4),
(10, 6, 6, 3),
(11, 5, 5, 1),
(12, 4, 4, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `munko_graduate_time`
--

CREATE TABLE `munko_graduate_time` (
  `graduate_time_id` int(11) NOT NULL,
  `graduate_id` int(11) NOT NULL,
  `day_id` tinyint(4) NOT NULL,
  `lesson_num_id` int(11) NOT NULL,
  `classroom_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `munko_graduate_time`
--

INSERT INTO `munko_graduate_time` (`graduate_time_id`, `graduate_id`, `day_id`, `lesson_num_id`, `classroom_id`) VALUES
(1, 1, 1, 1, 201),
(2, 12, 5, 4, 204),
(3, 2, 7, 6, 206),
(4, 11, 2, 9, 209),
(5, 3, 3, 7, 207),
(6, 10, 4, 2, 202),
(7, 4, 1, 5, 205),
(8, 9, 2, 3, 203),
(9, 5, 3, 8, 208),
(10, 6, 4, 6, 206),
(11, 7, 6, 1, 201),
(12, 8, 7, 5, 205);

-- --------------------------------------------------------

--
-- Структура таблицы `munko_gruppa`
--

CREATE TABLE `munko_gruppa` (
  `gruppa_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `special_id` int(11) NOT NULL,
  `date_begin` date NOT NULL,
  `date_end` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `munko_gruppa`
--

INSERT INTO `munko_gruppa` (`gruppa_id`, `name`, `special_id`, `date_begin`, `date_end`) VALUES
(1, '101 ИС', 1, '2016-09-01', '2020-07-01'),
(2, '102 АС', 3, '2016-09-01', '2020-07-01'),
(3, '302 ИС', 1, '2014-09-01', '2018-07-01'),
(4, '302 АС', 3, '2014-09-01', '2018-07-01'),
(5, '202 С', 6, '2015-09-01', '2019-07-01'),
(6, '404 П', 5, '2014-09-01', '2017-07-01'),
(7, '303 ЭЛ', 4, '2014-09-01', '2018-07-01');

-- --------------------------------------------------------

--
-- Структура таблицы `munko_lesson_num`
--

CREATE TABLE `munko_lesson_num` (
  `lesson_num_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `time_lesson` time NOT NULL,
  `year_lesson` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `munko_lesson_num`
--

INSERT INTO `munko_lesson_num` (`lesson_num_id`, `name`, `time_lesson`, `year_lesson`) VALUES
(1, 'Математика', '01:00:00', 2016),
(2, 'Физика', '01:00:00', 2017),
(3, 'Химия', '01:00:00', 2015),
(4, 'Программирование ', '01:30:00', 2004),
(5, 'Русский язык', '01:30:00', 2015),
(6, 'Биология', '01:00:00', 2016),
(7, 'География', '01:00:00', 2015),
(8, 'Литература', '01:30:00', 2017),
(9, 'Высшая математика', '00:45:00', 2015);

-- --------------------------------------------------------

--
-- Структура таблицы `munko_otdel`
--

CREATE TABLE `munko_otdel` (
  `otdel_id` smallint(6) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `munko_otdel`
--

INSERT INTO `munko_otdel` (`otdel_id`, `name`) VALUES
(1, 'Информационные системы'),
(2, 'Технические специальности'),
(3, 'Автоматизация и управление');

-- --------------------------------------------------------

--
-- Структура таблицы `munko_special`
--

CREATE TABLE `munko_special` (
  `special_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `otdel_id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `munko_special`
--

INSERT INTO `munko_special` (`special_id`, `name`, `otdel_id`) VALUES
(1, 'Информационные системы', 1),
(2, 'Нефтегазовое дело', 2),
(3, 'Автоматизация и управление', 3),
(4, 'Электроснабжение', 3),
(5, 'Программное обеспечение ВТ и ПО', 1),
(6, 'Строительство и эксплуатация зданий и сооружений', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `munko_student`
--

CREATE TABLE `munko_student` (
  `user_id` bigint(20) NOT NULL,
  `gruppa_id` int(11) NOT NULL,
  `num_zach` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `munko_student`
--

INSERT INTO `munko_student` (`user_id`, `gruppa_id`, `num_zach`) VALUES
(6, 1, 'К1020'),
(7, 2, 'А5292'),
(8, 2, 'В8578'),
(9, 5, 'Р5285'),
(10, 4, 'Ф5285'),
(11, 1, 'К7485'),
(12, 3, 'А2585');

-- --------------------------------------------------------

--
-- Структура таблицы `munko_teacher`
--

CREATE TABLE `munko_teacher` (
  `user_id` bigint(20) NOT NULL,
  `otdel_id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `munko_teacher`
--

INSERT INTO `munko_teacher` (`user_id`, `otdel_id`) VALUES
(1, 1),
(2, 1),
(3, 2),
(5, 2),
(4, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `munko_user`
--

CREATE TABLE `munko_user` (
  `user_id` bigint(20) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `patronomic` varchar(50) NOT NULL,
  `login` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `gender_id` tinyint(4) NOT NULL,
  `birthday` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `munko_user`
--

INSERT INTO `munko_user` (`user_id`, `lastname`, `firstname`, `patronomic`, `login`, `pass`, `gender_id`, `birthday`) VALUES
(1, 'Иванов', 'Иван', 'Иванович', 'Ivan', '123456', 1, '1975-05-25'),
(2, 'Петров', 'Петр', 'Петрович', 'Petr', '123456', 1, '1980-08-06'),
(3, 'Козлов', 'Иван', 'Афанасьевич', 'Ivan', '123456', 1, '1985-04-15'),
(4, 'Чурюмова', 'Кристина', 'Федоровна', 'Kristina', '123456', 2, '1990-05-20'),
(5, 'Васильев', 'Феофан', 'Александрович', 'Feofan', '123456', 1, '1991-01-13'),
(6, 'Федорова', 'Милана', 'Андреевна', 'Milana', '123456', 2, '1998-04-15'),
(7, 'Нуржанов', 'Нуржан', 'Нуржанович', 'Nurjan', '123456', 1, '1999-09-18'),
(8, 'Канатов', 'Канат', 'Канатович', 'Kanat', '123456', 1, '1999-07-07'),
(9, 'Золотая', 'Ирина', 'Кайратовна', 'Irina', '123456', 2, '2000-09-14'),
(10, 'Серая', 'Арина', 'Радионовна', 'Arina', '123456', 2, '2001-10-29'),
(11, 'Петухов', 'Виталий', 'Фадеевич', 'Bitalii', '123456', 1, '2000-10-29'),
(12, 'Котова', 'Аурелия', 'Ароновна', 'Ayrelia', '123456', 2, '2002-12-19');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `munko_classroom`
--
ALTER TABLE `munko_classroom`
  ADD PRIMARY KEY (`classroom_id`);

--
-- Индексы таблицы `munko_course`
--
ALTER TABLE `munko_course`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `fk_special_id` (`special_id`);

--
-- Индексы таблицы `munko_day`
--
ALTER TABLE `munko_day`
  ADD PRIMARY KEY (`day_id`);

--
-- Индексы таблицы `munko_gender`
--
ALTER TABLE `munko_gender`
  ADD PRIMARY KEY (`gender_id`);

--
-- Индексы таблицы `munko_graduate`
--
ALTER TABLE `munko_graduate`
  ADD PRIMARY KEY (`graduate_id`),
  ADD KEY `fk_gruppa_id` (`gruppa_id`),
  ADD KEY `fk_course_id` (`course_id`),
  ADD KEY `fk_user_id` (`user_id`);

--
-- Индексы таблицы `munko_graduate_time`
--
ALTER TABLE `munko_graduate_time`
  ADD PRIMARY KEY (`graduate_time_id`),
  ADD KEY `fk_graduate_id` (`graduate_id`),
  ADD KEY `fk_day_id` (`day_id`),
  ADD KEY `fk_lesson_num_id` (`lesson_num_id`),
  ADD KEY `fk_classroom_id` (`classroom_id`);

--
-- Индексы таблицы `munko_gruppa`
--
ALTER TABLE `munko_gruppa`
  ADD PRIMARY KEY (`gruppa_id`),
  ADD KEY `fk_special_id` (`special_id`);

--
-- Индексы таблицы `munko_lesson_num`
--
ALTER TABLE `munko_lesson_num`
  ADD PRIMARY KEY (`lesson_num_id`);

--
-- Индексы таблицы `munko_otdel`
--
ALTER TABLE `munko_otdel`
  ADD PRIMARY KEY (`otdel_id`);

--
-- Индексы таблицы `munko_special`
--
ALTER TABLE `munko_special`
  ADD PRIMARY KEY (`special_id`),
  ADD KEY `fk_otdel_id` (`otdel_id`);

--
-- Индексы таблицы `munko_student`
--
ALTER TABLE `munko_student`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `fk_gruppa_id` (`gruppa_id`) USING BTREE;

--
-- Индексы таблицы `munko_teacher`
--
ALTER TABLE `munko_teacher`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `fk_otdel_id` (`otdel_id`);

--
-- Индексы таблицы `munko_user`
--
ALTER TABLE `munko_user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `fk_gender_id` (`gender_id`) USING BTREE;

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `munko_classroom`
--
ALTER TABLE `munko_classroom`
  MODIFY `classroom_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=210;

--
-- AUTO_INCREMENT для таблицы `munko_course`
--
ALTER TABLE `munko_course`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `munko_day`
--
ALTER TABLE `munko_day`
  MODIFY `day_id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `munko_gender`
--
ALTER TABLE `munko_gender`
  MODIFY `gender_id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `munko_graduate`
--
ALTER TABLE `munko_graduate`
  MODIFY `graduate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `munko_graduate_time`
--
ALTER TABLE `munko_graduate_time`
  MODIFY `graduate_time_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `munko_gruppa`
--
ALTER TABLE `munko_gruppa`
  MODIFY `gruppa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `munko_lesson_num`
--
ALTER TABLE `munko_lesson_num`
  MODIFY `lesson_num_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `munko_otdel`
--
ALTER TABLE `munko_otdel`
  MODIFY `otdel_id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `munko_special`
--
ALTER TABLE `munko_special`
  MODIFY `special_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `munko_user`
--
ALTER TABLE `munko_user`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `munko_course`
--
ALTER TABLE `munko_course`
  ADD CONSTRAINT `munko_course_ibfk_1` FOREIGN KEY (`special_id`) REFERENCES `munko_special` (`special_id`);

--
-- Ограничения внешнего ключа таблицы `munko_graduate`
--
ALTER TABLE `munko_graduate`
  ADD CONSTRAINT `munko_graduate_ibfk_1` FOREIGN KEY (`gruppa_id`) REFERENCES `munko_gruppa` (`gruppa_id`),
  ADD CONSTRAINT `munko_graduate_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `munko_course` (`course_id`),
  ADD CONSTRAINT `munko_graduate_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `munko_teacher` (`user_id`);

--
-- Ограничения внешнего ключа таблицы `munko_graduate_time`
--
ALTER TABLE `munko_graduate_time`
  ADD CONSTRAINT `munko_graduate_time_ibfk_1` FOREIGN KEY (`graduate_id`) REFERENCES `munko_graduate` (`graduate_id`),
  ADD CONSTRAINT `munko_graduate_time_ibfk_2` FOREIGN KEY (`day_id`) REFERENCES `munko_day` (`day_id`),
  ADD CONSTRAINT `munko_graduate_time_ibfk_3` FOREIGN KEY (`lesson_num_id`) REFERENCES `munko_lesson_num` (`lesson_num_id`),
  ADD CONSTRAINT `munko_graduate_time_ibfk_4` FOREIGN KEY (`classroom_id`) REFERENCES `munko_classroom` (`classroom_id`);

--
-- Ограничения внешнего ключа таблицы `munko_gruppa`
--
ALTER TABLE `munko_gruppa`
  ADD CONSTRAINT `munko_gruppa_ibfk_1` FOREIGN KEY (`special_id`) REFERENCES `munko_special` (`special_id`);

--
-- Ограничения внешнего ключа таблицы `munko_special`
--
ALTER TABLE `munko_special`
  ADD CONSTRAINT `munko_special_ibfk_1` FOREIGN KEY (`otdel_id`) REFERENCES `munko_otdel` (`otdel_id`);

--
-- Ограничения внешнего ключа таблицы `munko_student`
--
ALTER TABLE `munko_student`
  ADD CONSTRAINT `munko_student_ibfk_1` FOREIGN KEY (`gruppa_id`) REFERENCES `munko_gruppa` (`gruppa_id`),
  ADD CONSTRAINT `munko_student_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `munko_user` (`user_id`);

--
-- Ограничения внешнего ключа таблицы `munko_teacher`
--
ALTER TABLE `munko_teacher`
  ADD CONSTRAINT `munko_teacher_ibfk_1` FOREIGN KEY (`otdel_id`) REFERENCES `munko_otdel` (`otdel_id`),
  ADD CONSTRAINT `munko_teacher_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `munko_user` (`user_id`);

--
-- Ограничения внешнего ключа таблицы `munko_user`
--
ALTER TABLE `munko_user`
  ADD CONSTRAINT `munko_user_ibfk_1` FOREIGN KEY (`gender_id`) REFERENCES `munko_gender` (`gender_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
