<?php
	error_reporting(E_ALL & ~E_NOTICE & ~E_DEPRECATED);
	ini_set('display_errors', 1);
	require_once 'settings.php';
//	require_once 'Interfaces/Imapper.php';
//	require_once 'Middlewares/CorsMiddleware.php';
	function getEnviromentDataBase() {
		global $env, $enviroments;

		$dbCfg=$enviroments[$env];
		$pdo = new PDO("mysql:host=".$dbCfg['host'].";dbname=".$dbCfg['dbname'].";charset=utf8",
			$dbCfg['user'],
			$dbCfg['pass']);
		$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		$pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
		return $pdo;
	}


