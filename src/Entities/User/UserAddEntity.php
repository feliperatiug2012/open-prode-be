<?php
	/**
	 * Created by PhpStorm.
	 * User: nullpointer13
	 * Date: 4/17/18
	 * Time: 12:29 AM
	 */
	namespace OpenFixture\Entities\User;
	use http\Url;
	use OpenFixture\Exceptions\DataBaseInsertException;
	use OpenFixture\Interfaces\IAddEntity;
	use PDOException;

	class UserAddEntity implements IAddEntity
	{
		public $name;
		public $alias;
		public $username;
		public $picture;
		/**
		 * @var \PDO
		 */
		protected $db;

		/**
		 * UserAddEntity constructor.
		 * @param array $data
		 * @param \PDO $db
		 */
		public function __construct(array $data, $db)
		{
			$this->db=$db;
			$this->name = $data['name'];
			$this->alias = $data['alias'];
			$this->username = $data['username'];
			$this->picture = $data['picture'];
		}

		/**
		 * @throws DataBaseInsertException
		 */
		public function save(){
			try {
				$sql = "INSERT INTO users (title, alias,username, picture_url)VALUES (:title, :alias, :username, :picture)";
				$stm=$this->db->prepare($sql);
				$result=$stm->execute([":title"=>$this->name, ":alias"=>$this->alias, ":username"=>$this->username, ":picture"=>$this->picture]);
				if (!$result)
					throw new DataBaseInsertException("no se pudo agregar el usuario, username existente");
			}
			catch(PDOException $e)
		    {
			    echo $sql . "<br>" . $e->getMessage();
		    }

		}
	}