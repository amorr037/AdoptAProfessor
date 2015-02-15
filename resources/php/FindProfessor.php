<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class FindProfessor {

    function __construct() {
        $a = new Professor();
        $b = object_to_array($a);
        $c = json_encode($b);
    }

    function object_to_array($data) {
        if (is_array($data) || is_object($data)) {
            $result = array();

            foreach ($data as $key => $value) {
                $result[$key] = $this->object_to_array($value);
            }

            return $result;
        }

        return $data;
    }

}
