<?php

namespace app\controllers;
use app\core as core;

class BooksController extends core\Controller
{
    /**
     *   
     *  Controller of books
     *  Take info about books by some conditions from BooksModel class and send it into View.  
     * 
    **/

    function __construct($class)
    {
        $modelNameSpc = 'app\models\\BooksModel';
        $viewNameSpc = 'app\api\books\\' . $class;

        $this->model = new $modelNameSpc;
        $this->view = new $viewNameSpc;
    }

    public function getAction($input)
    {
        $request = $this->parseGetData($input);
        
        $result = $this->model->getAllBooks();
        $this->view->getBooks($result, $input);
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