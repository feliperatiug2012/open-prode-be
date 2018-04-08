<?php

class SuperAppEntity extends \Slim\App {

    public $dbConn;

    public function __construct(){
        parent::__construct();
        $this->dbConn = getEnviromentDataBase();
        
    }

    /************* GETTERS ***********/
    public function getConn(){
        return $this->dbConn;
    }

};

?>