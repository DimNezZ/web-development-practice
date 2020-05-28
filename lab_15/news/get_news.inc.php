
<?php

$res=$news->getNews();

if (!is_array($res)) {
    $errMsg = "Произошла ошибка при выводе новостной ленты";
    echo $errMsg;
} else {
    echo "Всего записей: " . count($res);



//Используя цикл выводим все новости со ссылкой на конкретную новость
    foreach ($res as $new) {
        $dt = date("d-m-Y H:m:i", $new['datetime']);
        echo "<hr> <a href='?id={$new['id']}'>№: {$new['id']}</a> <br>";
        echo "Заголовок: {$new['title']} <br>";
        echo "Категория: {$new['category']} <br>";
        echo "Описание: {$new['description']} <br>";
        echo "Ресурс: {$new['source']} <br>";
        echo "Время: {$dt} <br>";
    }
}