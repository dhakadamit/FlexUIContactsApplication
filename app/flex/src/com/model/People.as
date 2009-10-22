package com.model
{
	import mx.collections.ArrayList;
		
	[Bindable]
	public class People
	{
		private var list : XML;
		
		public function People()
		{
			this.list = new XML();
		}
		
		public function get details() : XML {
			return this.list;
		}
		
		public function set details(xml : XML) : void {
			this.list = xml;
		}
		

	}
}