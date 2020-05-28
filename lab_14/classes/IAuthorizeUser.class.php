<?php

interface IAuthorizeUser{

    public function auth($login, $password);
}