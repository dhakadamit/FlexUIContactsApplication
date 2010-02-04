package com.dhakads.model
{
	public class SearchRequest
	{
		
		private var _query:String;
		private var _filter:String;


		public function SearchRequest(query:String, filter:String) 
		{
			this._query = query;
			this._filter = filter;
		}

		public function get query():String {
			return _query;
		}

		public function get filter():String {
			return String(_filter);
		}
	}
}