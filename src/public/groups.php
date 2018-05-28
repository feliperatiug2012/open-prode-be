<?php

require '../vendor/autoload.php';
require '../autoload_open_fixture.php';
use OpenFixture\Entities\SuperAppEntity;
use OpenFixture\Mappers\GroupMapper;
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

$app = new SuperAppEntity(['ignore' => '/']);

$app->get('/list', function (Request $request, Response $response, $args) use ($app)  {
	$mapper=new  GroupMapper($app->getConn());
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