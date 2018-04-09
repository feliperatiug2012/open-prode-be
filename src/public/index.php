<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require '../vendor/autoload.php';

/*************************************************************
 * DB Configuration
 *************************************************************/
$config['displayErrorDetails'] = true;
$config['addContentLengthHeader'] = false;

$config['db']['host']   = '192.168.56.101';
$config['db']['user']   = 'batman';
$config['db']['pass']   = 'batman';
$config['db']['dbname'] = 'open_fixture';
/*************************************************************/

$app = new \Slim\App(['settings' => $config]);

$container = $app->getContainer();

/*************************************************************
 * DB Conection
 *************************************************************/
$container['db'] = function ($c) {
    $db = $c['settings']['db'];
    $pdo = new PDO('mysql:host=' . $db['host'] . ';dbname=' . $db['dbname']. ";charset=utf8",
        $db['user'], $db['pass']);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
    return $pdo;
};
/*************************************************************/

/*************************************************************
 * GET prueba
 *************************************************************/
$app->get('/hello/{name}', function (Request $request, Response $response, array $args) {
    $name = $args['name'];
    $response->getBody()->write("Hello, $name");

    return $response;
});
/*************************************************************/

/*************************************************************
 * GET Groups
 *************************************************************/
$app->get('/groups', function (Request $request, Response $response, $args) {
    $mapper = new GroupMapper($this->db);
    $groups = $mapper->getGroups();

    $jsonResponse = $response->withJson($groups);
    return $jsonResponse;
});
/*************************************************************/
/*************************************************************
 * GET group by id
 *************************************************************/
$app->get('/group/{id}', function (Request $request, Response $response, $args) {
    $group_id = (int)$args['id'];
    $mapper = new GroupMapper($this->db);
    $group = $mapper->getGroupById($group_id);

    $jsonResponse = $response->withJson($group);
    return $jsonResponse;
})->setName('group-detail');
/*************************************************************/

$app->run();