<?php

spl_autoload_register(function ($class) {
    include_once('classes/' . $class . '.class.php');
});

header("content-type:text/plain");


$user1 = new User("Иван","Ivan","12345");
$user2 = new User("Петр","Petr","54321");
$user3 = new User("Виктор","Victor","12321");
$user4 = new SuperUser("Елисей","Elisei","00000","Богатырь");
$user5 = new SuperUser("Илья","Ilya","11111","Человек");

echo "Всего обычных пользователей: " . (User::$counter - SuperUser::$counter) .PHP_EOL;
echo "Всего супер-пользователей: " . SuperUser::$counter .PHP_EOL;

// $user1->name="Иван ";
// $user1->login="Ivan ";
// $user1->password="12345 ";

// $user2->name="Петр ";
// $user2->login="Petr ";
// $user2->password="54321 ";

// $user3->name="Виктор ";
// $user3->login="Victor ";
// $user3->password="12321 ";

$user1->showInfo();
$user2->showInfo();
$user3->showInfo();
$user4->showInfo();

print_r($user4->getInfo());

var_dump($user5->auth("Ilya","11111"));





?>