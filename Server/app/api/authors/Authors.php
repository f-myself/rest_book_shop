<?php

namespace app\api\authors;
use app\core as core;

class Authors extends core\View
{
    /**
     *   
     *  Authors API View file 
     *  Sending code of header and show Response from server
     * 
    **/

    public function getAuthors($data="", $viewType="")
    {
        $this->restResponse("200");
        $this->showResponse($data, $viewType);
    }

    public function postAuthors()
    {

    }

    public function putAuthors()
    {

    }

    public function deleteAuthors()
    {

    }
}