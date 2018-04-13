<?php

abstract class Mapper implements Imapper{
	/**
	 * @var PDO
	 */
	protected $db;

    public function __construct($db) {
        $this->db = $db;
    }

}
