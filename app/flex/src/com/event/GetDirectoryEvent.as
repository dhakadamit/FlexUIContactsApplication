package com.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.events.Event;
	
	
	public class GetDirectoryEvent extends CairngormEvent
	{
		public static const EVENT_GET_PEOPLE_DETAILS : String = "getPeopleDetails"; 
		
		public function GetDirectoryEvent()
		{
			super( EVENT_GET_PEOPLE_DETAILS );
		}
		
		override public function clone() : Event
		{
			return new GetDirectoryEvent();
		}

	}
}