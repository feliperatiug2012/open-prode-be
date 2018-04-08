<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require '../vendor/autoload.php';
require '../enviromentsManager.php';


$app = new SuperAppEntity();


$app->get('/list', function (Request $request, Response $response, $args) use ($app)  {

		$query='SELECT * FROM V_GAMES_CALENDAR';
        $result = $app->getConn()->query($query);
        while ($user = $result->fetch()) {
            $records[]=$user;
        }

		$jsonResponse = $response->withJson($records);

        return $jsonResponse;
});


// Run app
$app->run();




?>