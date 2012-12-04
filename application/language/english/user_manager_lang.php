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


$lang['um_form_msg']='Fill in this form to get your membership. Fields marked in <font color="red">*</font> are mandatory';
$lang['um_form_error']='An error occured while submitting your data. Please check again.';

$lang['um_form_activate']='An email has be send to the address you specified. You need to click the link on the email to activate.';
$lang['um_form_activate_failed']='you followed an incorrect url or this activation url has expired';
$lang['um_form_activate_success']='Your account has been activated. you may now <a href="login">login</a>';
$lang['um_form_activate_error']='this account is already active';

$lang['um_login_msg']='login to your account';
$lang['um_login_invalid_pass']='the password you entered is invalid';
$lang['um_login_blocked']='your account has been blocked';
$lang['um_login_not_active']='you havent activated your account';
$lang['um_login_user_not_found']='this user does not exist';

$lang['um_reset_msg']='enter your email to receive a password reset request';
$lang['um_reset_sent']='a password reset request has been sent to your email';
$lang['um_reset_failed']='Could not reset your password. you may try again.';
$lang['um_reset_msg2']='enter your new password twice';
$lang['um_reset_success']='Your password has been reset you may <a href="login">login</a> with the new password';
$lang['um_reset_error']='an error occured while saving your new password. You will have to get a new <a href="reset">password reset request</a>';

$lang['um_profile_msg']='You can edit your profile here';
$lang['um_profile_update_success']='Your profile was updated';
$lang['um_profile_update_failed']='Could not update your profile';
$lang['um_profile_update_error']='an error occured while updating your profile';
?>