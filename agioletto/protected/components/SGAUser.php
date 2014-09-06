<?php

/**
 * Overload of CWebUser to set some more methods.
 */
class SGAUser extends CWebUser
{

		
		public function getuserName(){
			return $this->username;
		}
		
		
       
}