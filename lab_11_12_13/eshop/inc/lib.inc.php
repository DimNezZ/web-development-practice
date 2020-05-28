<?php

function addItemToCatalog($link, $title, $author, $pubyear, $price) {
    $sql = 'INSERT INTO catalog (title, author, pubyear, price) VALUES (?, ?, ?, ?)';
    $stmt = mysqli_prepare($link, $sql);
    if (!$stmt = mysqli_prepare($link, $sql)) return false;

    mysqli_stmt_bind_param($stmt, "ssii", $title, $author, $pubyear, $price);
    mysqli_stmt_execute($stmt);
    mysqli_stmt_close($stmt);

    return true;
}

function selectAllItems($link){
    $sql = 'SELECT id, title, author, pubyear, price FROM catalog';
    if(!$result = mysqli_query($link, $sql))
    return false;
    $items = mysqli_fetch_all($result, MYSQLI_ASSOC);
    mysqli_free_result($result);
    return $items;
}

function saveBasket(){
    global $basket;
    $basket = base64_encode(serialize($basket));
    setcookie('basket', $basket, 0x7FFFFFFF);

}

function basketInit(){
    global $basket, $count;
    if(!isset($_COOKIE['basket'])){
    $basket = ['orderid' => uniqid()];
    saveBasket();
    }else{
    $basket = unserialize(base64_decode($_COOKIE['basket']));
    $count = count($basket) - 1;
    }
}

function add2Basket($id){
    global $basket;
    $basket[$id] = 1;
    saveBasket();
}

function myBasket(){
    global $link, $basket;
    $goods = array_keys($basket);
    array_shift($goods);
    if(!$goods)
    return false;
    $ids = implode(",", $goods);
    $sql = "SELECT id, author, title, pubyear, price
    FROM catalog WHERE id IN ($ids)";
    if(!$result = mysqli_query($link, $sql))
    return false;
    $items = result2Array($result);
    mysqli_free_result($result);
    return $items;
}

function result2Array($data){
    global $basket;
    $arr = [];
    while($row = mysqli_fetch_assoc($data)){
    $row['quantity'] = $basket[$row['id']];
    $arr[] = $row;
    }
    return $arr;
}

function deleteItemFromBasket($id){
    global $basket;
	unset ($basket[$id]);
	saveBasket();
}

function saveOrder($datetime,$orderid){
	global $link, $basket;
	$goods=myBasket();
	$stmt=mysqli_stmt_init($link);
	
	$sql='insert into orders (title, author, pubyear, price, quantity, orderid, datetime) values(?,?,?,?,?,?,?)';
	if (!mysqli_stmt_prepare($stmt,$sql)) return false;
	foreach($goods as $item){
		mysqli_stmt_bind_param($stmt,"ssiiisi",$item['title'], $item['author'], $item['pubyear'],$item['price'],$item['quantity'],$orderid,$datetime);
		mysqli_stmt_execute($stmt);
	}
	mysqli_stmt_close($stmt);
	setcookie('basket','',time(-3600));
    return true;
}

function getOrders(){
    global $link;
if(!is_file(ORDERS_LOG))
return false;
/* Получаем в виде массива персональные данные пользователей из файла */
$orders = file(ORDERS_LOG);
/* Массив, который будет возвращен функцией */
$allorders = [];
foreach ($orders as $order) {
list($name, $email, $phone, $address, $orderid, $date) = explode("|",
$order);
/* Промежуточный массив для хранения информации о конкретном заказе */
$orderinfo = [];
/* Сохранение информацию о конкретном пользователе */
$orderinfo["name"] = $name;
$orderinfo["email"] = $email;
$orderinfo["phone"] = $phone;
$orderinfo["address"] = $address;
$orderinfo["orderid"] = $orderid;
$orderinfo["date"] = $date;
/* SQL-запрос на выборку из таблицы orders всех товаров для конкретного
покупателя */
$sql = "SELECT title, author, pubyear, price, quantity
FROM orders
WHERE orderid = '$orderid' AND datetime = $date";
/* Получение результата выборки */
if(!$result = mysqli_query($link, $sql))
return false;
$items = mysqli_fetch_all($result, MYSQLI_ASSOC);
mysqli_free_result($result);
/* Сохранение результата в промежуточном массиве */
$orderinfo["goods"] = $items;
/* Добавление промежуточного массива в возвращаемый массив */
$allorders[] = $orderinfo;
}
return $allorders;
}
