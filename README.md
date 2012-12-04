About
======================
User manager is a set of controllers, models and libraries for dealing with user registration, profiles and management in CI.

Files and folders
======================
application\config
        email.php	contains settings for sending emails
	user_manager.php	contains settings for the user manager

application\controllers
	main.php	testing controller
	user_manager_controller.php	user manager main controller

application\helpers
        um_helper.php	helpers for user manager 
        
application\hooks
        um_hook.php	hook for reporting user activity to the database
        
application\language\english
	user_manager_lang.php	localization

application\libraries
	user_manager.php	User manager library

application\models
	um_users_model.php	model

application\views\user_manager	views
	edit_profile_form.php
login_form.php
profile.php
register_form.php
reset_form.php
reset_pass_form.php
um_msg.php

dps		stores user uploaded profile pictures

pics		stores user uploaded pictures (feature in development)


									
Installation
======================
1. Copy the content of each folder to your root folder.
2. Go to autoload.php and make sure these settings are set.
$autoload['libraries'] = array('database','form_validation','user_manager','session');
$autoload['helper'] = array('url');
$autoload['config'] = array('user_manager');
$autoload['language'] = array('user_manager');
$autoload['model'] = array('um_users_model');
3. User sessions are saved using the session library so you must set an encryption key. On config.php set $config['encryption_key'] = ‘some random stuff';
4. For security set $config['global_xss_filtering'] = true; on config.php
5. Set up your database settings properly on database.php. The default dbprefix is ‘tbl_’ you may open the database.sql with a text editor and replace ‘tbl_’ with your own.  Import the database.sql on to your database.
6. Setup email settings on email.php to receive activation emails.
7. On the routes.php add these lines
$route['register'] = 'user_manager_controller/register';
$route['activate'] = 'user_manager_controller/activate';
$route['login'] = 'user_manager_controller/login';
$route['logout'] = 'user_manager_controller/logout';
$route['profile'] = 'user_manager_controller/show_profile';
$route['editprofile'] = 'user_manager_controller/edit_profile';
$route['resetpass'] = 'user_manager_controller/reset_pass';
$route['reset'] = 'user_manager_controller/reset';
8. To see if everything is working on routes.php set $route['default_controller'] = "main"; and load the site.
9. If you’re installing in a subdirectory make sure you’ve changed the .htaccess file.

Adding your own registration fields
======================
To add your own registration form fields:
1. Add the required columns to your database.
2. Add the new fields to the forms in view folder.
3. Open the user_manager_controller.php  and edit the register() function and the edit_profile() function as needed.
4. Edit the $config['um_register_rules'] and $config['um_profile_rules'] in config/user_manager.php to reflect the new columns.

Email settings
======================
Email sending method and other settings are in config/email.php. More email settings are on config/user_manager.php. 

User status reporting
======================
User manager can save the logged in user data to a table. The data is saved to the ‘tbl_loggedin_users’ table by default and can be accessed later. 
1. To enable this feature you must enable hooks globally. On config.php make sure $config['enable_hooks'] = true;  is set.
2. Put these lines on to the hooks.php
/*
hook for managing the logged in users table
this maybe resource intensive if the site has too much traffic
*/
$hook['post_controller'] = array(
				    'class'    => 'Um_hook',
				    'function' => 'update_user_status',
				    'filename' => 'um_hook.php',
				    'filepath' => 'hooks',
				    'params'   => array()
				    );

Logins older than a certain amount of time will be deleted from this table upon calling the hook. By default this is set to 15 minutes and can be changed at $config['um_login_timeout']=900; in config/user_manager.php.

Helper
======================
User manager has a helper file called um_helper.php. This contains certain helpers that might be useful for re-populating data on forms.


Localization
======================
User manager views can be localized to any language. Edit the application\language\english\user_manager_lang.php file to change the default strings or create your own language file.

Version History
======================
2012-04-16	User manager initial release
