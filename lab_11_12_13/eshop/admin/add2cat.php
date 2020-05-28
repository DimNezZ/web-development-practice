<?
	require "secure/session.inc.php";
	if (isset($_COOKIE['error'])) {
		$error = $_COOKIE['error'];
		setcookie('error', '', time() - 1);
	}
?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Форма добавления товара в каталог</title>
	<style>
		.error {
			margin: 10px;
			padding: 10px;
			border-radius: 5px;
			border: 1px solid #b3443c;
			font-family: sans-serif;
			background: #e6b5b5;
			color: #842f2c;
		}
	</style>
</head>
<body>
	<form action="save2cat.php" method="post">
		<p>Название: <input type="text" name="title" size="100">
		<p>Автор: <input type="text" name="author" size="50">
		<p>Год издания: <input type="text" name="pubyear" size="4">
		<p>Цена: <input type="text" name="price" size="6"> руб.
		<p><input type="submit" value="Добавить">
	</form>
	<? if (isset($error)) {
		print('<p class="error">' . $error . '</p>');
	} ?>
</body>
</html>