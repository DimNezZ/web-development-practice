<?php

// подключение библиотек
require 'secure/session.inc.php';
require '../inc/lib.inc.php';
require '../inc/config.inc.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
	$title   = isset($_POST['title'])   ? $_POST['title']   : null;
	$author  = isset($_POST['author'])  ? $_POST['author']  : null;
	$pubyear = isset($_POST['pubyear']) ? $_POST['pubyear'] : null;
	$price   = isset($_POST['price'])   ? $_POST['price']   : null;

	if (
		$title == null ||
		$author == null ||
		$pubyear == null ||
		$price == null
	) {
		setcookie('error', 'Вы что-то не ввели');
		header('Location: add2cat.php');

		exit;
	}

	if (!addItemToCatalog($link, $title, $author, $pubyear, $price)) {
		print('Произошла ошибка при добавлении товара в каталог' . PHP_EOL);
	} else {
		header('Location: add2cat.php');

		exit;
	}
}