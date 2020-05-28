<?php

if (empty($_POST['title']) or empty($_POST['description'])){
    $errMsg="Заполните все поля формы!";
} else {
    $title =       strip_tags($_POST['title']);
    $category =    $_POST['category'];
    $description = strip_tags($_POST['description']);
    $source =      strip_tags($_POST['source']);

    if (!$news->saveNews($title, $category, $description, $source)) {
        $errMsg = "Произошла ошибка при добавлении новости!";
    } else {
        header("Location: news.php");
        exit;
    }
}