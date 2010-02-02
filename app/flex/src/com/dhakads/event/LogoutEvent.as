package com.dhakads.event
{
	import com.adobe.cairngorm.control.CairngormEvent;

	public class LogoutEvent extends CairngormEvent
	{
		public static const LOGOUT_EVENT:String = "logoutEvent";
		
		public function LogoutEvent():void {
			super(LOGOUT_EVENT);
		}
	}
}