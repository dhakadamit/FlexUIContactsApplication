package com.dhakads.event
{
	import com.adobe.cairngorm.control.CairngormEvent;

	public class SearchEvent extends CairngormEvent
	{
		public static const SEARCH_EVENT:String = "searchEvent";
		
		private var _query:String;
		private var _filter:String;
		private var _pageNumber:Number;
		private var _callback:Function;

		public function SearchEvent(query:String, filter:String = "name", pageNumber:Number = 1, callback:Function = null)
		{
			super(SEARCH_EVENT);
			this._query = query;
			this._filter = filter;
			this._pageNumber = pageNumber;
			this._callback = callback;
		}

		public function get query():String {
			return _query;
		}
		
		public function get callback():Function {
			return _callback;
		}

		public function set query(value:String):void {
			_query = value;
		}

		public function get filter():String {
			return _filter;
		}

		public function set filter(value:String):void {
			_filter = value;
		}

		public function get pageNumber():Number {
			return _pageNumber;
		}

		public function set pageNumber(value:Number):void {
			_pageNumber = value;
		}

	}
}