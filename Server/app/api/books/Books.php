<?php

namespace app\api\books;
use app\core as core;

class Books extends core\View
{
    /**
     *   
     *  Books API View file 
     *  Sending code of header and show Response from server
     * 
    **/
    public function getBooks($data="", $viewType="")
    {
        $this->restResponse("200");
        $this->showResponse($data, $viewType);
    }

    public function postBooks()
    {

    }

    public function putBooks()
    {

    }

    public function deleteBooks()
    {

    }
}