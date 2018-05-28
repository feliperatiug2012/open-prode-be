<?php

require '../vendor/autoload.php';
require '../autoload_open_fixture.php';

use OpenFixture\Entities\SuperAppEntity;
use OpenFixture\Mappers;
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;


$app = new SuperAppEntity(['ignore' => '/']);
$app->get('/list', function (Request $request, Response $response, $args) use ($app)  {
	$mapper=new Mappers\CalendarMapper($app->getConn());
	$calendar = $mapper->list();
	$jsonResponse = $response->withJson($calendar);
    return $jsonResponse;
});
// Run app
//todo: MANAGE EXCEPTIONS
$app->run();
?>