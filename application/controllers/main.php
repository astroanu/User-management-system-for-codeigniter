<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
////////////////////////////////////////
//////USER MANAGER FOR CODEIGNITER//////
/////////////version 1.0.0//////////////
////////////////////////////////////////
///written by - Anuradha Jayathilaka
///email - me@anu3d.info
///web - www.anu3d.info
////////////////////////////////////////
//This code is free to use in any project.
//please leave this information if you're using this. thanks :)
////////////////////////////////////////


class Main extends CI_Controller {
//this is a test controller
	public function index(){
		$this->load->view('user_manager/um_test');
	}


}

