<?php
	/**
	 * Created by PhpStorm.
	 * User: nullpointer13
	 * Date: 4/12/18
	 * Time: 8:41 PM
	 */
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require '../vendor/autoload.php';
require '../enviromentsManager.php';
$app = new SuperAppEntity();

$app->get('/list', function (Request $request, Response $response, $args) use ($app)  {
	$mapper=new GroupMapper($app->getConn());
	$groups = $mapper->list();
	return  $response->withJson($groups);
});

	$app->get('/view/{id}', function (Request $request, Response $response, $args) use ($app)  {
		$id = (int)$args['id'];
		$mapper=new GroupMapper($app->getConn());
		$group = $mapper->view($id);
		return $response->withJson($group);
	});

// Run app
//todo: MANAGE EXCEPTIONS
$app->run();
?>