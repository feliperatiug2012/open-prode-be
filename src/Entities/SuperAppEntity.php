<?php


	namespace OpenFixture\Entities;

	use Slim\App;
	use OpenFixture\Middlewares\CorsMiddleware;


	class SuperAppEntity extends App {

    public $dbConn;

    public function __construct(){
        $conf= get_var_enviroment('configuration');
    	parent::__construct($conf);

        $this->dbConn = getEnviromentDataBase();
        $this->add(New CorsMiddleware());
    }

    /************* GETTERS ***********/
    public function getConn(){
        return $this->dbConn;
    }

};

?>