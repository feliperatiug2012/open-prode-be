<?php
	/**
	 * Created by PhpStorm.
	 * User: nullpointer13
	 * Date: 4/17/18
	 * Time: 12:29 AM
	 */
	namespace OpenFixture\Entities\User;
	use OpenFixture\Entities\Entity;
	use OpenFixture\Exceptions\DataBaseInsertException;
	use OpenFixture\Exceptions\DataBaseUpdateException;
	use PDOException;

	class UserEntity extends Entity
	{
		public $name;
		public $alias;
		public $username;
		public $picture;
		/**
		 * UserEntity constructor.
		 * @param array $data
		 * @param $db
		 */
		public function __construct(array $data, $db)
		{
			parent::__construct($data,$db);
			$this->name = $data['name'];
			$this->alias = $data['alias'];
			$this->username = $data['username'];
			$this->picture = $data['picture'];
		}

		public function getId(){
			if(isset($this->id))
				return $this->id;
			try {
				$sql = "SELECT id from users where username=:username";
				$stm=$this->db->prepare($sql);
				if(!$stm->execute([":username"=>$this->username]))
					return false;
				$stm=$stm->fetch();
			}
			catch(PDOException $e)
		    {
			    echo $sql . "<br>" . $e->getMessage();
		    }

		    if (isset($stm['id'])){
			    $this->id=$stm['id'];
				return $this->id;
		    }
			else
				return null;
		}

		/**
		 * @throws DataBaseInsertException
		 */
		protected function add(){
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
			return $this->getId();
		}

		/**
		 * @throws DataBaseUpdateException
		 */
		protected function update(){
			$stm=null;
			if(!isset($this->id))
				throw new DataBaseUpdateException("no se puede hacer el update sin un ID");

			try {
				$sql = "UPDATE users  SET title=:title, alias=:alias, picture_url=:picture WHERE id =:id";
				$stm=$this->db->prepare($sql);
				$result=$stm->execute([":title"=>$this->name, ":alias"=>$this->alias, ":picture"=>$this->picture, ":id"=>$this->id]);
				if (!$result)
					throw new DataBaseUpdateException("no se pudo agregar el usuario, username existente");
			}
			catch(PDOException $e)
			{
				echo $sql . "<br>" . $e->getMessage();
			}
			return $this->id;
		}
	}