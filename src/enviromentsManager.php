<?php
	require_once 'settings.php';
	require_once 'interfaces/Imapper.php';
	require_once 'middlewares/CorsMiddleware.php';
	function getEnviromentDataBase(){
		global $env, $enviroments;

		$dbCfg=$enviroments[$env];
		$pdo = new PDO("mysql:host=".$dbCfg['host'].";dbname=".$dbCfg['dbname'].";charset=utf8",
			$dbCfg['user'],
			$dbCfg['pass']);
		$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		$pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
		return $pdo;
	}


