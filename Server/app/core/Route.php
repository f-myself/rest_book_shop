<?php

namespace app\core;

class Route
{
    /**
     *   
     *  Routing class
     *  Parse url, choose class and method, start the server
     * 
    **/
    private $service;
    private $url;

    public function __construct()
    {
        $this->url = $_SERVER['REQUEST_URI'];
        $this->method = $_SERVER['REQUEST_METHOD'];
    }

    public function start()
    {
        // list($server, $user, $dir, $taskDir, $serverDir, $apiDir, $className, $input) = explode('/', $this->url, 8);
        list($server, $dir, $serverDir, $apiDir, $className, $input) = explode('/', $this->url, 6);

        // echo $server . "\n";
        // echo $dir . "\n";
        // echo $serverDir . "\n";
        // echo $apiDir . "\n";
        // echo $className . "\n";
        // echo $input . "\n";

        $controllerName = 'app\controllers\\' . ucfirst($className) . 'Controller';
        $controller = new $controllerName($className);

        if (!is_object($controller))
        {
            $this->error404();
        }

        switch($this->method)
        {
            case 'GET':
                if (method_exists($controller, 'getAction'))
                {
                    $controller->getAction($input);
                } else {
                    $this->error404();
                }
                // $result = $this->setMethod('get'.ucfirst($service), explode('/', $params));
                break;
            case 'DELETE':
                if (method_exists($controller, 'deleteAction'))
                {
                    $controller->deleteAction($input);
                } else {
                    $this->error404();
                }
                // $result = $this->setMethod('delete'.ucfirst($service), explode('/', $params));
                break;
            case 'POST':
                if (method_exists($controller, 'postAction'))
                {
                    $controller->postAction($input);
                } else {
                    $this->error404();
                }
                // $params = $_POST;
                // $result = $this->setMethod('post'.ucfirst($service), $params);
                break;
            case 'PUT':
                if (method_exists($controller, 'putAction'))
                {
                    $controller->putAction($input);
                } else {
                    $this->error404();
                }
                // $result = $this->setMethod('put'.ucfirst($service), $params);
                break;
            default:
                $this->error404();
        }
    }

    public function error404()
    {
        $host = 'http://' . $_SERVER['HTTP_HOST'] . '/';
        header('HTTP/1.1 404 Not Found');
        header("Status: 404 Not Found");
        header('Location:' . $host . '404');
    }
}