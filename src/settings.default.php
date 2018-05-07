<?php
	$env='DEV';

	$enviroments = [
		'DEV'   =>     ['host'=>'127.0.0.1',
						'user' => 'batman',
						'pass' => 'batman',
						'dbname' => 'nullpoin_open-fixture',
						'CORS_URL'=>'http://localhost:4200',
						'configuration' => [
							'settings' => ['displayErrorDetails' => true]]],
		'PROD'  =>      ['host'=>'127.0.0.1',
						'user' => 'usuario',
						'pass' => 'password',
						'dbname' => 'db_name',
						'CORS_URL'=>'url',
						'configuration' => [
							'settings' => ['displayErrorDetails' => false]]]
	];

	function get_var_enviroment($var_name){
		global $enviroments;
		global $env;
		return $enviroments[$env][$var_name];
	}
