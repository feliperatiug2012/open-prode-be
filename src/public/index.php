<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require '../vendor/autoload.php';

/*************************************************************
 * DB Configuration
 *************************************************************/
$config['displayErrorDetails'] = true;
$config['addContentLengthHeader'] = false;

$config['db']['host']   = 'localhost';
$config['db']['user']   = 'batman';
$config['db']['p$json = json_encode( (array)$object );ass']   = 'batman';
$config['db']['dbname'] = 'rusia2018';
/*************************************************************/

$app = new \Slim\App(['settings' => $config]);

$container = $app->getContainer();

/*************************************************************
 * DB Conection
 *************************************************************/
$container['db'] = function ($c) {
    $db = $c['settings']['db'];
    $pdo = new PDO('mysql:host=' . $db['host'] . ';dbname=' . $db['dbname'],
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
    $response->getBody()->write("Hello, $name probando");
    return $response;
});
/*************************************************************/

/*************************************************************
 * GET all users
 *************************************************************/
$app->get('/users', function (Request $request, Response $response) {
    $mapper = new UserMapper($this->db);
    $users = $mapper->getUsers();
    $jsonResponse = $response->withJson($users);
    return $jsonResponse;
});
/*************************************************************/

/*************************************************************
 * POST user
 *************************************************************/
$app->post('/user/new', function (Request $request, Response $response) {
    $data = $request->getParsedBody();
    $user_data = [];
    $user_data['title'] = filter_var($data['title'], FILTER_SANITIZE_STRING);
    $user_data['alias'] = filter_var($data['alias'], FILTER_SANITIZE_STRING);
    $user_data['username'] = filter_var($data['username'], FILTER_SANITIZE_STRING);
    $user_data['password'] = filter_var($data['password'], FILTER_SANITIZE_STRING);

    $user = new UserEntity($user_data);
    $user_mapper = new UserMapper($this->db);
    $user_mapper->save($user);

    $response = $response->withRedirect("/users");
    return $response;
});
/*************************************************************/

/*************************************************************
 * GET user by id
 *************************************************************/
$app->get('/user/{id}', function (Request $request, Response $response, $args) {
    $user_id = (int)$args['id'];
    $mapper = new UserMapper($this->db);
    $user = $mapper->getUserById($user_id);

    $jsonResponse = $response->withJson($user);
    return $jsonResponse;
})->setName('user-detail');
/*************************************************************/

$app->run();