<?php


	namespace OpenFixture\Entities;

	use Slim\App;
	use \Firebase\JWT\JWT;

	use OpenFixture\Middlewares\CorsMiddleware;
	use Tuupola\Middleware\JwtAuthentication;


	class SuperAppEntity extends App {

    public $dbConn;

		/**
		 * SuperAppEntity constructor.
		 * @param array|null $authentication_array_conf
		 */
		public function __construct(array $authentication_array_conf=null){
  	    $secret=json_decode(file_get_contents(get_var_enviroment('auth0_tenant')),true)['keys'][0]['x5c'][0];
	    $secret="-----BEGIN CERTIFICATE-----\n".$secret."\n-----END CERTIFICATE-----";
	/*    var_dump($secret);
	    exit();
	    $secret="-----BEGIN CERTIFICATE-----
MIIDBzCCAe+gAwIBAgIJD/XvBgOdzDUMMA0GCSqGSIb3DQEBCwUAMCExHzAdBgNV
BAMTFm9wZW4tZml4dHVyZS5hdXRoMC5jb20wHhcNMTgwNDExMDQyNzI2WhcNMzEx
MjE5MDQyNzI2WjAhMR8wHQYDVQQDExZvcGVuLWZpeHR1cmUuYXV0aDAuY29tMIIB
IjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAqrZcX/TlYuqLl8C6pg18LhvQ
HBse2n7VmdwAoMBJbbpqM5b7V6LbGKv2iRXRGvZ6s9g3jpWv2whQmGo9IWOTbqqp
XeamO063VOKmBtYWP5FHqM9vdMzHXNofX4bxJHh02f1GckJXq44LPAVhjc4i2j9D
DU+v8KzsMKcNyxrikgSqOKUMI7XANbuYghhQs4i9N+L5xJ2Zdq782OVaBrzkm17A
88Plavwg0juB0enUDwFFbvt3WrkTx3ey5jnD+kzAeXzmiRel87kFJzKYDiAiljl2
Y4n55Rv3zzsiaIqyPK18m1Ik4qHUCHsiaES3zP4vJTpzq4T6DQPMqD36rRS2swID
AQABo0IwQDAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBRwCr+TeqZOzqiVQS2H
wzodYybFCDAOBgNVHQ8BAf8EBAMCAoQwDQYJKoZIhvcNAQELBQADggEBAALhmCAE
wLbTOMZsCQTXJvVo+YJyyGAaOi+qJd6ejf0cfRKccKtHIL96sqxmFc7riSqDzDRu
yT2O449AbWKcREk2Ljec3H6WIrw9PFJuW/WdOnj/1XZ5XrTVl1XAwZlkjn8JJMUb
l6Dt5EiNtZ4WtKc+ZmqYxTxl0tY9QaZk4ZIyPD3srhfOQzoLsiJleNYa+yhr6X37
N/ZPcvScYCnTOY+g9UMry1mNBpaQWqaEigo3Iqoz7a3CUK/QumtiwiPhauENnhH4
K2NhMfP0lEQsBq3aSGRiPDZgTftKQMWLz1WGH5hKjnNsgmuZTLWxiQhq6+5Sh1WN
BwYlaAtMgX0WIUw=
-----END CERTIFICATE-----";*/

	    $conf= get_var_enviroment('configuration');
    	parent::__construct($conf);

        $this->dbConn = getEnviromentDataBase();
        $this->add(New CorsMiddleware());

	    $authentication_array_conf['path'] = "/";
	    $authentication_array_conf['secret'] =$secret;
	    $authentication_array_conf['algorithm'] =get_var_enviroment('auth0-encrypt-algorithm');
//	    $authentication_array_conf['secure'] =false;
		$authentication_array_conf['secure'] =get_var_enviroment('jwt-over-https');

	    $this->add(new JwtAuthentication($authentication_array_conf));
    }

    /************* GETTERS ***********/
    public function getConn(){
        return $this->dbConn;
    }

};

?>