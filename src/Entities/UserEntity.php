<?php
	/**
	 * Created by PhpStorm.
	 * User: nullpointer13
	 * Date: 4/17/18
	 * Time: 12:29 AM
	 */
	namespace OpenFixture\Entities {

//	use OpenFixture\Entities\Entity;
		use OpenFixture\Exceptions\DataBaseInsertException;
		use OpenFixture\Exceptions\DataBaseUpdateException;
		use PDOException;

		class UserEntity extends Entity
		{
			public $name;
			public $alias;
			public $username;
			public $picture_url;
			public $approved;
			public $approver_id;
			public $date_approved;

			/**
			 * UserEntity constructor.
			 * @param array $data
			 * @param $db
			 */
			public function __construct(array $data, $db)
			{
				parent::__construct($data, $db);
				$this->username = $data['username'];
				$this->getId();

				if ($this->id) {
					$query = "SELECT * FROM users U WHERE U.id=:user_id";
					$stmt = $this->db->prepare($query);
					$stmt->execute([":user_id" => $this->id]);
					$user = $stmt->fetchAll()[0];
					$data=array_merge($user,$data);
				}
				$this->name = $data['title'];
				$this->alias = $data['alias'];
				$this->picture_url = $data['picture'];
				$this->approver_id = $data['approver_id'];
				$this->date_approved = $data['date_approved'];
				$this->approved = $data['approved'];
				$this->picture_url =$data['picture_url'];

			}

			public function getId()
			{
				if (isset($this->id))
					return $this->id;
				try {
					$sql = "SELECT id from users where username=:username";
					$stm = $this->db->prepare($sql);
					if (!$stm->execute([":username" => $this->username]))
						return false;
					$stm = $stm->fetch();
				} catch (PDOException $e) {
					echo $sql . "<br>" . $e->getMessage();
				}

				if (isset($stm['id'])) {
					$this->id = $stm['id'];
					return $this->id;
				} else
					return null;
			}

			/**
			 * @throws DataBaseInsertException
			 */
			protected function add()
			{
				try {
					$sql = "INSERT INTO users (title, alias,username, picture_url)VALUES (:title, :alias, :username, :picture)";
					$stm = $this->db->prepare($sql);
					$result = $stm->execute([":title" => $this->name, ":alias" => $this->alias, ":username" => $this->username, ":picture" => $this->picture_url]);
					if (!$result)
						throw new DataBaseInsertException("no se pudo agregar el usuario, username existente");
				} catch (PDOException $e) {
					echo $sql . "<br>" . $e->getMessage();
				}
				return $this->getId();
			}

			/**
			 * @throws DataBaseUpdateException
			 */
			protected function update()
			{
				$stm = null;
				if (!isset($this->id))
					throw new DataBaseUpdateException("no se puede hacer el update sin un ID");
				try {
//					if ($this->alias && !($this->name && $this->picture)) {
//						$sql = "UPDATE users  SET  alias=:alias WHERE id =:id";
//						$stm = $this->db->prepare($sql);
//						$result = $stm->execute([":alias" => $this->alias, ":id" => $this->id]);
//					} else {da
//					$sql = "UPDATE users  SET title=:title, alias=:alias, picture_url=:picture WHERE id =:id";
						$sql = "UPDATE users  SET 
								title=:title,
 								picture_url=:picture_url,
 								alias=:alias,
 								picture_url=:picture_url,
 								approved=:approved,
 								date_approved=:date_approved,
 								approver_id=:approver_id
 								WHERE id =:id";
						$stm = $this->db->prepare($sql);
						$result = $stm->execute([
							":title" => $this->name,
							":alias" => $this->alias,
							":picture_url" => $this->picture_url,
							":approver_id" => $this->approver_id,
							":date_approved" => $this->date_approved,
							":approved" => $this->approved,
							":id" => $this->id]);



					if (!$result)
						throw new DataBaseUpdateException("no se pudo agregar el usuario, username existente");
				} catch (PDOException $e) {
					echo $sql . "<br>" . $e->getMessage();
				}
				return $this->id;
			}
		}
	}