<?
$filename = dirname(__DIR__) . '/log/' . PATH_LOG;
if(file_exists($filename)){

$f = fopen($filename, "r");
$lines = [];
$lines[] = $line;
while ( $line = fgets($f) ){
    $journal = explode("|", $line);
    echo sprintf("%s - %s -> %s<br>", date('d-m-Y H:i:s', $journal[0]), $journal[1], $journal[2]);
}
fclose($f);
}
