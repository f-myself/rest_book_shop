<?php

namespace app\models;
use app\core as core;
use app\libs as libs;

class BooksModel extends core\Model
{
    /**
     *   
     *  BooksModel class
     *  Take info from DB and return it to controllers
     *  Works with controllers: book, genre, author
     * 
    **/
    
    private $sql;

    function __construct()
    {
        $this->sql = new libs\PDOHandler;
    }

    public function getAllBooks()
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

    public function getBookById($id)
    {
        if(is_numeric($id))
        {
            $bookById = $this->sql->newQuery()->select(["b.id", "b.title", "b.description", "b.price", "g.genre", "a.author"], true)
                                  ->from("rbs_books b")
                                  ->join("rbs_books_genres bg", "bg.book_id=b.id")
                                  ->join("rbs_genres g", "bg.genre_id=g.id")
                                  ->join("rbs_books_authors ba", "ba.book_id=b.id")
                                  ->join("rbs_authors a", "ba.author_id=a.id")
                                  ->where("b.id=" . $id)
                                  ->doQuery();
        }
        return $bookById;
    }

    public function getAuthors()
    {
        $authors = $this->sql->newQuery()->select(["id", "author"])
                                         ->from("rbs_authors")
                                         ->doQuery();
        return $authors;
    }

    public function getGenres()
    {
        $genres = $this->sql->newQuery()->select(["id", "genre"])
                                        ->from("rbs_genres")
                                        ->doQuery();
        return $genres;
    }
}