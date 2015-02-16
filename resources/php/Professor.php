<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class Professor implements JsonSerializable{
    private $title;
    private $name;
    private $lastname;
    private $website;
    
    function __construct() {
        $title = "Dr.";
        $name = "Dayan";
        $lastname = "yamin";
        $website = "www.dr.com";
    }

    public function jsonSerialize() {
        return array(
          'title' => $this->title,  
          'name' => $this->name,  
          'lastname' => $this->lastname,  
          'website' => $this->website,  
        );
        
    }

}

