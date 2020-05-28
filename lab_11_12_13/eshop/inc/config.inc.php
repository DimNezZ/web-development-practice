<?php

const DB_HOST = 'localhost';
const DB_LOGIN = 'root';
const DB_PASSWORD = 'root';
const DB_NAME = 'eshop';
const ORDERS_LOG = 'orders.log';

$basket = [];
$count = 0;

$link = mysqli_connect(DB_HOST, DB_LOGIN, DB_PASSWORD, DB_NAME);
if (!$link) {
    print("Ошибка: Невозможно установить соединение с MySQL.");
    exit;
}
// print("Соединение с MySQL установлено!" . PHP_EOL);
// print("Информация о сервере: " . mysqli_get_host_info($link) . PHP_EOL);
basketInit();