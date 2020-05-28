<?
$dt = time();
$page = $_SERVER['REQUEST_URI'];
$ref = $_SERVER['HTTP_REFERER'];
$path = "$dt|$page|$ref" . PHP_EOL;

$filename = dirname(__DIR__) . '/log/' . PATH_LOG;
file_put_contents($filename, $path, FILE_APPEND);