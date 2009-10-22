package com.model.vo
{
	import mx.collections.ArrayList;
	import mx.collections.IList;
	
	[Bindable]
	public class Person
	{
		private var firstName : String;
		private var lastName : String;
		private var homeContactDetails : ContactDetail;
		private var businesses : IList;
		
		public function Person()
		{
			firstName = new String();
			lastName = new String();
			homeContactDetails = new ContactDetail();
			businesses = new ArrayList();
		}

	}
}