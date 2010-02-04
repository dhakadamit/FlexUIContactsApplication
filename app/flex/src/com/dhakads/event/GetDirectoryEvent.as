package com.dhakads.event
{
	import com.adobe.cairngorm.control.CairngormEvent;

	public class GetDirectoryEvent extends CairngormEvent
	{
		public static const GET_DIRECTORY_EVENT:String = "getDirectoryEvent";
		private var _alphabet:String;
		private var _pageNumber:Number = 1;
		private var _callback:Function;

		public function GetDirectoryEvent(pageNumber:Number = 1, alphabet:String = "", callback:Function = null)
		{
			super(GET_DIRECTORY_EVENT);
			this._alphabet = alphabet;
			this._pageNumber = pageNumber;
			this._callback = callback;
		}
		
		public function get alphabet():String {
			return this._alphabet;
		}
		
		public function get pageNumber():Number {
			return this._pageNumber;
		}
		
		public function get callback():Function {
			return _callback;
		}

		
	}
}