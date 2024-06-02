<?php

class Conexion
{
    static public function conectar()
    {
        $link = new PDO("mysql:host=localhost;dbname=repuestos", "root", "p1tt3r0706");
        $link->exec("set names utf8");
        return $link;
    }
}
