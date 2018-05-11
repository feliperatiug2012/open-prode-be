<?php
	/**
	 * Created by PhpStorm.
	 * User: nullpointer13
	 * Date: 5/6/18
	 * Time: 2:42 PM
	 */

	namespace OpenFixture\Exceptions;
	use Exception;


	class NotEntityIdFoundException extends Exception
	{

		/**
		 * DataBaseUpdateException constructor.
		 * @param $msg
		 */
		public function __construct($msg)
		{
			$this->message=$msg;
		}
	}