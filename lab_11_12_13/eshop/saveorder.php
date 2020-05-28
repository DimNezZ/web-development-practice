<?php
	require "inc/lib.inc.php";
	require "inc/config.inc.php";

	$name = mysqli_real_escape_string($link, trim(strip_tags($_POST['name'])));
	$email = mysqli_real_escape_string($link, trim(strip_tags($_POST['email'])));
	$phone = mysqli_real_escape_string($link, trim(strip_tags($_POST['phone'])));
	$address = mysqli_real_escape_string($link, trim(strip_tags($_POST['address'])));
	$datetime=time();
	$orderid=uniqid();
	$order=$name.'|'.$email.'|'.$phone.'|'.$address.'|'.$orderid.'|'.$datetime;
	$flink=fopen('admin/'.ORDERS_LOG,'a-');
	fputs($flink,$order.PHP_EOL);
	saveOrder($datetime,$orderid);
	fclose($flink);
?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Сохранение данных заказа</title>
</head>
<body>
	<p>Ваш заказ принят.</p>
	<p><a href="catalog.php">Вернуться в каталог товаров</a></p>
</body>
</html>