<?php

class SuperAppEntity extends \Slim\App {

    public $dbConn;

    public function __construct($cfg){
        parent::__construct($cfg);
        $this->dbConn = getEnviromentDataBase();
        
    }

    /************* GETTERS ***********/
    public function getConn(){
        return $this->dbConn;
    }

};

?>