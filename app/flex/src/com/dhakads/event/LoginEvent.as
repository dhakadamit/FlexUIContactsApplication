package com.dhakads.event
{
	import com.adobe.cairngorm.control.CairngormEvent;

	public class LoginEvent extends CairngormEvent
	{
		public static const LOGIN_EVENT:String = "login";
		
		private var _username:String;
		private var _password:String;
		
		public function LoginEvent(username:String, password:String)
		{
			super(LOGIN_EVENT, true);
			this._username = username;
			this._password = password;
		}
		
		public function get username():String {
			return this._username;
		}
		
		public function get password():String {
			return this._password;
		}
		
	}
}