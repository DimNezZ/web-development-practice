<?php




class SuperUser extends User implements ISuperUser, IAuthorizeUser {

    public $role;
    static $counter = 0;  

    public function __construct($name, $login, $password,$role){
        parent::__construct($name, $login, $password);
        $this->role = $role;
        SuperUser::$counter++;

    }    
    public function showInfo() {
        echo "Имя - " . $this->name . " Логин - " . $this->login . " Пароль - " . $this->password . " Роль - " . $this->role .PHP_EOL;
    }

    public function getInfo(){
        return [
            "name" => $this->name,
            "login" => $this->login,
            "password" => $this->password,
            "role" => $this->role
        ];
    }
    public function auth($login, $password){
        return ($this->login == $login) && ($this->password == $password);
    }
}