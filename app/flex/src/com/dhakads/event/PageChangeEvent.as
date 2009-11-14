package com.dhakads.event
{
	import com.adobe.cairngorm.control.CairngormEvent;

	public class PageChangeEvent extends CairngormEvent
	{
		public static const PAGE_CHANGE_EVENT:String = "changePage";
		private var _pageNumber:Number;
		
		public function PageChangeEvent(pageNumber:Number)
		{
			super(PAGE_CHANGE_EVENT, true);
			this._pageNumber = pageNumber;
		}
		
		public function get pageNumber():Number {
			return this._pageNumber;
		}
		
	}
}