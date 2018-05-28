<?php
	$env='DEV';

	$enviroments = [
		'DEV'   =>     [
			'host'=>'127.0.0.1',
			'user' => 'batman',
			'pass' => 'batman',
			'dbname' => 'nullpoin_open-fixture',
			'CORS_URL'=>'http://localhost:4200',
			'configuration' => [
				'settings' => ['displayErrorDetails' => true]],
			'auth0_tenant' => 'https://no_se_debe_publicar_en_github.com',
			'auth0-encrypt-algorithm' => 'RS256',
			'jwt-over-https' => false],
		'PROD'  =>      [
			'host'=>'127.0.0.1',
			'user' => 'batman',
			'pass' => 'batman',
			'dbname' => 'nullpoin_open-fixture',
			'CORS_URL'=>'http://localhost:4200',
			'configuration' => [
				'settings' => ['displayErrorDetails' => true]],
			'auth0_tenant' => 'https://no_se_debe_publicar_en_github.com',
			'auth0-encrypt-algorithm' => 'RS256',
			'jwt-over-https' => false],
	];

	function get_var_enviroment($var_name){
		global $enviroments;
		global $env;
		return $enviroments[$env][$var_name];
	}
