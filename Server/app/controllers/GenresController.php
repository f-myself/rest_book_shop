<?php

namespace app\controllers;
use app\core as core;

class GenresController extends core\Controller
{
    /**
     *   
     *  Controller of Genres
     *  Take info about genres by some conditions from BooksModel class and send it into appropiate View.  
     * 
    **/
    function __construct($class)
    {
        $modelNameSpc = 'app\models\\BooksModel';
        $viewNameSpc = 'app\api\genres\\' . $class;

        $this->model = new $modelNameSpc;
        $this->view = new $viewNameSpc;
    }

    public function getAction($input)
    {
        $result = $this->model->getGenres();
        $this->view->getGenres($result, $input);
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