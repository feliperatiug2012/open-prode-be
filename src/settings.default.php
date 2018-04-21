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

	function get_var_enviroment($var_name){
		global $enviroments;
		global $env;
		return $enviroments[$env][$var_name];
	}

