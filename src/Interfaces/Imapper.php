<?php
	/**
	 * Created by PhpStorm.
	 * User: nullpointer13
	 * Date: 4/10/18
	 * Time: 12:47 AM
	 */
namespace OpenFixture\Interfaces;
	interface Imapper
	{
		/**
		 * Debe listar todos los elementos de la clase
		 * @return array
		 */
		public function list();

		/**
		 * Funcion que debe listar el detalle de un individuo de la clase dado su Id unico
		 * @param $id integer
		 * @return array
		 */
		public function view($id);

		/**
		 * Funcion que debe leliminar un individuo de la clase dado su Id unico
		 * @param $id integer
		 * @return boolean
		 */
		public function delete($id);

		/**
		 * funcion que recibe un objeto de la clase y la agrega o la actualiza en la BD segun sea el caso, el valor que devuelve
		 * es el id unico generado al insertar el registro
		 * @param $entity
		 * @return integer | boolean
		 */
		public function save($entity);


	}