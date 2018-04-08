<?php
$env='DEV';

$enviroments = [
    'DEV'   =>     ['host'=>'127.0.0.1',
                    'user' => 'batman',
                    'pass' => 'batman',
                    'dbname' => 'open_fixture'],
    
    'PROD'  =>      ['host'=>'127.0.0.1',
                    'user' => 'batman',
                    'pass' => 'batman',
                    'dbname' => 'open_fixture']
    
];

function getEnviromentDataBase(){
    global $env, $enviroments;

    $dbCfg=$enviroments[$env];
    echo "<pre>";
    var_dump($enviroments['DEV']);
    echo "</pre>";
    $pdo = new PDO("mysql:host=".$dbCfg['host'].";dbname=".$dbCfg['dbname'].";charset=utf8",
                    $dbCfg['user'],
                    $dbCfg['pass']);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
    return $pdo;
}

?>