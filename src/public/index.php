<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require '../vendor/autoload.php';

/*************************************************************
 * DB Conection
 *************************************************************/
$config['displayErrorDetails'] = true;
$config['addContentLengthHeader'] = false;

$config['db']['host']   = 'localhost';
$config['db']['user']   = 'batman';
$config['db']['pass']   = 'batman';
$config['db']['dbname'] = 'rusia2018';
/*************************************************************/

$app = new \Slim\App(['settings' => $config]);
$app->get('/hello/{name}', function (Request $request, Response $response, array $args) {
    $name = $args['name'];
    $response->getBody()->write("Hello, $name");

    return $response;
});
$app->run();