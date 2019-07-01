<?php

namespace app\controllers;
use app\core as core;
use app\models as models;
use app\api\authors as authors;

class AuthorsController extends core\Controller
{
    /**
     *   
     *  Controller of Authors
     *  Take info about authors by some conditions from BooksModel class and send it into appropiate View.  
     * 
    **/

    function __construct($class)
    {
        $modelNameSpc = 'app\models\\BooksModel';
        $viewNameSpc = 'app\api\authors\\' . $class;

        $this->model = new $modelNameSpc;
        $this->view = new $viewNameSpc;
    }

    public function getAction($input)
    {
        $result = $this->model->getAuthors();
        $this->view->getAuthors($result, $input);
    }

    public function postAction()
    {

    }

    public function putAction()
    {

    }

    public function deleteAction()
    {

    }
}