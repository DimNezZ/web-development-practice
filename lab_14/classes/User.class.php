<?php

class User extends UserAbstract {
    public $name;
    public $login;
    public $password;
    static $counter = 0;

    public function __construct($name, $login, $password){

        $this->name = $name;
        $this->login = $login;
        $this->password = $password;
        User::$counter++;
    }

    public function __destruct(){

        echo "Пользователь: " . $this->name . " удален" . PHP_EOL;
    }

    public function showInfo() {
        echo "Имя - " . $this->name . " Логин - " . $this->login . " Пароль - " . $this->password .PHP_EOL;
    }
}