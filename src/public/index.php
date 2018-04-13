<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require '../vendor/autoload.php';
require '../enviromentsManager.php';
$app = new SuperAppEntity();

$app->get('/users', function (Request $request, Response $response) use ($app)  {
    $mapper = new UserMapper($app->getConn());
    $users = $mapper->getUsers();
    $jsonResponse = $response->withJson($users);
    return $jsonResponse;
});

$app->post('/user/new', function (Request $request, Response $response) use ($app) {
    $data = $request->getParsedBody();
    $user_data = [];
    $user_data['title'] = filter_var($data['title'], FILTER_SANITIZE_STRING);
    $user_data['alias'] = filter_var($data['alias'], FILTER_SANITIZE_STRING);
    $user_data['username'] = filter_var($data['username'], FILTER_SANITIZE_STRING);
    $user_data['password'] = filter_var($data['password'], FILTER_SANITIZE_STRING);

    $user = new UserEntity($user_data);
    $user_mapper = new UserMapper($app->getConn());
    $user_mapper->save($user);

    $response = $response->withRedirect("/users");
    return $response;
});

$app->get('/user/{id}', function (Request $request, Response $response, $args) use ($app)  {
    $user_id = (int)$args['id'];
    $mapper = new UserMapper($app->getConn());
    $user = $mapper->getUserById($user_id);
    $jsonResponse = $response->withJson($user);
    return $jsonResponse;
})->setName('user-detail');



$app->run();