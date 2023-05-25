<?php

class Home extends BaseController
{
    public function index()
    {

        $data = [
            'title' => 'Oefentoets MVC-framework'
        ];

        $this->view('home/index', $data);
    }
}