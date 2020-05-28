<?php

if (empty($_GET['id'])){
    $errMsg = "ID не был введён!";
    echo $errMsg;
} else {
    $entry = $news->showNews($_GET['id']);

    if (!$entry) {
        echo "Такой записи не существует";
        echo "<hr> <a href='{$_SERVER['PHP_SELF']}'>Назад</a>";
    } else {
        $dt = date("d-m-Y H:m:i", $entry['datetime']);
        echo "<hr> <a href='{$_SERVER['PHP_SELF']}'>Назад</a> <br>";
        echo "№: {$entry['id']} <br>";
        echo "Заголовок: {$entry['title']} <br>";
        echo "Категория: {$entry['category']} <br>";
        echo "Описание: {$entry['description']} <br>";
        echo "Ресурс: {$entry['source']} <br>";
        echo "Время: {$dt} <br>";
    }
}