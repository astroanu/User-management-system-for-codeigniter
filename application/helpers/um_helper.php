<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
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


if ( ! function_exists('set_radio_state')){
	
	//this will help radio boxes to select it self
	function set_radio_state($var,$val){
		if(isset($var)){
			if ($var==$val){
				echo 'checked="checked"';
			}
		}
	}

	
	
}


?>