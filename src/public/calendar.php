<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require '../vendor/autoload.php';
require '../enviromentsManager.php';
$app = new SuperAppEntity();
$app->get('/list', function (Request $request, Response $response, $args) use ($app)  {
	$mapper=new CalendarMapper($app->getConn());
	$calendar = $mapper->list();
	$jsonResponse = $response->withJson($calendar);
    return $jsonResponse;
});
// Run app
//todo: MANAGE EXCEPTIONS
$app->run();
?>