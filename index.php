<?php

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require_once "vendor/autoload.php";
/**
 * Created by PhpStorm.
 * User: nullpointer13
 * Date: 3/24/18
 * Time: 11:11 PM
 */

/**
 * @param Request $request
 * @param Response $response
 * @param $next
 * @return Response
 */
$myMiddleware = function ($request, $response, $next) {
    $response->getBody()->write("BEFORE BODY: this is a middleware ... it works.. and this is a cool thing");
    $response = $next($request, $response);
    $response->getBody()->write('AFTER BODY: carteluo er mio!!!');



    return $response;
};

$app= new Slim\App();

$app->get("/",function(){


    echo "Welcome to Open-Fixture's API";
});




$app->get("/hola/{name:[a-zA-Z]*}/[{hh:[0-9]}]",function(Request $request, Response $response, array $args) {
    $name = $args['name'];
    if (isset($args['hh']))
        $hh = $args['hh'];
    else
        $hh = null;

    $response->getBody()->write(" hola " . $name . " " . $hh);

})->add($myMiddleware);

try {
    $app->run();

} catch (\Slim\Exception\MethodNotAllowedException $e) {
} catch (\Slim\Exception\NotFoundException $e) {
} catch (Exception $e) {
}

