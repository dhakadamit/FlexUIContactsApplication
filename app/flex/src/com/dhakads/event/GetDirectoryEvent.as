package com.dhakads.event
{
	import com.adobe.cairngorm.control.CairngormEvent;

	public class GetDirectoryEvent extends CairngormEvent
	{
		public static const GET_DIRECTORY_EVENT:String = "getDirectoryEvent";
		private var _alphabet:String;
		private var _pageNumber:Number = 1;

		public function GetDirectoryEvent(pageNumber:Number = 1, alphabet:String = "")
		{
			super(GET_DIRECTORY_EVENT);
			this._alphabet = alphabet;
			this._pageNumber = pageNumber;
		}
		
		public function get alphabet():String {
			return this._alphabet;
		}
		
		public function get pageNumber():Number {
			return this._pageNumber;
		}
		
	}
}