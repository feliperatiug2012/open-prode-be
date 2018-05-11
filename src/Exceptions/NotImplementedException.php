<?php
	/**
	 * Created by PhpStorm.
	 * User: nullpointer13
	 * Date: 4/15/18
	 * Time: 2:55 PM
	 */

namespace OpenFixture\Exceptions;
use \Exception;
	class NotImplementedException extends Exception
	{
		/**
		 * NotImplementedException constructor.
		 * @param $msg
		 */
		public function __construct($msg)
		{
			$this->message=$msg;
		}
	}