<?php


	namespace OpenFixture\Entities;

	use Slim\App;
	use OpenFixture\Middlewares\CorsMiddleware;


	class SuperAppEntity extends App {

    public $dbConn;

    public function __construct(){
        parent::__construct();
        $this->dbConn = getEnviromentDataBase();
        $this->add(New CorsMiddleware());
    }

    /************* GETTERS ***********/
    public function getConn(){
        return $this->dbConn;
    }

};

?>