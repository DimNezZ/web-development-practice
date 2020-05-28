<?php
/* Основные настройки */
const DB_HOST = 'localhost';
const DB_LOGIN = 'root';
const DB_PASSWORD = 'root';
const DB_NAME = 'gbook';
$link = mysqli_connect(DB_HOST,DB_LOGIN,DB_PASSWORD,DB_NAME);
/* Основные настройки */

/* Сохранение записи в БД */
if($_SERVER['REQUEST_METHOD'] == 'POST'){
    if (isset($_POST['name'], $_POST['email'], $_POST['msg'])) {
    $name = trim(strip_tags($_POST['name']));
    $email = trim(strip_tags($_POST['email']));
    $msg = trim(strip_tags($_POST['msg']));
    
    $sql = "
    INSERT INTO msgs (
    name, email, msg
    ) VALUES ('$name', '$email', '$msg')
    ";
    mysqli_query($link, $sql); 
    }
    }
/* Сохранение записи в БД */

/* Удаление записи из БД */

if ($_SERVER['REQUEST_METHOD']=='GET'){
	if (isset($_GET['del'])){
		$delid=(int)$_GET['del'];

		$sql="delete from msgs where id='$delid'";
		mysqli_query($link,$sql);
    }
}
		
		
/* Удаление записи из БД */
?>
<h3>Оставьте запись в нашей Гостевой книге</h3>

<form method="post" action="<?= $_SERVER['REQUEST_URI']?>">
Имя: <br /><input type="text" name="name" /><br />
Email: <br /><input type="text" name="email" /><br />
Сообщение: <br /><textarea name="msg"></textarea><br />

<br />

<input type="submit" value="Отправить!" />

</form>
<?php

/* Вывод записей из БД */

$output = "SELECT id, name, email, msg, UNIX_TIMESTAMP(datetime) as dt FROM msgs ORDER BY id DESC";
$result = mysqli_query($link, $output);
mysqli_close($link);
$row_count = mysqli_num_rows($result);
echo "<p>";
echo "Всего записей в гостевой книге:$row_count";
echo "</p>";

while($row = mysqli_fetch_assoc($result)){
echo "<p>";
echo "<a href='mailto:{$row["name"]}'>{$row['name']}</a>";
echo " " . date("d.m.Y в H:i:s", $row["dt"]) . " написал";
echo "<br />";
echo "{$row["msg"]}";
echo "</p>";
echo "<p align='right'>";
echo "<a href='http://mysite.local/index.php?id=gbook&del={$row[id]}'>Удалить</a>";
echo "</p>";
}

/* Вывод записей из БД */
?>