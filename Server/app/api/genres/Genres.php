<?php

namespace app\api\genres;
use app\core as core;

class Genres extends core\View
{
    /**
     *   
     *  Genres API View file 
     *  Sending code of header and show Response from server
     * 
    **/
    public function getGenres($data="", $viewType="")
    {
        $this->restResponse("200");
        $this->showResponse($data, $viewType);
    }

    public function postGenres()
    {

    }

    public function putGenres()
    {

    }

    public function deleteGenres()
    {

    }
}