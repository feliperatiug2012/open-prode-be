<?php
	/**
	 * Created by PhpStorm.
	 * User: nullpointer13
	 * Date: 4/17/18
	 * Time: 12:11 AM
	 */
	namespace OpenFixture\Entities\User;
	class UserListEntity
	{
		public $name;
		public $alias;
		public $username;
		public $picture_url;
		public $total_points;

		/**
		 * Accept an array of data matching properties of this class
		 * and create the class
		 *
		 * @param array $data The data to use to create
		 * @param \PDO $db
		 */
		public function __construct(array $data, $db) {
			$this->name = $data['name'];
			$this->alias = $data['alias'];
			$this->username = $data['username'];
			$this->picture_url = $data['picture_url'];
			$this->total_points = $data['total_points'];
		}
	}