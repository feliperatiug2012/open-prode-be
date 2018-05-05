<?php
	/**
	 * Created by PhpStorm.
	 * User: nullpointer13
	 * Date: 4/18/18
	 * Time: 9:44 PM
	 */

	namespace OpenFixture\Entities;


	use OpenFixture\Exceptions\DataBaseInsertException;
	use OpenFixture\Exceptions\DataBaseUpdateException;
	use PDOException;

	abstract class Entity
	{
		/**
		 * @var \PDO
		 */
		protected $db;
		public $id;
		static protected $table_name;

		/**
		 * Entity constructor.
		 * @param array $data
		 * @param $db \PDO
		 */
		public function __construct(array $data, $db)
		{
			$this->db=$db;
			if(isset($data['id']))
			{
				$this->id=$data['id'];
			}	
			else
				$this->id=$this->getId();
		}
		/**
		 * @throws DataBaseUpdateException
		 * @throws DataBaseInsertException
		 */
		public function save()
		{
			$this->id=$this->getId();
			if (!isset($this->id))
				return $this->add();
			else
				return $this->update();
		}
		abstract public function getId();
		abstract protected function update();
		abstract protected function add();



	}