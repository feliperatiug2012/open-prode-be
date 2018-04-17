<?php
	/**
	 * Created by PhpStorm.
	 * User: nullpointer13
	 * Date: 4/17/18
	 * Time: 1:09 AM
	 */

	namespace OpenFixture\Exceptions;
	use Exception;

	class DataBaseInsertException extends Exception
	{

		/**
		 * DataBaseInsertException constructor.
		 * @param string $string
		 */
		public function __construct($msg)
		{
			$this->message=$msg;
		}
	}