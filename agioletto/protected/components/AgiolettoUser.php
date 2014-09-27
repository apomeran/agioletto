<?php

/**
 * Overload of CWebUser to set some more methods.
 */
class AgiolettoUser extends CWebUser
{

		public function isAdmin(){
			if (!Yii::app()->user->isGuest)
			return $this->level >= 99; //ADMIN ROL
		   return false;
		}
		
		public function getuserName(){
			return $this->username;
		}
		
		
       
}