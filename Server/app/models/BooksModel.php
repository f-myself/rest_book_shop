<?php

namespace app\models;
use app\core as core;
use app\libs as libs;

class BooksModel extends core\Model
{
    /**
     *   
     *  BooksModel class
     *  Take info from DB and return it to BooksController
     * 
    **/
    
    private $sql;

    function __construct()
    {
        $this->sql = new libs\PDOHandler;
    }

    function getAllBooks()
    {

        $allBooks = $this->sql->newQuery()->select(["b.id", "b.title", "b.description", "b.price", "g.genre", "a.author"], true)
                                          ->from("rbs_books b")
                                          ->join("rbs_books_genres bg", "bg.book_id=b.id")
                                          ->join("rbs_genres g", "bg.genre_id=g.id")
                                          ->join("rbs_books_authors ba", "ba.book_id=b.id")
                                          ->join("rbs_authors a", "ba.author_id=a.id")
                                          ->doQuery();
        return $allBooks;		
    }
}